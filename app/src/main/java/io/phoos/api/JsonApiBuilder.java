package io.phoos.api;

import io.javalin.apibuilder.ApiBuilder;
import io.javalin.core.security.Role;
import io.javalin.http.Context;
import org.jetbrains.annotations.NotNull;

import java.util.Set;
import java.util.function.Function;

/**
 * @author evanwht1@gmail.com
 */
public class JsonApiBuilder extends ApiBuilder {

	/**** GET *****/

	public static <T> void getJSON(@NotNull String path, NoParamHandler<T> noParam, Set<Role> roles) {
		get(path, ctx -> ctx.json(noParam.call()), roles);
	}

	public static <T> void getJSON(NoParamHandler<T> noParam, Set<Role> roles) {
		get(ctx -> ctx.json(noParam.call()), roles);
	}

	public static <T, U> void getJSON(@NotNull String path, ParamHandler<T, U> intParam, Function<Context, U> paramGetter, Set<Role> roles) {
		get(path, ctx -> ctx.json(intParam.call(paramGetter.apply(ctx))), roles);
	}

	public static <T, U> void getJSON(ParamHandler<T, U> intParam, Function<Context, U> paramGetter, Set<Role> roles) {
		get(ctx -> ctx.json(intParam.call(paramGetter.apply(ctx))), roles);
	}

	/**** POST ****/

	public static <T> void postJSON(@NotNull String path, NoParamHandler<T> noParam, Set<Role> roles) {
		post(path, ctx -> ctx.json(noParam.call()), roles);
	}

	public static <T> void postJSON(NoParamHandler<T> noParam, Set<Role> roles) {
		post(ctx -> ctx.json(noParam.call()), roles);
	}

	public static <T, U> void postJSON(@NotNull String path, ParamHandler<T, U> intParam, Function<Context, U> paramGetter, Set<Role> roles) {
		post(path, ctx -> ctx.json(intParam.call(paramGetter.apply(ctx))), roles);
	}

	public static <T, U> void postJSON(ParamHandler<T, U> intParam, Function<Context, U> paramGetter, Set<Role> roles) {
		post(ctx -> ctx.json(intParam.call(paramGetter.apply(ctx))), roles);
	}

	/***** PUT ****/

	public static <T> void putJSON(@NotNull String path, NoParamHandler<T> noParam, Set<Role> roles) {
		put(path, ctx -> ctx.json(noParam.call()), roles);
	}

	public static <T> void putJSON(NoParamHandler<T> noParam, Set<Role> roles) {
		put(ctx -> ctx.json(noParam.call()), roles);
	}

	public static <T, U> void putJSON(@NotNull String path, ParamHandler<T, U> intParam, Function<Context, U> paramGetter, Set<Role> roles) {
		put(path, ctx -> ctx.json(intParam.call(paramGetter.apply(ctx))), roles);
	}

	public static <T, U> void putJSON(ParamHandler<T, U> intParam, Function<Context, U> paramGetter, Set<Role> roles) {
		put(ctx -> ctx.json(intParam.call(paramGetter.apply(ctx))), roles);
	}

	/***** DELETE ****/

	public static <T> void deleteJSON(@NotNull String path, NoParamHandler<T> noParam, Set<Role> roles) {
		delete(path, ctx -> ctx.json(noParam.call()), roles);
	}

	public static <T> void deleteJSON(NoParamHandler<T> noParam, Set<Role> roles) {
		delete(ctx -> ctx.json(noParam.call()), roles);
	}

	public static <T, U> void deleteJSON(@NotNull String path, ParamHandler<T, U> intParam, Function<Context, U> paramGetter, Set<Role> roles) {
		delete(path, ctx -> ctx.json(intParam.call(paramGetter.apply(ctx))), roles);
	}

	public static <T, U> void deleteJSON(ParamHandler<T, U> intParam, Function<Context, U> paramGetter, Set<Role> roles) {
		delete(ctx -> ctx.json(intParam.call(paramGetter.apply(ctx))), roles);
	}
}
