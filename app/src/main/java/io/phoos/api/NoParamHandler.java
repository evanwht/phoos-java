package io.phoos.api;

/**
 * @author evanwht1@gmail.com
 */
@FunctionalInterface
public interface NoParamHandler<T> {
	T call() throws Exception;
}
