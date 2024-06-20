CREATE TABLE "triplets" (
    "id" INTEGER,
    "n1" INTEGER,
    "n2" INTEGER,
    "n3" INTEGER,
    PRIMARY KEY("id")
);

INSERT INTO "triplets" ("n1", "n2", "n3")
VALUES (14, 98, 4),
(114, 3, 5),
(618, 72, 9),
(630, 7, 3),
(932, 12, 5),
(2230, 50, 7),
(2346, 44, 10),
(3041, 14, 5);

-- TODO

CREATE VIEW "message" AS
SELECT substr("sentence", "n2", "n3") AS "phrase" FROM "sentences"
JOIN "triplets" ON "sentences"."id" = "triplets"."n1";
