package io.phoos.middleware;

import de.mkammerer.argon2.Argon2;
import de.mkammerer.argon2.Argon2Factory;
import io.javalin.core.security.AccessManager;
import io.javalin.core.security.Role;
import io.javalin.http.Context;
import io.javalin.http.Handler;
import io.phoos.DB;
import io.phoos.Roles;
import io.phoos.player.PlayerTable;
import io.phoos.sql.SelectBuilder;
import org.jetbrains.annotations.NotNull;

import java.sql.SQLException;
import java.util.Collections;
import java.util.Set;

/**
 * @author evanwht1@gmail.com
 */
public class AuthHandler implements AccessManager {

    private static final int MEMORY_TO_USE = 65_536;
    private static final int ITERATIONS = 22;
    private static final int PARRELLELISM = 1;

    private final Argon2 argon2 = Argon2Factory.create();
    private final DB db;

    public AuthHandler(final DB db) {
        this.db = db;
    }

    public Set<Roles> getUserRoles(Context ctx) throws SQLException {
        if (!ctx.basicAuthCredentialsExist()) {
            return Collections.emptySet();
        }
        final String password = ctx.basicAuthCredentials().getPassword();
        final String username = ctx.basicAuthCredentials().getUsername();
        return new SelectBuilder<>(res -> new UserDetails(res.getString("password"), Roles.valueOf(res.getString("roles"))))
                .table(PlayerTable.TABLE_NAME)
                .select(PlayerTable.Columns.PASSWORD)
                .where(PlayerTable.Columns.NAME, username)
                .getOne(db.getConnection())
                .map(userDetails -> argon2.verify(userDetails.hash, password.toCharArray()) ? Set.of(userDetails.roles) : Set.of(Roles.ANYONE))
                .orElse(Collections.emptySet());
    }

    static class UserDetails {
        String hash;
        Roles roles;

        public UserDetails(final String hash, Roles roles) {
            this.hash = hash;
            this.roles = roles;
        }
    }

    @Override
    public void manage(@NotNull final Handler handler, @NotNull final Context ctx, @NotNull final Set<Role> permittedRoles) throws Exception {
        if (permittedRoles.contains(Roles.ANYONE)) {
            handler.handle(ctx);
        } else if (permittedRoles.containsAll(getUserRoles(ctx))) {
            handler.handle(ctx);
        } else {
            ctx.status(401).json("Unauthorized");
        }
    }
}
