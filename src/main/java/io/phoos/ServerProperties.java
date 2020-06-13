package io.phoos;

import org.aeonbits.owner.Config;

/**
 * @author evanwht1@gmail.com
 */
@Config.Sources({"classpath:config/server.properties"})
public interface ServerProperties extends Config {
	int port();
}
