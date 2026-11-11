SELECT "districts"."name" FROM "expenditures"
JOIN "districts" ON "districts"."id" = "expenditures"."district_id"
ORDER BY "expenditures"."pupils" ASC LIMIT 1;
