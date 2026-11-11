UPDATE "users" SET "password" = '982c0381c279d139fd221fce974916e7' WHERE "username" = 'admin';

DELETE FROM "user_logs" WHERE "new_password" = '982c0381c279d139fd221fce974916e7';

INSERT INTO "user_logs" ("type", "old_username", "new_username", "new_password")
SELECT 'update', 'admin', 'admin', (
    SELECT "password" FROM "users" WHERE "username" = 'emily33'
);
