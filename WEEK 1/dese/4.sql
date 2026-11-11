--SELECT * FROM "schools" WHERE "type" = 'Public School';

SELECT COUNT("type") AS "Number of Public School in a City", "city" FROM "schools" WHERE "type" = 'Public School' GROUP BY "city" ORDER BY "Number of Public School in a City" DESC, "city" ASC LIMIT 10 ;
