package io.phoos.api;

/**
 * @author evanwht1@gmail.com
 */
@FunctionalInterface
public interface ParamHandler<T, U> {
	T call(U param) throws Exception;
}
