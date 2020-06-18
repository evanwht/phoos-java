package io.phoos.api;

import io.javalin.apibuilder.ApiBuilder;
import io.javalin.http.Context;
import org.jetbrains.annotations.NotNull;

import java.util.function.Function;

/**
 * @author evanwht1@gmail.com
 */
public class JsonApiBuilder extends ApiBuilder {

	/**** GET *****/

	public static <T> void getJSON(@NotNull String path, NoParamHandler<T> noParam) {
		get(path, ctx -> ctx.json(noParam.call()));
	}

	public static <T> void getJSON(NoParamHandler<T> noParam) {
		get(ctx -> ctx.json(noParam.call()));
	}

	public static <T, U> void getJSON(@NotNull String path, ParamHandler<T, U> intParam, Function<Context, U> paramGetter) {
		get(path, ctx -> ctx.json(intParam.call(paramGetter.apply(ctx))));
	}

	public static <T, U> void getJSON(ParamHandler<T, U> intParam, Function<Context, U> paramGetter) {
		get(ctx -> ctx.json(intParam.call(paramGetter.apply(ctx))));
	}

	/**** POST ****/

	public static <T> void postJSON(@NotNull String path, NoParamHandler<T> noParam) {
		post(path, ctx -> ctx.json(noParam.call()));
	}

	public static <T> void postJSON(NoParamHandler<T> noParam) {
		post(ctx -> ctx.json(noParam.call()));
	}

	public static <T, U> void postJSON(@NotNull String path, ParamHandler<T, U> intParam, Function<Context, U> paramGetter) {
		post(path, ctx -> ctx.json(intParam.call(paramGetter.apply(ctx))));
	}

	public static <T, U> void postJSON(ParamHandler<T, U> intParam, Function<Context, U> paramGetter) {
		post(ctx -> ctx.json(intParam.call(paramGetter.apply(ctx))));
	}

	/***** PUT ****/

	public static <T> void putJSON(@NotNull String path, NoParamHandler<T> noParam) {
		put(path, ctx -> ctx.json(noParam.call()));
	}

	public static <T> void putJSON(NoParamHandler<T> noParam) {
		put(ctx -> ctx.json(noParam.call()));
	}

	public static <T, U> void putJSON(@NotNull String path, ParamHandler<T, U> intParam, Function<Context, U> paramGetter) {
		put(path, ctx -> ctx.json(intParam.call(paramGetter.apply(ctx))));
	}

	public static <T, U> void putJSON(ParamHandler<T, U> intParam, Function<Context, U> paramGetter) {
		put(ctx -> ctx.json(intParam.call(paramGetter.apply(ctx))));
	}

	/***** DELETE ****/

	public static <T> void deleteJSON(@NotNull String path, NoParamHandler<T> noParam) {
		delete(path, ctx -> ctx.json(noParam.call()));
	}

	public static <T> void deleteJSON(NoParamHandler<T> noParam) {
		delete(ctx -> ctx.json(noParam.call()));
	}

	public static <T, U> void deleteJSON(@NotNull String path, ParamHandler<T, U> intParam, Function<Context, U> paramGetter) {
		delete(path, ctx -> ctx.json(intParam.call(paramGetter.apply(ctx))));
	}

	public static <T, U> void deleteJSON(ParamHandler<T, U> intParam, Function<Context, U> paramGetter) {
		delete(ctx -> ctx.json(intParam.call(paramGetter.apply(ctx))));
	}
}
