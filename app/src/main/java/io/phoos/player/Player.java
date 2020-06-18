package io.phoos.player;

import java.util.Objects;

/**
 * @author evanwht1@gmail.com
 */
public class Player {

	private final int id;
	private final String name;
	private final String nickname;
	private final String email;

	public Player() {
		this.id = 0;
		this.name = null;
		this.nickname = null;
		this.email = null;
	}

	private Player(final Builder b) {
		id = b.id;
		name = b.name;
		nickname = b.nickname;
		email = b.email;
	}

	public static Builder newBuilder() {
		return new Builder();
	}

	public static Builder from(Player other) {
		return new Builder(other);
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getNickname() {
		return nickname;
	}

	public String getEmail() {
		return email;
	}

	@Override
	public boolean equals(final Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;
		final Player player = (Player) o;
		return id == player.id &&
				Objects.equals(name, player.name) &&
				Objects.equals(nickname, player.nickname);
	}

	@Override
	public int hashCode() {
		return Objects.hash(name, nickname, id);
	}

	@Override
	public String toString() {
		return "Player{" +
				"name='" + name + '\'' +
				", nickname='" + nickname + '\'' +
				", id=" + id +
				'}';
	}

	public static final class Builder {

		private int id;
		private String name;
		private String nickname;
		private String email;

		public Builder() { }

		public Builder(Player player) {
			id = player.id;
			name = player.name;
			nickname = player.nickname;
			email = player.email;
		}

		public Builder id(int id) {
			this.id = id;
			return this;
		}

		public Builder name(String name) {
			this.name = name;
			return this;
		}

		public Builder nickname(String nickname) {
			this.nickname = nickname;
			return this;
		}

		public Builder email(String email) {
			this.email = email;
			return this;
		}

		public Player build() {
			return new Player(this);
		}
	}
}
