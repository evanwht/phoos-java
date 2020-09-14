package io.phoos;

import io.javalin.core.security.Role;

/**
 * @author evanwht1@gmail.com
 */
public enum Roles implements Role {
    /**
     * Role for endpoints that need no authorization
     */
    ANYONE,
    /**
     * Role to signify a signed in user
     */
    USER,
    /**
     * Role reserved for endpoints that require admin access
     */
    ADMIN;
}
