package io.phoos.sql;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author evanwht1@gmail.com
 */
@FunctionalInterface
public interface ResultMapper<T> {
	T map(ResultSet rs) throws SQLException;
}
