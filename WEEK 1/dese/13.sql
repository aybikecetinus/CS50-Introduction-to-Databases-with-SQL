SELECT "name", "expenditures"."per_pupil_expenditure", "staff_evaluations"."exemplary" FROM "districts"
JOIN "expenditures" ON "expenditures"."district_id" = "districts"."id"
JOIN "staff_evaluations" ON "staff_evaluations"."district_id" = "districts"."id";
