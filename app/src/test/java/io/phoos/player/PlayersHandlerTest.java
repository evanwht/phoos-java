package io.phoos.player;

import io.phoos.DB;
import io.phoos.Response;
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
import java.sql.Types;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

/**
 * @author evanwht1@gmail.com
 */
@ExtendWith(MockitoExtension.class)
public class PlayersHandlerTest {

	@Mock private DB db;
	@Mock private Connection connection;
	@Mock private PreparedStatement statement;
	@Mock private ResultSet resultSet;

	private PlayersHandler handler;

	@BeforeEach
	void init() {
		handler = new PlayersHandler(db);
		when(db.getConnection()).thenReturn(connection);
	}

//	@Test
	void testGetAll() throws Exception {
		when(connection.prepareStatement("SELECT id, name, display_name, email FROM phoosball.players;")).thenReturn(statement);
		when(statement.executeQuery()).thenReturn(resultSet);
		when(resultSet.next()).thenReturn(true); // TODO need to only have next be true once
		when(resultSet.getInt(PlayerTable.Columns.ID.getName())).thenReturn(1);
		when(resultSet.getString(PlayerTable.Columns.NAME.getName())).thenReturn("Name");
		when(resultSet.getString(PlayerTable.Columns.NICKNAME.getName())).thenReturn("Nick");
		when(resultSet.getString(PlayerTable.Columns.EMAIL.getName())).thenReturn("mail@mail.com");
		List<Player> all = handler.getAll();
		assertEquals(all, List.of(Player.newBuilder().id(1).name("Name").nickname("Nick").email("mail@mail.com").build()));
	}

	@Test
	void testGetOne() throws Exception {
		when(connection.prepareStatement("SELECT id, name, display_name, email FROM phoosball.players WHERE id = ?;")).thenReturn(statement);
		when(statement.executeQuery()).thenReturn(resultSet);
		when(resultSet.next()).thenReturn(true);
		when(resultSet.getInt(PlayerTable.Columns.ID.getName())).thenReturn(1);
		when(resultSet.getString(PlayerTable.Columns.NAME.getName())).thenReturn("Name");
		when(resultSet.getString(PlayerTable.Columns.NICKNAME.getName())).thenReturn("Nick");
		when(resultSet.getString(PlayerTable.Columns.EMAIL.getName())).thenReturn("mail@mail.com");
		Player player = handler.get(1);
		assertEquals(player, Player.newBuilder().id(1).name("Name").nickname("Nick").email("mail@mail.com").build());
		verify(statement).setObject(1, 1, Types.INTEGER);
	}

	@Test
	void testInsert() throws Exception {
		when(connection.prepareStatement("INSERT INTO phoosball.players (name, display_name, email) VALUES (?, ?, ?);", Statement.RETURN_GENERATED_KEYS)).thenReturn(statement);
		when(statement.executeUpdate()).thenReturn(1);
		when(statement.getGeneratedKeys()).thenReturn(resultSet);
		when(resultSet.next()).thenReturn(true);
		when(resultSet.getLong(1)).thenReturn(42L);
		Response post = handler.create(Player.newBuilder()
											 .name("Name")
											 .nickname("Nick")
											 .email("mail@mail.com")
											 .build());
		assertEquals(HttpStatus.OK_200, post.getStatusCode());
		assertEquals("Created new player with id: 42", post.getMessage());
		verify(statement).setObject(1, "Name", Types.VARCHAR);
		verify(statement).setObject(2, "Nick", Types.VARCHAR);
		verify(statement).setObject(3, "mail@mail.com", Types.VARCHAR);
	}

	@Test
	void testUpdate() throws Exception {
		when(connection.prepareStatement("UPDATE phoosball.players SET name = ?, display_name = ? WHERE id = ?;")).thenReturn(statement);
		when(statement.executeUpdate()).thenReturn(1);
		Response post = handler.update(Player.newBuilder()
										   .id(42)
										   .name("Name")
										   .nickname("Nick")
										   .build());
		assertEquals(HttpStatus.OK_200, post.getStatusCode());
		verify(statement).setObject(1, "Name", Types.VARCHAR);
		verify(statement).setObject(2, "Nick", Types.VARCHAR);
		verify(statement).setObject(3, 42, Types.INTEGER);
	}

	@Test
	void testDelete() throws Exception {
		when(connection.prepareStatement("DELETE FROM phoosball.players WHERE id = ?;")).thenReturn(statement);
		when(statement.executeUpdate()).thenReturn(1);
		Response post = handler.delete(42);
		assertEquals(HttpStatus.OK_200, post.getStatusCode());
		verify(statement).setObject(1, 42, Types.INTEGER);
	}
}
