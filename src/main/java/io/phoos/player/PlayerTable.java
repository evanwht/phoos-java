package io.phoos.player;

import io.phoos.sql.Column;

import java.sql.Types;

/**
 * @author evanwht1@gmail.com
 */
public class PlayerTable {

    static final String TABLE_NAME = "players";

    public enum Columns implements Column {
        ID("id", Types.INTEGER),
        NAME("name", Types.VARCHAR),
        NICKNAME("display_name", Types.VARCHAR),
        EMAIL("email", Types.VARCHAR);

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
