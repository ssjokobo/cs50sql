-- 1.
UPDATE "users"
SET "password" = "982c0381c279d139fd221fce974916e7"
WHERE "username" = "admin";

-- 2.
DELETE FROM "user_logs"
WHERE "new_password" = (
    SELECT "new_password" FROM "user_logs"
    WHERE "new_username" = "admin"
);

DELETE FROM "user_logs"
WHERE "new_password" = (
    SELECT "new_password" FROM "user_logs"
    WHERE "new_username" = "admin"
);
-- 3.
INSERT INTO "user_logs" ("type", "old_username", "new_username", "new_password")
SELECT 'update', "admin", "admin", (
    SELECT "password"
    FROM "users"
    WHERE "username" = "emily33"
);
