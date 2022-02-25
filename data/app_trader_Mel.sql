/*
SELECT name, category, rating, review_count, size, install_count, type, price, content_rating, genres
FROM play_store_apps
WHERE rating IS NULL
GROUP BY name, category, rating, review_count, size, install_count, type, price, content_rating, genres; 

SELECT COUNT(review_count)
FROM app_store_apps
WHERE CAST(review_count AS int) > 5000; */


/* SELECT *
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
ON a.name = p.name
WHERE a.price < 1
HAVING SUM(CAST(p.rating AS float), CAST(a.rating AS float)) >= 4.00;

SELECT
		SUM(p.rating, a.rating) AS combined_rating
		
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
ON a.name = p.name
WHERE a.price < 1

SELECT SUM(p.rating + a.rating) AS combined_rating
FROM app_store_apps AS a
	(SELECT * FROM app_store_apps INNER JOIN play_store_apps AS p
ON a.name = p.name
WHERE a.price < 1)
INNER JOIN play_store_apps AS p
ON a.name = p.name
WHERE a.price < 1 */

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
ORDER BY review_count DESC
LIMIT 50;


WITH app AS 
SELECT *
FROM app_store_apps
WHERE rating >= 4 AND CAST(price AS numeric) < 1 
ORDER BY review_count DESC, rating DESC

WITH play AS
SELECT *
FROM play_store_apps
WHERE rating >= 4 AND CAST(replace(price, '$', '') AS numeric) < 1 
ORDER BY review_count DESC, rating DESC

SELECT *
FROM play as p
INNER JOIN app as a
ON a.name = p.name
ORDER BY review_count DESC, rating DESC;



