SELECT *
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
ON a.name = p.name;	
	
--Apps that are less than a $1	
SELECT *
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
ON a.name = p.name
where a.price < 1;


SELECT *
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
ON a.name = p.name;


SELECT *
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
ON a.name = p.name
where a.price < 1;


SELECT *
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
ON a.name = p.name
WHERE a.price < 1;


--Trying to combine the ratings
SELECT a.name,
SUM(CAST(p.rating AS float), CAST(a.rating AS float)) AS combined_rating
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
ON a.name = p.name
WHERE a.price < 1
SELECT SUM(p.rating + a.rating) AS combined_rating
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
ON a.name = p.name
WHERE a.price < 1


--TOP 10 Apps with highest review count (app_store)
SELECT name, CAST(review_count AS float), rating
FROM app_store_apps
WHERE rating >= 4
ORDER BY review_count DESC, rating DESC
LIMIT 50;
SELECT name, review_count, rating
FROM app_store_apps
WHERE rating >= 4
ORDER BY review_count DESC, rating DESC
LIMIT 50;
		
/*WITH app_store_rating AS

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
USING 

/*WITH app_store_rating AS

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

SELECT name, a.review_count, p.review_count rating, a.rating, p.rating
FROM play_store_rating as p
INNER JOIN app_store_rating as a
ON a.name = p.name;