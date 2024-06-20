-- temp table
.import --csv meteorites.csv meteorites_temp

-- schema
CREATE TABLE meteorites (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "class" TEXT NOT NULL,
    "mass" REAL,
    "discovery" TEXT NOT NULL,
    "year" INTEGER,
    "lat" REAL,
    "long" REAL,
    PRIMARY KEY("id")
);

-- rounding
UPDATE "meteorites_temp"
SET "mass" = (
    ROUND("mass", 2)
)
WHERE "mass" != "";

UPDATE "meteorites_temp"
SET "lat" = (
    ROUND("lat", 2)
)
WHERE "lat" != "";

UPDATE "meteorites_temp"
SET "long" = (
    ROUND("long", 2)
)
WHERE "long" != "";

-- TODO clean year less than 1000 and more than 2013
UPDATE "meteorites_temp"
SET "year" = 1920.0
WHERE "name" = "Narni";

UPDATE "meteorites_temp"
SET "year" = 1860.0
WHERE "name" = "Nogata";

UPDATE "meteorites_temp"
SET "year" = 2011.0
WHERE "name" = "Northwest Africa 7701";

-- import
INSERT INTO "meteorites" ("name","class", "mass", "discovery", "year", "lat", "long")
SELECT "name","class", "mass", "discovery", "year", "lat", "long" FROM "meteorites_temp"
WHERE "nametype" != "Relict"
ORDER BY "year", "name";

-- add NULL
UPDATE "meteorites"
SET "mass" = NULL
WHERE "mass" = "";

UPDATE "meteorites"
SET "year" = NULL
WHERE "year" = "";

UPDATE "meteorites"
SET "lat" = NULL
WHERE "lat" = "";

UPDATE "meteorites"
SET "long" = NULL
WHERE "long" = "";

DROP TABLE "meteorites_temp";
