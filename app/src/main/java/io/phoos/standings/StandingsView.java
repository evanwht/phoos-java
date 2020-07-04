package io.phoos.standings;

import io.phoos.sql.Column;

import java.sql.Types;

/**
 * @author evanwht1@gmail.com
 */
public class StandingsView {

    public static final String VIEW_NAME = "overall_standings";

    public enum Columns implements Column {
        NAME("name", Types.INTEGER),
        WINS("wins", Types.INTEGER),
        LOSSES("losses", Types.INTEGER);

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
