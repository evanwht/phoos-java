package io.phoos.game;

import io.javalin.http.Context;
import org.jetbrains.annotations.NotNull;

import java.sql.Connection;

/**
 * @author evanwht1@gmail.com
 */
public class GamesHandler {

	private final Connection db;

	public GamesHandler(final Connection db) {
		this.db = db;
	}

	public void getAll(@NotNull final Context ctx) throws Exception {
		// TODO execute query on db
	}

	public void get(@NotNull final Context ctx) throws Exception {
		Integer id = ctx.queryParam("id", Integer.class).check(i -> i > 0).get();
		// TODO execute query on db
	}

	public void put(@NotNull final Context ctx) throws Exception {
		Integer id = ctx.queryParam("id", Integer.class).check(i -> i > 0).get();
		// TODO execute query on db
	}

	public void delete(@NotNull final Context ctx) throws Exception {
		Integer id = ctx.queryParam("id", Integer.class).check(i -> i > 0).get();
		// TODO execute query on db
	}

	public void post(@NotNull final Context ctx) throws Exception {
		// TODO execute query on db
	}
}
