package io.phoos.player;

import io.javalin.http.Context;
import io.javalin.http.NotFoundResponse;
import io.phoos.Response;
import io.phoos.sql.DeleteBuilder;
import io.phoos.sql.InsertBuilder;
import io.phoos.sql.SelectBuilder;
import io.phoos.sql.UpdateBuilder;
import org.eclipse.jetty.http.HttpStatus;
import org.eclipse.jetty.util.StringUtil;
import org.jetbrains.annotations.NotNull;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;
import java.util.OptionalInt;
import java.util.OptionalLong;

/**
 * @author evanwht1@gmail.com
 */
public class PlayersHandler {

	private final Connection db;

	public PlayersHandler(final Connection db) {
		this.db = db;
	}

	public List<Player> getAll() throws Exception {
		return new SelectBuilder<>(
				rs -> Player.newBuilder()
							.id(rs.getInt(PlayerTable.Columns.ID.getName()))
							.name(rs.getString(PlayerTable.Columns.NAME.getName()))
							.nickname(rs.getString(PlayerTable.Columns.NICKNAME.getName()))
							.email(rs.getString(PlayerTable.Columns.EMAIL.getName()))
							.build())
				.table(PlayerTable.TABLE_NAME)
				.select(PlayerTable.Columns.ID)
				.select(PlayerTable.Columns.NAME)
				.select(PlayerTable.Columns.NICKNAME)
				.select(PlayerTable.Columns.EMAIL)
				.getMany(db);
	}

	public int idPathParam(@NotNull Context ctx) {
		return ctx.pathParam("id", Integer.class)
				  .check(i -> i > 0, "Not a valid id")
				  .get();
	}

	public Player get(final int id) throws Exception {
		final Optional<Player> player = new SelectBuilder<>(
				rs -> Player.newBuilder()
							.id(rs.getInt(PlayerTable.Columns.ID.getName()))
							.name(rs.getString(PlayerTable.Columns.NAME.getName()))
							.nickname(rs.getString(PlayerTable.Columns.NICKNAME.getName()))
							.email(rs.getString(PlayerTable.Columns.EMAIL.getName()))
							.build())
				.table(PlayerTable.TABLE_NAME)
				.select(PlayerTable.Columns.ID)
				.select(PlayerTable.Columns.NAME)
				.select(PlayerTable.Columns.NICKNAME)
				.select(PlayerTable.Columns.EMAIL)
				.where(PlayerTable.Columns.ID, id)
				.getOne(db);
		return player.orElseThrow(() -> new NotFoundResponse("Requested Player does not exist"));
	}

	public Player playerUpdates(@NotNull Context ctx) {
		final int id = ctx.pathParam("id", Integer.class).check(i -> i > 0).get();
		return Player.from(ctx.bodyValidator(Player.class).get())
					 .id(id)
					 .build();
	}

	public Response update(final Player changes) throws Exception {
		final UpdateBuilder builder = new UpdateBuilder()
				.table(PlayerTable.TABLE_NAME)
				.where(PlayerTable.Columns.ID, changes.getId());
		if (changes.getName() != null) {
			builder.value(PlayerTable.Columns.NAME, changes.getName());
		}
		if (changes.getNickname() != null) {
			builder.value(PlayerTable.Columns.NICKNAME, changes.getNickname());
		}
		if (changes.getEmail() != null) {
			builder.value(PlayerTable.Columns.EMAIL, changes.getEmail());
		}
		final OptionalInt i = builder.execute(db);
		if (i.isPresent()) {
			return new Response("Successfully saved new user values", HttpStatus.OK_200);
		} else {
			throw new SQLException("Error updating user");
		}
	}

	public Response delete(final int id) throws Exception {
		final OptionalInt deleted = new DeleteBuilder().table(PlayerTable.TABLE_NAME)
													   .where(PlayerTable.Columns.ID, id)
													   .execute(db);
		if (deleted.isPresent()) {
			return new Response("delete player: " + id, HttpStatus.OK_200);
		} else {
			throw new SQLException("Could not delete player from db: " + id);
		}
	}

	public Player newPlayer(@NotNull Context ctx) {
		return ctx.bodyValidator(Player.class)
				  .check(p -> !StringUtil.isEmpty(p.getName())
						  && !StringUtil.isEmpty(p.getNickname())
						  && !StringUtil.isEmpty(p.getEmail()))
				  .get();
	}

	public Response create(final Player player) throws Exception {
		OptionalLong newId = new InsertBuilder()
				.table(PlayerTable.TABLE_NAME)
				.value(PlayerTable.Columns.NAME, player.getName())
				.value(PlayerTable.Columns.NICKNAME, player.getNickname())
				.value(PlayerTable.Columns.EMAIL, player.getEmail())
				.execute(db);
		if (newId.isPresent()) {
			return new Response("Created new player with id: " + newId.getAsLong(), HttpStatus.OK_200);
		} else {
			throw new SQLException("No rows affected");
		}
	}
}
