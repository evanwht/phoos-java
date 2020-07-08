package io.phoos.game;

import io.javalin.http.BadRequestResponse;
import io.javalin.http.Context;
import io.javalin.http.NotFoundResponse;
import io.phoos.DB;
import io.phoos.Response;
import io.phoos.player.Player;
import io.phoos.sql.DeleteBuilder;
import io.phoos.sql.InsertBuilder;
import io.phoos.sql.SelectBuilder;
import io.phoos.sql.UpdateBuilder;
import org.eclipse.jetty.http.HttpStatus;
import org.jetbrains.annotations.NotNull;

import java.sql.Timestamp;
import java.time.Instant;
import java.util.List;
import java.util.Optional;
import java.util.OptionalInt;
import java.util.OptionalLong;

/**
 * @author evanwht1@gmail.com
 */
public class GamesHandler {

	private final DB db;

	public GamesHandler(final DB db) {
		this.db = db;
	}

	public List<Game> getAll() throws Exception {
		return new SelectBuilder<>(
				rs -> Game.newBuilder()
						  .id(rs.getInt(LastGamesView.Columns.ID.getName()))
						  .played(rs.getTimestamp(LastGamesView.Columns.GAME_DATE.getName()).toInstant())
						  .team1(Team.builder()
									 .setDefense(Player.newBuilder()
													   .id(rs.getInt(LastGamesView.Columns.TEAM_1_D_ID.getName()))
													   .name(rs.getString(LastGamesView.Columns.TEAM_1_D.getName()))
													   .build())
									 .setOffense(Player.newBuilder()
													   .id(rs.getInt(LastGamesView.Columns.TEAM_1_O_ID.getName()))
													   .name(rs.getString(LastGamesView.Columns.TEAM_1_O.getName()))
													   .build())
									 .build())
						  .team2(Team.builder()
									 .setDefense(Player.newBuilder()
													   .id(rs.getInt(LastGamesView.Columns.TEAM_2_D_ID.getName()))
													   .name(rs.getString(LastGamesView.Columns.TEAM_2_D.getName()))
													   .build())
									 .setOffense(Player.newBuilder()
													   .id(rs.getInt(LastGamesView.Columns.TEAM_2_O_ID.getName()))
													   .name(rs.getString(LastGamesView.Columns.TEAM_2_O.getName()))
													   .build())
									 .build())
						  .team1HalfScore(rs.getInt(LastGamesView.Columns.TEAM_1_HALF.getName()))
						  .team2HalfScore(rs.getInt(LastGamesView.Columns.TEAM_2_HALF.getName()))
						  .team1FinalScore(rs.getInt(LastGamesView.Columns.TEAM_1_FINAL.getName()))
						  .team2FinalScore(rs.getInt(LastGamesView.Columns.TEAM_2_FINAL.getName()))
						  .build())
				.table(LastGamesView.VIEW_NAME)
				.select(LastGamesView.Columns.ID)
				.select(LastGamesView.Columns.GAME_DATE)
				.select(LastGamesView.Columns.TEAM_1_D_ID)
				.select(LastGamesView.Columns.TEAM_1_D)
				.select(LastGamesView.Columns.TEAM_1_O_ID)
				.select(LastGamesView.Columns.TEAM_1_O)
				.select(LastGamesView.Columns.TEAM_2_D_ID)
				.select(LastGamesView.Columns.TEAM_2_D)
				.select(LastGamesView.Columns.TEAM_2_O_ID)
				.select(LastGamesView.Columns.TEAM_2_O)
				.select(LastGamesView.Columns.TEAM_1_HALF)
				.select(LastGamesView.Columns.TEAM_2_HALF)
				.select(LastGamesView.Columns.TEAM_1_FINAL)
				.select(LastGamesView.Columns.TEAM_2_FINAL)
				.getMany(db.getConnection());
	}

	public int idPathParam(@NotNull Context ctx) {
		return ctx.pathParam("id", Integer.class)
				  .check(i -> i > 0, "Not a valid id")
				  .get();
	}

	public Game get(final int id) throws Exception {
		final Optional<Game> game = new SelectBuilder<>(
				rs -> Game.newBuilder()
						  .id(rs.getInt(LastGamesView.Columns.ID.getName()))
						  .played(rs.getTimestamp(LastGamesView.Columns.GAME_DATE.getName()).toInstant())
						  .team1(Team.builder()
									 .setDefense(Player.newBuilder()
													   .id(rs.getInt(LastGamesView.Columns.TEAM_1_D_ID.getName()))
													   .name(rs.getString(LastGamesView.Columns.TEAM_1_D.getName()))
													   .build())
									 .setOffense(Player.newBuilder()
													   .id(rs.getInt(LastGamesView.Columns.TEAM_1_O_ID.getName()))
													   .name(rs.getString(LastGamesView.Columns.TEAM_1_O.getName()))
													   .build())
									 .build())
						  .team2(Team.builder()
									 .setDefense(Player.newBuilder()
													   .id(rs.getInt(LastGamesView.Columns.TEAM_2_D_ID.getName()))
													   .name(rs.getString(LastGamesView.Columns.TEAM_2_D.getName()))
													   .build())
									 .setOffense(Player.newBuilder()
													   .id(rs.getInt(LastGamesView.Columns.TEAM_2_O_ID.getName()))
													   .name(rs.getString(LastGamesView.Columns.TEAM_2_O.getName()))
													   .build())
									 .build())
						  .team1HalfScore(rs.getInt(LastGamesView.Columns.TEAM_1_HALF.getName()))
						  .team2HalfScore(rs.getInt(LastGamesView.Columns.TEAM_2_HALF.getName()))
						  .team1FinalScore(rs.getInt(LastGamesView.Columns.TEAM_1_FINAL.getName()))
						  .team2FinalScore(rs.getInt(LastGamesView.Columns.TEAM_2_FINAL.getName()))
						  .build())
				.table(LastGamesView.VIEW_NAME)
				.select(LastGamesView.Columns.ID)
				.select(LastGamesView.Columns.GAME_DATE)
				.select(LastGamesView.Columns.TEAM_1_D_ID)
				.select(LastGamesView.Columns.TEAM_1_D)
				.select(LastGamesView.Columns.TEAM_1_O_ID)
				.select(LastGamesView.Columns.TEAM_1_O)
				.select(LastGamesView.Columns.TEAM_2_D_ID)
				.select(LastGamesView.Columns.TEAM_2_D)
				.select(LastGamesView.Columns.TEAM_2_O_ID)
				.select(LastGamesView.Columns.TEAM_2_O)
				.select(LastGamesView.Columns.TEAM_1_HALF)
				.select(LastGamesView.Columns.TEAM_2_HALF)
				.select(LastGamesView.Columns.TEAM_1_FINAL)
				.select(LastGamesView.Columns.TEAM_2_FINAL)
				.where(LastGamesView.Columns.ID, id)
				.getOne(db.getConnection());
		return game.orElseThrow(() -> new NotFoundResponse("Requested Game does not exist"));
	}

	public Game gameUpdates(@NotNull Context ctx) {
		final int id = ctx.pathParam("id", Integer.class).check(i -> i > 0).get();
		return Game.from(ctx.bodyValidator(Game.class)
							.check(g -> (g.getTeam1FinalScore()  == 0 || g.getTeam1FinalScore() <= 15)
									&& (g.getTeam2FinalScore()  == 0 || g.getTeam2FinalScore() <= 15)
									&& (g.getTeam1HalfScore()  == 0 || g.getTeam1HalfScore() <= 5)
									&& (g.getTeam2HalfScore()  == 0 || g.getTeam2HalfScore() <= 5))
							.get())
				   .id(id)
				   .build();
	}

	public Response put(final Game game) throws Exception {
		final UpdateBuilder builder = new UpdateBuilder()
				.table(GamesTable.TABLE_NAME)
				.where(GamesTable.Columns.ID, game.getId());
		if (game.getPlayed() != null) {
			builder.value(GamesTable.Columns.GAME_DATE, game.getPlayed().toEpochMilli());
		}
		if (game.getTeam1() != null) {
			final Team team = game.getTeam1();
			if (team.getDefense() != null) {
				builder.value(GamesTable.Columns.TEAM_1_P1, team.getDefense().getId());
			}
			if (team.getOffense() != null) {
				builder.value(GamesTable.Columns.TEAM_1_P2, team.getOffense().getId());
			}
		}
		if (game.getTeam2() != null) {
			final Team team = game.getTeam2();
			if (team.getDefense() != null) {
				builder.value(GamesTable.Columns.TEAM_2_P1, team.getDefense().getId());
			}
			if (team.getOffense() != null) {
				builder.value(GamesTable.Columns.TEAM_2_P2, team.getOffense().getId());
			}
		}
		if (game.getTeam1HalfScore() > 0) {
			builder.value(GamesTable.Columns.TEAM_1_HALF, game.getTeam1HalfScore());
		}
		if (game.getTeam2HalfScore() > 0) {
			builder.value(GamesTable.Columns.TEAM_2_HALF, game.getTeam2HalfScore());
		}
		if (game.getTeam1FinalScore() > 0) {
			builder.value(GamesTable.Columns.TEAM_1_FINAL, game.getTeam1FinalScore());
		}
		if (game.getTeam2FinalScore() > 0) {
			builder.value(GamesTable.Columns.TEAM_2_FINAL, game.getTeam2FinalScore());
		}
		OptionalInt rows = builder.execute(db.getConnection());
		if (rows.isPresent()) {
			return new Response("New game data saved for: " + game.getId(), HttpStatus.OK_200);
		}
		throw new NotFoundResponse("No Data updated for: " + game.getId());
	}

	public Response delete(final int id) throws Exception {
		OptionalInt rows = new DeleteBuilder()
				.table(GamesTable.TABLE_NAME)
				.where(GamesTable.Columns.ID, id)
				.execute(db.getConnection());
		if (rows.isPresent()) {
			return new Response("Deleted game: " + id, HttpStatus.OK_200);
		}
		throw new NotFoundResponse("No Game found for " + id);
	}

	public Game newGame(@NotNull Context ctx) {
		return ctx.bodyValidator(Game.class)
				  .check(g -> g.getTeam1FinalScore() <= 15
						  && g.getTeam2FinalScore() <= 15
						  && g.getTeam1HalfScore() <= 5
						  && g.getTeam2HalfScore() <= 5
						  && g.getTeam1() != null
						  && g.getTeam1().getDefense().getId() > 0
						  && g.getTeam1().getOffense().getId() > 0
						  && g.getTeam2() != null
						  && g.getTeam2().getDefense().getId() > 0 
						  && g.getTeam2().getOffense().getId() > 0)
				  .get();
	}

	public Response post(final Game game) throws Exception {
		final OptionalLong id = new InsertBuilder()
				.table(GamesTable.TABLE_NAME)
				.value(GamesTable.Columns.GAME_DATE, Timestamp.from(game.getPlayed()))
				.value(GamesTable.Columns.TEAM_1_P1, game.getTeam1().getDefense().getId())
				.value(GamesTable.Columns.TEAM_1_P2, game.getTeam1().getOffense().getId())
				.value(GamesTable.Columns.TEAM_2_P1, game.getTeam2().getDefense().getId())
				.value(GamesTable.Columns.TEAM_2_P2, game.getTeam2().getOffense().getId())
				.value(GamesTable.Columns.TEAM_1_HALF, game.getTeam1HalfScore())
				.value(GamesTable.Columns.TEAM_2_HALF, game.getTeam2HalfScore())
				.value(GamesTable.Columns.TEAM_1_FINAL, game.getTeam1FinalScore())
				.value(GamesTable.Columns.TEAM_2_FINAL, game.getTeam2FinalScore())
				.execute(db.getConnection());
		return new Response("Saved game with new id: " + id.orElseThrow(() -> new BadRequestResponse("Could not save game")),
				HttpStatus.OK_200);
	}
}
