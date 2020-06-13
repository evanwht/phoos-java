package io.phoos.event;

import io.phoos.player.Player;

import java.util.Objects;

/**
 * @author evanwht1@gmail.com
 */
public class GameEvent {

	private final Event type;
	private final Player by;
	private final Player on;

	private GameEvent(final Builder b) {
		this.type = b.type;
		this.by = b.by;
		this.on = b.on;
	}

	public static Builder newBuilder() {
		return new Builder();
	}

	public Event getType() {
		return type;
	}

	public Player getBy() {
		return by;
	}

	public Player getOn() {
		return on;
	}

	public static class Builder {
		private Event type;
		private Player by;
		private Player on;

		private Builder() {
		}

		public Builder type(final Event type) {
			this.type = type;
			return this;
		}

		public Builder by(final Player by) {
			this.by = by;
			return this;
		}

		public Builder on(final Player on) {
			this.on = on;
			return this;
		}

		public GameEvent build() {
			return new GameEvent(this);
		}
	}
}
