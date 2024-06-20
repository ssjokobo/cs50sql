
-- *** The Lost Letter ***
-- To get the specific row of the package we are looking for
SELECT * FROM "packages" WHERE "from_address_id" = (
    SELECT "id" FROM "addresses" WHERE "address" = "900 Somerville Avenue"
);

-- To see if it has been picked and where was it picked
SELECT * FROM "scans" WHERE "package_id" = 384;

-- To see the detail of the pick up address
SELECT * FROM "addresses" WHERE "id" = 854;

-- *** The Devious Delivery ***

-- To find packages with no from address
SELECT * FROM "packages" WHERE "from_address_id" IS NULL;
-- To find the scans
SELECT * FROM "scans" WHERE "package_id" = 5098;
-- To find where it was delivered
SELECT * FROM "addresses" WHERE "id" = 348;

-- *** The Forgotten Gift ***

-- To find the package from the address she said to send from
SELECT * FROM "packages" WHERE "from_address_id" = (
    SELECT "id" FROM "addresses" WHERE "address" LIKE "109 Tileston Street"
);
-- To find the scans
SELECT * FROM "scans" WHERE "package_id" = 6269;

-- To find the driver holding it
SELECT * FROM "drivers" WHERE "id" = 17;
