CREATE TABLE "Passengers" (
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" INTEGER NOT NULL
);

CREATE TABLE "Check_Ins"(
    "datetime" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "flight_number" INTEGER,
    PRIMARY KEY ("flight_number")
);


CREATE TABLE "Airlines" (
    "airline_name" TEXT,
    "concourse" TEXT NOT NULL CHECK("concourse" IN ('A', 'B', 'C', 'D', 'E', 'F', 'T')),
    PRIMARY KEY ("airline_name")
);

CREATE TABLE "Flights" (
    "flight_number" INTEGER,
    "airline" TEXT,
    "code_of_the_airport_depart" TEXT,
    "code_of_the_airport_head" TEXT,
    "depaturedate" NUMERIC,
    "arrivaldate" NUMERIC,
    FOREIGN KEY ("flight_number") REFERENCES "Flights" ("flight_number"),
    FOREIGN KEY ("airline") REFERENCES "Airlines" ("airline_name")
);
