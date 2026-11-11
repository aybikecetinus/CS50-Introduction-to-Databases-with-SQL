
CREATE TABLE "meteorites_temp" (
    "name" TEXT,
    "id" INTEGER,
    "nametype" TEXT,
    "class" TEXT,
    "mass" REAL,
    "discovery" TEXT,
    "year" INTEGER,
    "lat" REAL,
    "long" REAL
);

--Create the real table
CREATE TABLE "meteorites" (
    "id" INTEGER,
    "name" TEXT,
    "class" TEXT,
    "mass" REAL ,
    "discovery" TEXT,
    "year" INTEGER,
    "lat" REAL,
    "long" REAL,
    PRIMARY KEY ("id")
);

.import --csv "meteorites.csv" "meteorites_temp"

--Replacing empty values with NULL
UPDATE "meteorites_temp"
SET "mass" = NULL,
    "year" = NULL,
    "lat" = NULL,
    "long" = NULL
WHERE "mass" = '' OR "year" = '' OR "lat" = '' OR "long" = '';

--Round off to 2 decimal points
UPDATE "meteorites_temp"
SET
    "mass" = ROUND("mass", 2),
    "lat" = ROUND("lat", 2),
    "long" = ROUND("long", 2);

--Exclude Relict
DELETE FROM "meteorites_temp" WHERE "nametype" = 'Relict';

--Insert the clean data to meteorites table from meteorites_temp table
INSERT INTO "meteorites" (
    "name",
    "class",
    "mass",
    "discovery",
    "year",
    "lat",
    "long"
)
SELECT
    "name",
    "class",
    "mass",
    "discovery",
    "year",
    "lat",
    "long"
FROM "meteorites_temp"
ORDER BY "year" ASC, "name" ASC;


