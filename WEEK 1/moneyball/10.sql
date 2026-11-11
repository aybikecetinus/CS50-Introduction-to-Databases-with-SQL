SELECT "first_name", "last_name", "salaries"."salary", "performances"."HR", "performances"."year" FROM "players"
JOIN "performances" ON "performances"."player_id" = "players"."id"
JOIN "salaries" ON "salaries"."player_id" = "players"."id"
WHERE "salaries"."year" = "performances"."year"
ORDER BY "players"."id" ASC,"performances"."year" DESC, "performances"."HR" DESC, "salaries"."salary" DESC
;
