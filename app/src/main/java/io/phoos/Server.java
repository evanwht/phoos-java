package io.phoos;

import com.fasterxml.jackson.databind.ObjectMapper;
import io.javalin.Javalin;
import io.javalin.http.NotFoundResponse;
import io.javalin.http.staticfiles.Location;
import io.javalin.plugin.json.JavalinJackson;
import io.phoos.event.EventsHandler;
import io.phoos.game.GamesHandler;
import io.phoos.middleware.AuthHandler;
import io.phoos.player.PlayersHandler;
import io.phoos.standings.StandingsHandler;
import org.aeonbits.owner.ConfigFactory;
import org.flywaydb.core.Flyway;

import java.sql.SQLException;

import static io.javalin.apibuilder.ApiBuilder.delete;
import static io.javalin.apibuilder.ApiBuilder.get;
import static io.javalin.apibuilder.ApiBuilder.path;
import static io.javalin.apibuilder.ApiBuilder.post;
import static io.javalin.apibuilder.ApiBuilder.put;
import static io.javalin.core.security.SecurityUtil.roles;
import static io.phoos.api.JsonApiBuilder.deleteJSON;
import static io.phoos.api.JsonApiBuilder.getJSON;
import static io.phoos.api.JsonApiBuilder.postJSON;
import static io.phoos.api.JsonApiBuilder.putJSON;

/**
 * @author evanwht1@gmail.com
 */
public class Server {

	private static final ObjectMapper objectMapper = new ObjectMapper();

	public static void main(String[] args) {
		final DBProperties dbProperties = ConfigFactory.create(DBProperties.class);
		performMigrations(dbProperties);

		final DB db;
		try {
			db = new DB(dbProperties);
		} catch (SQLException e) {
			throw new RuntimeException("Could not connect to DB", e);
		}

		Javalin app = Javalin.create(c -> {
			c.enableCorsForAllOrigins();
			c.addStaticFiles("/games", "public/", Location.CLASSPATH);
			c.addStaticFiles("/standings", "public/", Location.CLASSPATH);
			c.addStaticFiles("public/", Location.CLASSPATH);
			c.accessManager(new AuthHandler(db));
		});

		JavalinJackson.configure(objectMapper);

		initPlayersAPI(db, app);
		initStandingsAPI(db, app);
		initGamesAPI(db, app);
		initAdminAPI(db, app);
		app.get("refresh_db", db::refresh);

		app.exception(NotFoundResponse.class, (e, ctx) -> {
			ctx.status(404);
			ctx.result(e.getMessage());
		});
		app.exception(SQLException.class, (e, ctx) -> {
			ctx.status(500);
			ctx.result(e.getMessage());
		});

		app.start(ConfigFactory.create(ServerProperties.class).port());

		Runtime.getRuntime().addShutdownHook(new Thread(app::stop));
	}

	/**
	 * Performs migrations on the database. Flyway looks in src/main/resources/db/migration/ for migrations to run.
	 * Migrations there should follow the naming patter VX__Migration_name.sql where X is the next number after the
	 * most recent migration.
	 *
	 * @param dbProperties db properties for host, username, and password
	 */
	private static void performMigrations(final DBProperties dbProperties) {
		final String connectString = dbProperties.connectionType() + dbProperties.host();
		final Flyway flyway = Flyway.configure()
									.baselineOnMigrate(true)
									.dataSource(connectString, dbProperties.user(), dbProperties.password())
									.load();
		flyway.migrate();
	}

	private static void initStandingsAPI(final DB db, final Javalin app) {
		final StandingsHandler standingsHandler = new StandingsHandler(db);
		app.routes(() -> {
			path("api/standings", () -> {
				getJSON(standingsHandler::getAll, roles(Roles.ANYONE));
			});
		});
	}

	private static void initAdminAPI(final DB db, final Javalin app) {
		final EventsHandler eventsHandler = new EventsHandler(db);
		app.routes(() -> {
			path("api/events", () -> {
				get(eventsHandler::getAll, roles(Roles.ANYONE));
				post(eventsHandler::post, roles(Roles.USER));
				path(":id", () -> {
					get(eventsHandler::get, roles(Roles.ANYONE));
					put(eventsHandler::put, roles(Roles.ADMIN));
					delete(eventsHandler::delete, roles(Roles.ADMIN));
				});
			});
		});
	}

	private static void initPlayersAPI(final DB db, final Javalin app) {
		final PlayersHandler playersHandler = new PlayersHandler(db);
		app.routes(() -> {
			path("api/players", () -> {
				getJSON(playersHandler::getAll, roles(Roles.USER));
				postJSON(playersHandler::create, playersHandler::newPlayer, roles(Roles.USER));
				path(":id", () -> {
					getJSON(playersHandler::get, playersHandler::idPathParam, roles(Roles.USER));
					putJSON(playersHandler::update, playersHandler::playerUpdates, roles(Roles.USER));
					deleteJSON(playersHandler::delete, playersHandler::idPathParam, roles(Roles.USER));
				});
			});
		});
	}

	private static void initGamesAPI(final DB db, final Javalin app) {
		final GamesHandler gamesHandler = new GamesHandler(db);
		app.routes(() -> {
			path("api/games", () -> {
				getJSON(gamesHandler::getAll, roles(Roles.USER));
				postJSON(gamesHandler::post, gamesHandler::newGame, roles(Roles.USER));
				path(":id", () -> {
					getJSON(gamesHandler::get, gamesHandler::idPathParam, roles(Roles.USER));
					putJSON(gamesHandler::put, gamesHandler::gameUpdates, roles(Roles.USER));
					deleteJSON(gamesHandler::delete, gamesHandler::idPathParam, roles(Roles.USER));
				});
			});
		});
	}
}
