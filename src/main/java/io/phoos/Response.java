package io.phoos;

/**
 * @author evanwht1@gmail.com
 */
public class Response {

	private final String message;
	private final int statusCode;

	public Response(final String message, final int statusCode) {
		this.message = message;
		this.statusCode = statusCode;
	}

	public String getMessage() {
		return message;
	}

	public int getStatusCode() {
		return statusCode;
	}
}
