SELECT "first_name", "last_name", "salary", "salaries"."year", "HR" FROM "performances"
JOIN "players" ON "players"."id" = "performances"."player_id"
JOIN "salaries" ON "salaries"."player_id" = "performances"."player_id"
AND "salaries"."year" = "performances"."year"
ORDER BY "players"."id", "performances"."year" DESC, "HR" DESC, "salary" DESC;
