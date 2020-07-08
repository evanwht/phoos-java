package io.phoos.game;

import io.phoos.player.Player;

import java.util.Objects;

/**
 * @author evanwht1@gmail.com
 */
public class Team {

	/**
	 * Player that starts on defense
	 */
	private final Player defense;
	/**
	 * Player that starts on offense
	 */
	private final Player offense;

	public Team() {
		defense = null;
		offense = null;
	}

	private Team(final Builder builder) {
		this.defense = builder.defense;
		this.offense = builder.offense;
	}

	public static Builder builder() {
		return new Builder();
	}

	public Player getDefense() {
		return defense;
	}

	public Player getOffense() {
		return offense;
	}

	@Override
	public String toString() {
		return "Team{" +
				"defense=" + defense +
				", offense=" + offense +
				'}';
	}

	@Override
	public boolean equals(final Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;
		final Team team = (Team) o;
		return Objects.equals(defense, team.defense) &&
				Objects.equals(offense, team.offense);
	}

	@Override
	public int hashCode() {
		return Objects.hash(defense, offense);
	}

	public static class Builder {
		private Player defense;
		private Player offense;

		private Builder() {
		}

		public Builder setDefense(final Player player) {
			this.defense = player;
			return this;
		}

		public Builder setOffense(final Player player) {
			this.offense = player;
			return this;
		}

		public Builder of(final Team team) {
			this.defense = team.defense;
			this.offense = team.offense;
			return this;
		}

		public Team build() {
			return new Team(this);
		}
	}
}
