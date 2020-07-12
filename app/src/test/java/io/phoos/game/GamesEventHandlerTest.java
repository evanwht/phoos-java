package io.phoos.game;

import io.phoos.DB;
import io.phoos.Response;
import io.phoos.player.Player;
import org.eclipse.jetty.http.HttpStatus;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.sql.Types;
import java.time.Instant;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

/**
 * @author evanwht1@gmail.com
 */
@ExtendWith(MockitoExtension.class)
public class GamesEventHandlerTest {

    @Mock private DB db;
    @Mock private Connection connection;
    @Mock private PreparedStatement statement;
    @Mock private ResultSet resultSet;

    private GamesHandler handler;

    @BeforeEach
    void init() {
        handler = new GamesHandler(db);
        when(db.getConnection()).thenReturn(connection);
    }

    //	@Test
    void testGetAll() throws Exception {
        when(connection.prepareStatement("SELECT id, game_date, team_1_d_id, team_1_d, team_1_o_id, team_1_o, " +
                "team_2_d_id, team_2_d, team_2_o_id, team_2_o, team_1_half, team_2_half, team_1_final, team_2_final " +
                "FROM phoosball.last_games;")).thenReturn(statement);
        when(statement.executeQuery()).thenReturn(resultSet);
        when(resultSet.next()).thenReturn(true); // TODO - this should only be true once
        when(resultSet.getInt(LastGamesView.Columns.ID.getName())).thenReturn(1);
        Instant now = Instant.now();
        when(resultSet.getTimestamp(LastGamesView.Columns.GAME_DATE.getName())).thenReturn(Timestamp.from(now));
        when(resultSet.getInt(LastGamesView.Columns.TEAM_1_D_ID.getName())).thenReturn(1);
        when(resultSet.getString(LastGamesView.Columns.TEAM_1_D.getName())).thenReturn("team 1 d");
        when(resultSet.getInt(LastGamesView.Columns.TEAM_1_O_ID.getName())).thenReturn(2);
        when(resultSet.getString(LastGamesView.Columns.TEAM_1_O.getName())).thenReturn("team 1 o");
        when(resultSet.getInt(LastGamesView.Columns.TEAM_2_D_ID.getName())).thenReturn(3);
        when(resultSet.getString(LastGamesView.Columns.TEAM_2_D.getName())).thenReturn("team 2 d");
        when(resultSet.getInt(LastGamesView.Columns.TEAM_2_O_ID.getName())).thenReturn(4);
        when(resultSet.getString(LastGamesView.Columns.TEAM_2_O.getName())).thenReturn("team 2 o");
        when(resultSet.getInt(LastGamesView.Columns.TEAM_1_HALF.getName())).thenReturn(5);
        when(resultSet.getInt(LastGamesView.Columns.TEAM_2_HALF.getName())).thenReturn(4);
        when(resultSet.getInt(LastGamesView.Columns.TEAM_1_FINAL.getName())).thenReturn(10);
        when(resultSet.getInt(LastGamesView.Columns.TEAM_2_FINAL.getName())).thenReturn(8);
        List<Game> player = handler.getAll();
        assertEquals(player, List.of(Game.newBuilder().id(1)
                                 .played(now)
                                 .team1(Team.builder()
                                            .setDefense(Player.newBuilder().id(1).name("team 1 d").build())
                                            .setOffense(Player.newBuilder().id(2).name("team 1 o").build())
                                            .build())
                                 .team2(Team.builder()
                                            .setDefense(Player.newBuilder().id(3).name("team 2 d").build())
                                            .setOffense(Player.newBuilder().id(4).name("team 2 o").build())
                                            .build())
                                 .team1HalfScore(5)
                                 .team2HalfScore(4)
                                 .team1FinalScore(10)
                                 .team2FinalScore(8)
                                 .build()));
        verify(statement).setObject(1, 1, Types.INTEGER);
    }

    @Test
    void testGetOne() throws Exception {
        when(connection.prepareStatement("SELECT id, game_date, team_1_d_id, team_1_d, team_1_o_id, team_1_o, " +
                "team_2_d_id, team_2_d, team_2_o_id, team_2_o, team_1_half, team_2_half, team_1_final, team_2_final " +
                "FROM phoosball.last_games WHERE id = ?;")).thenReturn(statement);
        when(statement.executeQuery()).thenReturn(resultSet);
        when(resultSet.next()).thenReturn(true);
        when(resultSet.getInt(LastGamesView.Columns.ID.getName())).thenReturn(1);
        Instant now = Instant.now();
        when(resultSet.getTimestamp(LastGamesView.Columns.GAME_DATE.getName())).thenReturn(Timestamp.from(now));
        when(resultSet.getInt(LastGamesView.Columns.TEAM_1_D_ID.getName())).thenReturn(1);
        when(resultSet.getString(LastGamesView.Columns.TEAM_1_D.getName())).thenReturn("team 1 d");
        when(resultSet.getInt(LastGamesView.Columns.TEAM_1_O_ID.getName())).thenReturn(2);
        when(resultSet.getString(LastGamesView.Columns.TEAM_1_O.getName())).thenReturn("team 1 o");
        when(resultSet.getInt(LastGamesView.Columns.TEAM_2_D_ID.getName())).thenReturn(3);
        when(resultSet.getString(LastGamesView.Columns.TEAM_2_D.getName())).thenReturn("team 2 d");
        when(resultSet.getInt(LastGamesView.Columns.TEAM_2_O_ID.getName())).thenReturn(4);
        when(resultSet.getString(LastGamesView.Columns.TEAM_2_O.getName())).thenReturn("team 2 o");
        when(resultSet.getInt(LastGamesView.Columns.TEAM_1_HALF.getName())).thenReturn(5);
        when(resultSet.getInt(LastGamesView.Columns.TEAM_2_HALF.getName())).thenReturn(4);
        when(resultSet.getInt(LastGamesView.Columns.TEAM_1_FINAL.getName())).thenReturn(10);
        when(resultSet.getInt(LastGamesView.Columns.TEAM_2_FINAL.getName())).thenReturn(8);
        Game savedGame = handler.get(1);
        savedGame = Game.from(savedGame).created(now).build();
        assertEquals(
                savedGame, Game.newBuilder().id(1)
                                 .played(now)
                                 .created(now)
                                 .team1(Team.builder()
                                            .setDefense(Player.newBuilder().id(1).name("team 1 d").build())
                                            .setOffense(Player.newBuilder().id(2).name("team 1 o").build())
                                            .build())
                                 .team2(Team.builder()
                                            .setDefense(Player.newBuilder().id(3).name("team 2 d").build())
                                            .setOffense(Player.newBuilder().id(4).name("team 2 o").build())
                                            .build())
                                 .team1HalfScore(5)
                                 .team2HalfScore(4)
                                 .team1FinalScore(10)
                                 .team2FinalScore(8)
                                 .build());
        verify(statement).setObject(1, 1, Types.INTEGER);
    }

    @Test
    void testInsert() throws Exception {
        when(connection.prepareStatement("INSERT INTO phoosball.games (game_date, team_1_p1, team_1_p2, " +
                                "team_2_p1, team_2_p2, team_1_half, team_2_half, team_1_final, team_2_final) " +
                                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);", Statement.RETURN_GENERATED_KEYS)).thenReturn(statement);
        when(statement.executeUpdate()).thenReturn(1);
        when(statement.getGeneratedKeys()).thenReturn(resultSet);
        when(resultSet.next()).thenReturn(true);
        when(resultSet.getLong(1)).thenReturn(42L);
        Instant now = Instant.now();
        Response post = handler.post(Game.newBuilder()
                                         .played(now)
                                         .team1(Team.builder()
                                                    .setDefense(Player.newBuilder().id(1).name("team 1 d").build())
                                                    .setOffense(Player.newBuilder().id(2).name("team 1 o").build())
                                                    .build())
                                         .team2(Team.builder()
                                                    .setDefense(Player.newBuilder().id(3).name("team 2 d").build())
                                                    .setOffense(Player.newBuilder().id(4).name("team 2 o").build())
                                                    .build())
                                         .team1HalfScore(5)
                                         .team2HalfScore(4)
                                         .team1FinalScore(10)
                                         .team2FinalScore(8)
                                             .build());
        assertEquals(HttpStatus.OK_200, post.getStatusCode());
        assertEquals("Saved game with new id: 42", post.getMessage());
        verify(statement).setObject(1, Timestamp.from(now), Types.TIMESTAMP);
        verify(statement).setObject(2, 1, Types.INTEGER);
        verify(statement).setObject(3, 2, Types.INTEGER);
        verify(statement).setObject(4, 3, Types.INTEGER);
        verify(statement).setObject(5, 4, Types.INTEGER);
        verify(statement).setObject(6, 5, Types.INTEGER);
        verify(statement).setObject(7, 4, Types.INTEGER);
        verify(statement).setObject(8, 10, Types.INTEGER);
        verify(statement).setObject(9, 8, Types.INTEGER);
    }

    @Test
    void testUpdate() throws Exception {
        when(connection.prepareStatement("UPDATE phoosball.games SET team_1_p1 = ?, team_1_half = ? WHERE id = ?;")).thenReturn(statement);
        when(statement.executeUpdate()).thenReturn(1);
        Response post = handler.put(Game.newBuilder()
                                        .id(42)
                                        .team1(Team.builder().setDefense(Player.newBuilder().id(2).build()).build())
                                        .team1HalfScore(4)
                                        .build());
        assertEquals(HttpStatus.OK_200, post.getStatusCode());
        verify(statement).setObject(1, 2, Types.INTEGER);
        verify(statement).setObject(2, 4, Types.INTEGER);
        verify(statement).setObject(3, 42, Types.INTEGER);
    }

    @Test
    void testDelete() throws Exception {
        when(connection.prepareStatement("DELETE FROM phoosball.games WHERE id = ?;")).thenReturn(statement);
        when(statement.executeUpdate()).thenReturn(1);
        Response post = handler.delete(42);
        assertEquals(HttpStatus.OK_200, post.getStatusCode());
        verify(statement).setObject(1, 42, Types.INTEGER);
    }
}
