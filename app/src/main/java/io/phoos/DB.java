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
        connection = DriverManager.getConnection("jdbc:mariadb://" + props.host(), props.user(), props.password());;
    }

    public Connection getConnection() {
        return connection;
    }

    void refresh(final Context ctx) throws SQLException {
        connection.close();
        connection = DriverManager.getConnection("jdbc:mariadb://" + props.host(), props.user(), props.password());;
        ctx.result("DB Connection Refreshed");
    }
}
