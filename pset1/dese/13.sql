SELECT "name", "unsatisfactory" FROM "districts"
JOIN "staff_evaluations" ON "staff_evaluations"."district_id" = "districts"."id"
ORDER BY "unsatisfactory" DESC LIMIT 10;
