WITH app_store_rating AS
SELECT name, CAST(review_count AS float), rating
FROM app_store_apps
WHERE rating > 4
ORDER BY review_count DESC
LIMIT 50;

WITH play_store_rating AS 
SELECT name, review_count, rating
FROM app_store_apps
WHERE rating > 4
ORDER BY rating DESC, review_count DESC
LIMIT 50;


SELECT * 
FROM play_store_rating
INNER JOIN app_store_rating
USING name;