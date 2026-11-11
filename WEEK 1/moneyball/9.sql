/*
SELECT "teams"."name", ROUND(AVG("salaries"."salary"), 2) AS "Average Salary" FROM "salaries"
JOIN "teams" ON "teams"."id" = "salaries"."team_id"
WHERE "salaries"."year" = 2001
ORDER BY "Average Salary" ASC

SELECT "name", AVG("salaries"."salary")FROM "teams"
JOIN "salaries" ON "salaries"."team_id" = "teams"."id"
GROUP BY "teams"."name"
HAVING "salaries"."year" = 2001
*/
SELECT "teams"."name", ROUND(AVG("salary"), 2) AS "Average Salary" FROM "salaries"
JOIN "teams" ON "teams"."id" = "salaries"."team_id"
WHERE "salaries"."year" = 2001
GROUP BY "teams"."id"
ORDER BY "Average Salary"
LIMIT 5;
