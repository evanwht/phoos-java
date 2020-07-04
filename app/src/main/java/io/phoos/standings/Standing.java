package io.phoos.standings;

import io.phoos.player.Player;

public class Standing {

    private final Player player;
    private final int wins;
    private final int losses;
    private final double percentage;

    public Standing(final Player player, final int wins, final int losses) {
        this.player = player;
        this. wins = wins;
        this.losses = losses;
        this.percentage = (double) wins / losses;
    }

    public Player getPlayer() {
        return player;
    }

    public int getWins() {
        return wins;
    }

    public int getLosses() {
        return losses;
    }

    public double getPercentage() {
        return percentage;
    }
}