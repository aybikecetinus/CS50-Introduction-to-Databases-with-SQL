/*
SELECT "teams"."name", COUNT("H") AS "Total Hits" FROM "performances"
JOIN "teams" ON "teams"."id" = "performances"."team_id"
WHERE "performances"."year" = 2001
GROUP BY "team_id"
ORDER BY "Total Hits" DESC
LIMIT 5;
*/
SELECT "teams"."name", SUM("H") AS "Total Hits" FROM "performances"
JOIN "teams" ON "teams"."id" = "performances"."team_id"
WHERE "performances"."year" = 2001
GROUP BY "team_id"
ORDER BY "Total Hits" DESC
LIMIT 5;
