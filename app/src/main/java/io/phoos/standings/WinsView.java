package io.phoos.standings;

import io.phoos.sql.Column;

import java.sql.Types;

/**
 * @author evanwht1@gmail.com
 */
public class WinsView {

    public static final String VIEW_NAME = "wins";

    public enum Columns implements Column {
        ID("id", Types.INTEGER),
        GAME_DATE("game_date", Types.TIMESTAMP),
        INPUT_DATE("input_date", Types.TIMESTAMP),
        TEAM_1_P1("team_1_p1", Types.INTEGER);

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
