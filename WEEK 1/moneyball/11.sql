SELECT "first_name", "last_name", ("salaries"."salary" / "performances"."H") AS "Dollars per Hit" FROM "players"
JOIN "performances" ON "performances"."player_id" = "players"."id"
JOIN "salaries" ON "salaries"."player_id" = "players"."id"
WHERE "salaries"."year" = 2001 AND "performances"."year" = 2001 AND "Dollars per Hit" IS NOT NULL
ORDER BY "Dollars per Hit" ASC, "first_name", "last_name"
LIMIT 10;

