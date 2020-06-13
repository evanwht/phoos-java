package io.phoos;

import org.aeonbits.owner.Config;

/**
 * @author evanwht1@gmail.com
 */
@Config.Sources({"classpath:config/server.properties"})
public interface DBProperties extends Config {

	@Key("db.host")
	String host();

	@Key("db.user")
	String user();

	@Key("db.password")
	String password();
}
