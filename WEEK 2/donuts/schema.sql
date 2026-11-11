CREATE TABLE "Ingredients" (
    "ingredients" TEXT CHECK("ingredients" IN ('Flour','Yeast','Oil','Butter','Several Differnt Types of Sugar')),
    "price_per_unit" NUMERIC NOT NULL,
    PRIMARY KEY ("ingredients")
);

CREATE TABLE "Donuts"(
    "name" TEXT,
    "gluten_free" INTEGER NOT NULL CHECK("gluten_free" IN ("1","0")),
    "price_per_donut" DECIMAL,
    "ingredients_inside" TEXT,
    PRIMARY KEY ("name")
    FOREIGN KEY ("ingredients_inside") REFERENCES "Ingredients"("ingredients")
);


CREATE TABLE "Orders" (
    "order_number" INTEGER,
    "ordered_donuts" TEXT,
    "customer" TEXT,
    PRIMARY KEY ("order_number"),
    FOREIGN KEY ("ordered_donuts") REFERENCES "Donuts"("name")
);

CREATE TABLE "Customers" (
    "first_name" TEXT,
    "last_name" TEXT,
    "history_of_orders" INTEGER,
    FOREIGN KEY ("history_of_orders") REFERENCES "Orders"("order_number")
);
