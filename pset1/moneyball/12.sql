SELECT "first_name", "last_name" FROM "players"
WHERE "id" IN (
    SELECT "salaries"."player_id" FROM "salaries"
    JOIN "performances" ON "performances"."player_id" = "salaries"."player_id"
    GROUP BY "salaries"."player_id", "performances"."player_id", "salaries"."year", "performances"."year"
    HAVING "salaries"."year" = 2001
    AND "performances"."year" = 2001
    AND "salary"/"H" IS NOT NULL
    ORDER BY "salary"/"H", "first_name", "last_name"
    LIMIT 10
)

INTERSECT

SELECT "first_name", "last_name" FROM "players"
WHERE "id" IN (
    SELECT "salaries"."player_id" FROM "salaries"
    JOIN "performances" ON "performances"."player_id" = "salaries"."player_id"
    GROUP BY "salaries"."player_id", "performances"."player_id", "salaries"."year", "performances"."year"
    HAVING "salaries"."year" = 2001
    AND "performances"."year" = 2001
    AND "salary"/"RBI" IS NOT NULL
    ORDER BY "salary"/"RBI", "first_name", "last_name"
    LIMIT 10
)

ORDER BY "last_name";
