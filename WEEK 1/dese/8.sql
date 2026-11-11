SELECT "pupils", "districts"."name" FROM "expenditures"
JOIN "districts" ON "districts"."id" = "expenditures"."district_id";

