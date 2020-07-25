package io.phoos;

import io.javalin.http.Context;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * @author evanwht1@gmail.com
 */
public class DB {

    private Connection connection;
    private final DBProperties props;

    DB(DBProperties props) throws SQLException {
        this.props = props;
        final String connectString = props.connectionType() + props.host();
        connection = DriverManager.getConnection(connectString, props.user(), props.password());;
    }

    public Connection getConnection() {
        try {
            // the jdbc driver disconnects from the db every so often
            if (!connection.isValid(1)) {
                refreshConnection();
            }
        } catch (SQLException e) {
            throw new RuntimeException("Can't connect to DB");
        }
        return connection;
    }

    void refresh(final Context ctx) throws SQLException {
        refreshConnection();
        ctx.result("DB Connection Refreshed");
    }

    private void refreshConnection() throws SQLException {
        connection.close();
        connection = DriverManager.getConnection("jdbc:mariadb://" + props.host(), props.user(), props.password());
    }
}
