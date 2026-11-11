-- In this SQL file, write (and comment!) the typical SQL queries users will run on your database

-- Find all events held at a given venue
SELECT *
FROM "events"
WHERE "venue_id" = (
    SELECT "id"
    FROM "venues"
    WHERE "name" = 'Example Arena'
);

-- Find all events in a given city
SELECT *
FROM "events"
WHERE "venue_id" IN (
    SELECT "id"
    FROM "venues"
    WHERE "city_id" = (
        SELECT "id"
        FROM "cities"
        WHERE "name" = 'İstanbul'
    )
);

-- Find upcoming events, soonest first
SELECT "event_name", "start_datetime"
FROM "events"
WHERE "start_datetime" > CURRENT_TIMESTAMP
ORDER BY "start_datetime";

SELECT "name", "fee"
FROM "event_artists"
JOIN "artists" ON "artists"."id" = "event_artists"."artist_id"
WHERE "event_artists"."artist_event_id" = (
    SELECT "id"
    FROM "events"
    WHERE "event_name" = 'Summer Night Concert'
);

-- Find all ticket types and prices for a given event
SELECT "ticket_type", "price", "quantity_available"
FROM "ticket_types"
WHERE "event_id" = 1;

-- Find all orders of a customer given their email
SELECT *
FROM "orders"
WHERE "customer_id" = (
    SELECT "id"
    FROM "customers"
    WHERE "email" = 'aybike@example.com'
);

-- Find the top 5 customers by total paid amount
SELECT "first_name", "last_name", SUM("total_amount") AS "total_spent"
FRoM "orders"
JOIN "customers" ON "customer"."id" = "orders". "customer_id"
WHERE "orders". "payment_status" = 'paid'
GROUP BY "orders"."customer_id"
ORDER BY "total_spent" DESC
LIMIT 5;


INSERT INTO "ticket_types" ("ticket_type")
VALUES ('VIP Package');
