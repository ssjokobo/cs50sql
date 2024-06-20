SELECT "name", SUM("H") AS "total hits" FROM "performances"
JOIN "teams" ON "teams"."id" = "performances"."team_id"
GROUP BY "team_id", "performances"."year"
HAVING "performances"."year" = 2001
ORDER BY "total hits" DESC LIMIT 5;
