-- In this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose it
CREATE TABLE "cities" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    PRIMARY KEY("id")
);

CREATE TABLE "venues" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "city_id" INTEGER NOT NULL,
    "district" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "capacity" INTEGER NOT NULL CHECK("capacity" > 0),
    PRIMARY KEY("id"),
    FOREIGN KEY("city_id") REFERENCES "cities" ("id")
);

CREATE TABLE "artists" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "genre" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE "events" (
    "id" INTEGER,
    "event_name" TEXT NOT NULL,
    "venue_id" INTEGER NOT NULL,
    "venue_rental_fee" REAL NOT NULL CHECK("venue_rental_fee" >= 0),
    "start_datetime" NUMERIC NOT NULL,
    "end_datetime" NUMERIC NOT NULL,
    "status" TEXT,
    PRIMARY KEY("id"),
    FOREIGN KEY("venue_id") REFERENCES "venues" ("id")
);

CREATE TABLE "customers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "email" TEXT NOT NULL UNIQUE,
    "phone" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE "ticket_types" (
    "id" INTEGER,
    "event_id" INTEGER NOT NULL,
    "ticket_type" TEXT NOT NULL CHECK("ticket_type" IN ('VIP', 'General', 'Early Bird')),
    "price" REAL NOT NULL CHECK("price" >= 0),
    "quantity_available" INTEGER NOT NULL CHECK("quantity_available" > 0),
    PRIMARY KEY("id"),
    FOREIGN KEY("event_id") REFERENCES "events" ("id")
);

CREATE TABLE "orders" (
    "id" INTEGER,
    "event_id" INTEGER,
    "customer_id" INTEGER,
    "order_datetime" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "total_amount" REAL NOT NULL CHECK("total_amount" >= 0),
    "payment_status" TEXT NOT NULL CHECK("payment_status" IN ('pending', 'paid', 'refunded', 'fail')),
    PRIMARY KEY("id"),
    FOREIGN KEY("customer_id") REFERENCES "customers" ("id"),
    FOREIGN KEY("event_id") REFERENCES "events" ("id")
);

CREATE TABLE "tickets" (
    "id" INTEGER,
    "order_id" INTEGER ,
    "ticket_type_id" INTEGER,
    "seat_number" TEXT,
    "checked_in" INTEGER NOT NULL DEFAULT 0 CHECK("checked_in" IN (1,0)),
    PRIMARY KEY("id"),
    FOREIGN KEY("order_id") REFERENCES "orders" ("id"),
    FOREIGN KEY("ticket_type_id") REFERENCES "ticket_types" ("id")
);

CREATE TABLE "artist_popularity" (
    "id" INTEGER,
    "artist_id" INTEGER ,
    "city_id" INTEGER,
    "period_start" NUMERIC NOT NULL,
    "monthly_listeners" INTEGER NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("artist_id") REFERENCES "artists" ("id"),
    FOREIGN KEY("city_id") REFERENCES "cities" ("id")
);

CREATE TABLE "event_artists" (
    "id" INTEGER,
    "artist_event_id" INTEGER,
    "artist_id" INTEGER,
    "fee" REAL NOT NULL CHECK("fee" >= 0),
    PRIMARY KEY("id"),
    FOREIGN KEY("artist_event_id") REFERENCES "events" ("id"),
    FOREIGN KEY("artist_id") REFERENCES "artists" ("id")
);

CREATE VIEW "event_sales_summary" AS
SELECT "event_name", "ticket_type", SUM("quantity_available")
FROM "ticket_types"
JOIN "events" ON "events"."id" = "ticket_types"."event_id"
GROUP BY "ticket_type"

CREATE VIEW "artist_costs" AS
SELECT "artist_event_id", SUM("fee") AS "artist_fees"
FROM "event_artists" GROUP BY "event_id";

CREATE VIEW "order_revenue" AS
SELECT "event_id", SUM("total_amount") AS "revenue"
FROM "orders"
WHERE "payment_status" = 'paid'
GROUP BY "event_id";

CREATE VIEW "event_financials" AS
SELECT "event_id", "event_name", "venue_rental_fee", "artist_fees", ("venue_rental_fee" + "artist_fees") AS "total_cost", "revenue", ("revenue" - "total_cost") AS "profit"
FROM "events"
LEFT JOIN "artist_costs" ON "artist_costs"."artist_event_id" = "events"."id"
LEFT JOIN "order_revenue" ON  "order_revenue"."event_id" = "events"."id";

CREATE INDEX "event_date_location" ON "events" ("start_datetime", "venue_id");
CREATE INDEX "ticket_checked" ON "tickets" ("order_id", "seat_number") WHERE "checked_in" = 1;

