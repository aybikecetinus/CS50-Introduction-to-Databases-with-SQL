SELECT "first_name", "last_name" FROM "players"
WHERE "id" IN (
    SELECT "salaries"."player_id" FROM "salaries"
    JOIN "performances"
        ON "salaries"."player_id" = "performances"."player_id"
        AND "salaries"."year" = "performances"."year"
    WHERE "salaries"."year" = 2001
        AND "performances"."H" > 0
    ORDER BY "salaries"."salary" / "performances"."H" ASC
    LIMIT 10
)
AND "id" IN (
    SELECT "salaries"."player_id" FROM "salaries"
    JOIN "performances"
        ON "salaries"."player_id" = "performances"."player_id"
        AND "salaries"."year" = "performances"."year"
    WHERE "salaries"."year" = 2001
        AND "performances"."RBI" > 0
    ORDER BY "salaries"."salary" / "performances"."RBI" ASC
    LIMIT 10
)
ORDER BY "players"."id" ASC
/*
JOIN "performances" ON "performances"."player_id" = "players"."id"
JOIN "salaries" ON "salaries"."player_id" = "players"."id"
WHERE "salaries"."year" = 2001 AND "performances"."year" = 2001
AND ("salaries"."salary" / "performances"."H") IS NOT NULL
AND ("salaries"."salary" / "performances"."RBI") IS NOT NULL
ORDER BY "players"."id" ASC
LIMIT 10;
*/

