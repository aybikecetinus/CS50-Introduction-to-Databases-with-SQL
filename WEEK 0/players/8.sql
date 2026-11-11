SELECT ROUND(AVG("height"), 2) AS "Average Height", ROUND(AVG("weight"), 2 ) AS "Average Weight" FROM "players" WHERE "debut" BETWEEN '2000-01-01' AND '2023-12-31';
