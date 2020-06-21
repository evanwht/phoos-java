package io.phoos.game;

import io.phoos.sql.Column;

import java.sql.Types;

/**
 * @author evanwht1@gmail.com
 */
public class LastGamesView {

    static final String VIEW_NAME = "last_games";

    enum Columns implements Column {
        ID("id", Types.INTEGER),
        GAME_DATE("game_date", Types.TIMESTAMP),
        TEAM_1_D("team_1_d", Types.VARCHAR),
        TEAM_1_D_ID("team_1_d_id", Types.INTEGER),
        TEAM_1_O("team_1_o", Types.VARCHAR),
        TEAM_1_O_ID("team_1_o_id", Types.INTEGER),
        TEAM_2_D("team_2_d", Types.VARCHAR),
        TEAM_2_D_ID("team_2_d_id", Types.INTEGER),
        TEAM_2_O("team_2_o", Types.VARCHAR),
        TEAM_2_O_ID("team_2_o_id", Types.INTEGER),
        TEAM_1_HALF("team_1_half", Types.INTEGER),
        TEAM_2_HALF("team_2_half", Types.INTEGER),
        TEAM_1_FINAL("team_1_final", Types.INTEGER),
        TEAM_2_FINAL("team_2_final", Types.INTEGER);

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
