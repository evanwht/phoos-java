package io.phoos.game;

import io.phoos.sql.Column;

import java.sql.Types;

/**
 * @author evanwht1@gmail.com
 */
public class GamesTable {
    static final String TABLE_NAME = "games";

    enum Columns implements Column {
        ID("id", Types.INTEGER),
        GAME_DATE("game_date", Types.TIMESTAMP),
        INPUT_DATE("input_date", Types.TIMESTAMP),
        TEAM_1_P1("team_1_p1", Types.INTEGER),
        TEAM_1_P2("team_1_p2", Types.INTEGER),
        TEAM_2_P1("team_2_p1", Types.INTEGER),
        TEAM_2_P2("team_2_p2", Types.INTEGER),
        TEAM_1_HALF("team_1_half", Types.INTEGER),
        TEAM_1_FINAL("team_1_final", Types.INTEGER),
        TEAM_2_HALF("team_2_half", Types.INTEGER),
        TEAM_2_FINAL("team_2_final", Types.INTEGER),
        INPUT_BY("input_by", Types.INTEGER);

        private final String name;
        private final int type;

        Columns(final String name, final int type) {
            this.name = name;
            this.type = type;
        }

        @Override
        public String getName() {
            return name;
        }

        @Override
        public int getType() {
            return type;
        }
    }
}
