SELECT
    "first_name",
    "last_name",
    "salaries"."salary"
FROM "players"
JOIN "salaries" ON "salaries"."player_id" = "players"."id"
WHERE "salaries"."year" = 2001
ORDER BY "salaries"."salary" ASC, "players"."first_name" ASC, "players"."last_name" ASC, "players"."id"
LIMIT 50;
