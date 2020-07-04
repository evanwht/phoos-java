package io.phoos.player;

import io.phoos.sql.SelectBuilder;
import io.phoos.standings.Standing;
import io.phoos.standings.StandingsView;

import java.sql.Connection;
import java.util.List;

/**
 * @author evanwht1@gmail.com
 */
public class StandingsHandler {

    private final Connection db;

    public StandingsHandler(final Connection db) {
        this.db = db;
    }

    public List<Standing> getAll() throws Exception {
        return new SelectBuilder<>(
                rs -> new Standing(Player.newBuilder()
                                         .name(rs.getString(StandingsView.Columns.NAME.getName()))
                                         .build(),
                        rs.getInt(StandingsView.Columns.WINS.getName()),
                        rs.getInt(StandingsView.Columns.LOSSES.getName())))
                .table(StandingsView.VIEW_NAME)
                .select(StandingsView.Columns.NAME)
                .select(StandingsView.Columns.WINS)
                .select(StandingsView.Columns.LOSSES)
                .getMany(db);
    }
}
