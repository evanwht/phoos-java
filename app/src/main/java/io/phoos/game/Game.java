package io.phoos.game;

import io.phoos.event.GameEvent;

import java.time.Instant;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Objects;

/**
 * @author evanwht1@gmail.com
 */
public class Game {

	private final int id;
	private final Instant created;
	private final Instant played;
	private final Team team1;
	private final Team team2;
	private final int team1HalfScore;
	private final int team2HalfScore;
	private final int team1FinalScore;
	private final int team2FinalScore;
	private final List<GameEvent> events;

	public Game() {
		this.id = 0;
		this.created = Instant.now();
		this.played = Instant.now();
		this.team1 = null;
		this.team2 = null;
		this.team1HalfScore = 0;
		this.team2HalfScore = 0;
		this.team1FinalScore = 0;
		this.team2FinalScore = 0;
		this.events = Collections.emptyList();
	}

	public Game(final Builder b) {
		this.id = b.id;
		this.created = b.created;
		this.played = b.played;
		this.team1 = b.team1;
		this.team2 = b.team2;
		this.team1HalfScore = b.team1HalfScore;
		this.team2HalfScore = b.team2HalfScore;
		this.team1FinalScore = b.team1FinalScore;
		this.team2FinalScore = b.team2FinalScore;
		this.events = b.events;
	}

	public static Builder newBuilder() {
		return new Builder();
	}

	public static Builder from(Game other) {
		return new Builder(other);
	}

	public int getId() {
		return id;
	}

	public Instant getCreated() {
		return created;
	}

	public Instant getPlayed() {
		return played;
	}

	public Team getTeam1() {
		return team1;
	}

	public Team getTeam2() {
		return team2;
	}

	public int getTeam1HalfScore() {
		return team1HalfScore;
	}

	public int getTeam2HalfScore() {
		return team2HalfScore;
	}

	public int getTeam1FinalScore() {
		return team1FinalScore;
	}

	public int getTeam2FinalScore() {
		return team2FinalScore;
	}

	public List<GameEvent> getEvents() {
		return events;
	}

	@Override
	public String toString() {
		return "Game{" +
				"id=" + id +
				", created=" + created +
				", played=" + played +
				", team1=" + team1 +
				", team2=" + team2 +
				", team1HalfScore=" + team1HalfScore +
				", team2HalfScore=" + team2HalfScore +
				", team1FinalScore=" + team1FinalScore +
				", team2FinalScore=" + team2FinalScore +
				", events=" + events +
				'}';
	}

	@Override
	public boolean equals(final Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;
		final Game game = (Game) o;
		return id == game.id &&
				team1HalfScore == game.team1HalfScore &&
				team2HalfScore == game.team2HalfScore &&
				team1FinalScore == game.team1FinalScore &&
				team2FinalScore == game.team2FinalScore &&
				Objects.equals(created, game.created) &&
				Objects.equals(played, game.played) &&
				Objects.equals(team1, game.team1) &&
				Objects.equals(team2, game.team2) &&
				Objects.equals(events, game.events);
	}

	@Override
	public int hashCode() {
		return Objects.hash(id, created, played, team1, team2, team1HalfScore, team2HalfScore, team1FinalScore, team2FinalScore, events);
	}

	public static final class Builder {
		private int id;
		private Instant created = Instant.now();
		private Instant played = Instant.now();
		private Team team1;
		private Team team2;
		private int team1HalfScore;
		private int team2HalfScore;
		private int team1FinalScore;
		private int team2FinalScore;
		private final List<GameEvent> events = new ArrayList<>();

		private Builder() { }

		public Builder(final Game other) {
			this.id = other.id;
			this.created = other.created;
			this.played = other.played;
			this.team1 = other.team1;
			this.team2 = other.team2;
			this.team1HalfScore = other.team1HalfScore;
			this.team2HalfScore = other.team2HalfScore;
			this.team1FinalScore = other.team1FinalScore;
			this.team2FinalScore = other.team2FinalScore;
		}

		public Builder id(int id) {
			this.id = id;
			return this;
		}

		public Builder created(Instant created) {
			this.created = created;
			return this;
		}

		public Builder played(Instant played) {
			this.played = played;
			return this;
		}

		public Builder team1(Team team1) {
			this.team1 = team1;
			return this;
		}

		public Builder team2(Team team2) {
			this.team2 = team2;
			return this;
		}

		public Builder team1HalfScore(int team1HalfScore) {
			this.team1HalfScore = team1HalfScore;
			return this;
		}

		public Builder team2HalfScore(int team2HalfScore) {
			this.team2HalfScore = team2HalfScore;
			return this;
		}

		public Builder team1FinalScore(int team1FinalScore) {
			this.team1FinalScore = team1FinalScore;
			return this;
		}

		public Builder team2FinalScore(int team2FinalScore) {
			this.team2FinalScore = team2FinalScore;
			return this;
		}

		public Builder event(final GameEvent event) {
			events.add(event);
			return this;
		}

		public Game build() {
			return new Game(this);
		}
	}
}
