SELECT "name", ROUND(AVG("salary"), 2) AS "average salary" FROM "salaries"
JOIN "teams" ON "teams"."id" = "salaries"."team_id"
GROUP BY "team_id", "salaries"."year"
HAVING "salaries"."year" = 2001
ORDER BY "average salary"
LIMIT 5;
