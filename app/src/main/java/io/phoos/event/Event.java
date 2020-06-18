package io.phoos.event;

/**
 * @author evanwht1@gmail.com
 */
public enum Event {
	PULL(1),
	PUSH(2),
	BREAD(3),
	CHEESE(4);

	private final int id;

	Event(final int id) {
		this.id = id;
	}

	public int getId() {
		return id;
	}
}
