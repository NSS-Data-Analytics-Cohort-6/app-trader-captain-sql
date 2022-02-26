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
		
*WITH app_store_rating AS

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
USING name;*

*WITH app_store_rating AS
SELECT name, CAST(review_count AS float),rating
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

Query for comparing rating and review count (only $1 or less apps):

SELECT DISTINCT TRIM(a.name),
CAST(a.review_count AS int) AS a_review_count,
MAX(p.review_count) AS p_review_count,
a.rating AS a_rating,
p.rating AS p_rating,
SUM(CAST(a.review_count AS int) + p.review_count) AS total_review_counts,
p.genres,
a.primary_genre
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
ON a.name = p.name
WHERE a.price <= 1 AND a.rating >= 4.5 AND p.rating >= 4.5
GROUP BY a.review_count, a.rating, p.rating, a.name,  a.primary_genre, p.genres
ORDER BY total_review_counts DESC;

SELECT DISTINCT a.name,
CAST(a.review_count AS int) AS a_review_count,
MAX(p.review_count) AS p_review_count,
a.rating AS a_rating,
p.rating AS p_rating,
SUM(CAST(a.review_count AS int) + p.review_count) AS total_review_counts,
p.genres,
a.primary_genre
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
ON a.name = p.name
WHERE a.price <= 1 AND a.rating >= 4.5 AND p.rating >= 4.5
GROUP BY a.review_count, a.rating, p.rating, a.name,  a.primary_genre, p.genres
ORDER BY total_review_counts;


SELECT COUNT(primary_genre) AS count_of_genre, 
		primary_genre, 
		COUNT(primary_genre)/7197*100 AS percent
			FROM app_store_apps
GROUP BY primary_genre	
ORDER BY count_of_genre DESC;

SELECT primary_genre, count_of_genre, count_of_genre/1797*100 AS percentage
FROM	(SELECT COUNT(primary_genre) AS count_of_genre,
			primary_genre
				FROM app_store_apps
				GROUP BY app_store_apps.primary_genre) AS sub
GROUP BY count_of_genre, primary_genre
ORDER BY count_of_genre DESC;
