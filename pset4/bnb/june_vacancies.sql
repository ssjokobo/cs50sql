CREATE VIEW "june_vacancies" AS
SELECT "listings"."id", "property_type", "host_name", COUNT("availabilities"."date") AS "days_vacant" FROM "listings"
JOIN "availabilities" ON "listings"."id" = "availabilities"."listing_id"
GROUP BY "listings"."id"
HAVING "available" = "TRUE"
AND "date" < "2023-07-01"
AND "date" > "2023-05-31" LIMIT 10;
