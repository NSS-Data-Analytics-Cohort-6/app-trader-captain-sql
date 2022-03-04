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
WHERE a.price < 1 

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


SELECT
		DISTINCT name,
		CAST(price AS money),
		review_count,
		COALESCE(rating, 0) AS rating,
		genres,
		category
		FROM play_store_apps;
		
		
SELECT * FROM play_store_apps
SELECT * FROM app_store_apps
SELECT *
FROM
		(SELECT DISTINCT name,
		CAST(price AS money),
		review_count,
		COALESCE(rating, 0) AS rating,
		genres AS genre,
		INITCAP(REPLACE(category, '_', ' ')) AS category
		FROM play_store_apps) as sub_p
SELECT *
FROM
		(SELECT DISTINCT name,
		CAST(price AS money),
		CAST(review_count AS int),
		rating,
		primary_genre AS genre
		FROM app_store_apps) as sub_a 
		
SELECT DISTINCT name,
		CAST(p.price AS money) AS price
		SUM(CAST(a.review_count AS int) + p.review_count) AS review_count
		COALESCE(p.rating, 0) AS p_rating,
		COALESCE(a.rating, 0) AS a_rating,
		genres AS genre,
		INITCAP(REPLACE(category, '_', ' ')) AS category
		FROM play_store_apps AS p
		
		CAST(a.review_count AS int),
		rating,
		primary_genre AS genre
		FROM app_store_apps AS a
INNER JOIN
ON p.name = a.name AND 



		

number/SUM(number) AS percent_of_total
SELECT COUNT(primary_genre) AS count_of_genre, 
primary_genre
FROM app_store_apps
GROUP BY primary_genre
ORDER BY count_of_genre DESC;

 
SELECT subs.count_of_genre, 
	subs.primary_genre, 
	subs.total_reviews
	subs.count_of_genre/subs.total_reviews*100 AS percent_of_genre
		FROM (SELECT sub.count_of_genre, 
					sub.primary_genre, 
					SUM(sub.count_of_genre) OVER() AS total_reviews
						FROM (SELECT 
							COUNT(primary_genre) AS count_of_genre, 
								primary_genre 
									FROM app_store_apps
									GROUP BY app_store_apps.primary_genre) AS sub) AS subs
						INNER JOIN app_store_apps
						ON app_store_apps.primary_genre = sub.primary_genre
						GROUP BY app_store_apps.primary_genre, sub.primary_genre, sub.count_of_genre
						ORDER BY count_of_genre DESC;) AS subs
			INNER JOIN app_store_apps
						ON app_store_apps.primary_genre = subs.primary_genre
						GROUP BY app_store_apps.primary_genre, subs.primary_genre, subs.count_of_genre, subs.total_reviews
						ORDER BY count_of_genre DESC;
						
--list of primary genres and their number of occurances in the appstore
SELECT

SELECT COUNT(primary_genre) AS count_of_genre, 
		primary_genre 
			FROM app_store_apps
GROUP BY primary_genre	
ORDER BY count_of_genre DESC;

SELECT COUNT(primary_genre) AS count_of_genre, 
		primary_genre, 
		COUNT(primary_genre)/7197*100 AS percent
			FROM app_store_apps
GROUP BY primary_genre	
ORDER BY count_of_genre DESC;


SELECT sub.count_of_genre, 
	sub.primary_genre, 
	SUM(sub.count_of_genre) OVER() AS total_number_of_apps
		FROM (SELECT 
			COUNT(primary_genre) AS count_of_genre, 
			primary_genre
				FROM app_store_apps
				GROUP BY app_store_apps.primary_genre) AS sub
				
SELECT primary_genre, count_of_genre, SUM((count_of_genre)/7197)*100 AS percentage
FROM	(SELECT COUNT(primary_genre) AS count_of_genre, 
			primary_genre
				FROM app_store_apps
				GROUP BY app_store_apps.primary_genre) AS sub
GROUP BY count_of_genre, primary_genre
ORDER BY count_of_genre DESC;

SELECT COUNT(*)
FROM 


SELECT
subquery.games_total
COUNT(primary_genre) OVER() AS prim_gen_tot
(SELECT COUNT(primary_genre) AS games_total
FROM app_store_apps
HAVING COUNT(primary_genre) > 3000) AS subquery
FROM app_store_apps;

SELECT sub.count_of_genre,
	sub.primary_genre,
	SUM(sub.count_of_genre) OVER() AS total_reviews
		FROM (SELECT
			COUNT(primary_genre) AS count_of_genre,
			primary_genre
				FROM app_store_apps
				GROUP BY app_store_apps.primary_genre) AS sub
						

SELECT DISTINCT primary_genre FROM app_store_apps




SELECT COUNT(primary_genre) AS count_of_genre, 
			primary_genre
FROM app_store_apps
GROUP BY primary_genre
ORDER BY count_of_genre DESC;

SELECT primary_genre, count_of_genre
FROM	(SELECT COUNT(primary_genre) AS count_of_genre,
			primary_genre
				FROM app_store_apps
				GROUP BY app_store_apps.primary_genre) AS sub
GROUP BY count_of_genre, primary_genre
ORDER BY count_of_genre DESC
LIMIT 10;


*/

--FOR EXCEL VISUALIZATIONS

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
WHERE a.price <= 1 AND a.rating >= 4.0 AND p.rating >= 4.0
GROUP BY a.review_count, a.rating, p.rating, a.name,  a.primary_genre, p.genres
ORDER BY total_review_counts;


SELECT DISTINCT a.name,
CAST(a.review_count AS int) AS a_review_count,
MAX(p.review_count) AS p_review_count,
a.rating AS a_rating,
p.rating AS p_rating,
SUM(CAST(a.review_count AS int) + p.review_count) AS total_review_counts,
p.genres,
a.primary_genre, a.content_rating
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
ON a.name = p.name
WHERE a.price <= 1 AND a.rating >= 4.0 AND p.rating >= 4.0
GROUP BY a.review_count, a.rating, p.rating, a.name,  a.primary_genre, p.genres, a.content_rating
ORDER BY total_review_counts;


SELECT DISTINCT content_rating, 
COUNT(content_rating) AS count_of_age_group
FROM app_store_apps
WHERE primary_genre = 'Games'
GROUP BY content_rating;

SELECT DISTINCT a.name,
CAST(a.review_count AS int) AS a_review_count,
MAX(p.review_count) AS p_review_count,
a.rating AS a_rating,
p.rating AS p_rating,
SUM(CAST(a.review_count AS int) + p.review_count) AS total_review_counts,
p.genres,
a.primary_genre, a.content_rating
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
ON a.name = p.name
WHERE a.price <= 1 AND a.rating >= 4.0 AND p.rating >= 4.0
GROUP BY a.review_count, a.rating, p.rating, a.name,  a.primary_genre, p.genres, a.content_rating
ORDER BY total_review_counts DESC
LIMIT 20;
