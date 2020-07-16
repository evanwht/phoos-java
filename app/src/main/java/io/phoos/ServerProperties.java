package io.phoos;

import org.aeonbits.owner.Config;
import org.aeonbits.owner.Config.Sources;

/**
 * @author evanwht1@gmail.com
 */
@Sources({"file:/config/server.properties",
		"classpath:config/server.properties"})
public interface ServerProperties extends Config {
	int port();
}
