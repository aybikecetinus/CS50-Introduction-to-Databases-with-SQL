
-- *** The Lost Letter ***
-- SELECT "id", "address" FROM "addresses" WHERE "address" LIKE '%Somerville%';
-- SELECT * FROM "packages" WHERE "from_address_id" = 432;
-- SELECT "address" FROM "addresses" WHERE "id" = 854;
-- SELECT "package_id", "address_id", "action", "timestamp" FROM "scans" WHERE "package_id" = 384 AND "address_id" = 432;

SELECT "package_id", "address_id", "action", "timestamp" FROM "scans" WHERE "package_id" IN (
    SELECT "id" FROM "packages" WHERE "contents" LIKE '%Congratulatory%' AND "from_address_id" = (
        SELECT "id" FROM "addresses" WHERE "address" LIKE '%Somerville%'
    )
)
;

SELECT * FROM "addresses" WHERE "id" = 432 OR "id" = 854;

-- *** The Devious Delivery ***

SELECT * FROM "scans" WHERE "package_id" = (
    SELECT "id" FROM "packages" WHERE "contents" LIKE '%duck%' AND "from_address_id" IS NULL
);

SELECT * FROM "addresses" WHERE "id" = 50 OR "id" = 348;

-- *** The Forgotten Gift ***
/*
SELECT * FROM "packages" WHERE "from_address_id" = (
    SELECT "id" FROM "addresses" WHERE "address" = '109 Tileston Street'
);
*/

SELECT * FROM "drivers" WHERE "id" IN (
    SELECT "driver_id" FROM "scans" WHERE "package_id" = (
        SELECT "id" FROM "packages" WHERE "from_address_id" = (
            SELECT "id" FROM "addresses" WHERE "address" = '109 Tileston Street'
        )
    )
);

SELECT * FROM "scans" WHERE "package_id" = (
    SELECT "id" FROM "packages" WHERE "from_address_id" = (
        SELECT "id" FROM "addresses" WHERE "address" = '109 Tileston Street'
    )
);


SELECT "id", "address" FROM "addresses" WHERE "id" IN (
    SELECT "address_id" FROM "scans" WHERE "package_id" IN (
        SELECT "id" FROM "packages" WHERE "from_address_id" IN (
            SELECT "id" FROM "addresses" WHERE "address" = '109 Tileston Street'
        )
    )
);



