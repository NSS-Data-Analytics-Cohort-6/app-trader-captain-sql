/*SELECT *
FROM play_store_apps;
SELECT
DISTINCT name,
CAST(price AS money),
review_count,
COALESCE(rating, 0) AS rating,
genres,
category
FROM play_store_apps;
  	 
SELECT
DISTINCT name,
CAST(price AS money),
review_count,
COALESCE(rating, 0) AS rating,
genres AS genre,
INITCAP(REPLACE(category, '_', ' ')) AS category
FROM play_store_apps;*/

/*SELECT DISTINCT p.name,
CAST (a.review_count AS int) AS a_review_count, 
p.review_count AS p_review_count,
a.rating AS a_rating,
p.rating AS p_rating
FROM play_store_apps AS p
INNER JOIN app_store_apps AS a
ON a.name = p.name*/

/*SELECT DISTINCT p.name,
CAST(a.review_count AS int) AS a_review_count,
p.review_count AS p_review_count,
a.rating AS a_rating,
p.rating AS p_rating,
SUM(CAST(a.review_count AS int) + p.review_count) AS total_review_counts
FROM play_store_apps AS p
INNER JOIN app_store_apps AS a
ON a.name = p.name
WHERE a.price <= 1
GROUP BY a.review_count, p.review_count, a.rating, p.rating, p.name;*/

/*SELECT DISTINCT TRIM(a.name),
CAST(a.review_count AS int) AS a_review_count,
p.review_count AS p_review_count,
a.rating AS a_rating,
p.rating AS p_rating,
SUM(CAST(a.review_count AS int) + p.review_count) AS total_review_counts
FROM play_store_apps AS p
INNER JOIN app_store_apps AS a
ON a.name = p.name
WHERE a.price <= 1 AND a.rating >= 4.5 and p.rating >= 4.5
GROUP BY a.review_count, p.review_count, a.rating, p.rating, a.name
ORDER BY total_review_counts DESC
LIMIT 50;*/

/*SELECT DISTINCT TRIM(a.name),
CAST(a.review_count AS int) AS a_review_count,
MAX(p.review_count) AS p_review_count,
a.rating AS a_rating,
p.rating AS p_rating,
SUM(CAST(a.review_count AS int) + p.review_count) AS total_review_counts,
p.genres,
a.primary_genre,
INITCAP(REPLACE(p.category, '_', ' ')) AS category
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
ON a.name = p.name
WHERE a.price <= 1 AND a.rating >= 4.5 AND p.rating >= 4.5
GROUP BY a.review_count, a.rating, p.rating, a.name,  a.primary_genre, p.genres, p.category
ORDER BY total_review_counts DESC;*/

/*SELECT DISTINCT TRIM(a.name),
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
ORDER BY total_review_counts DESC;*/

SELECT
subquery.games_total
/SUM(COUNT(primary_genre)) OVER() AS prim_gen_tot
(SELECT COUNT(primary_genre) AS games_total
FROM app_store_apps
HAVING COUNT(primary_genre) > 3000) AS subquery
FROM app_store_apps;

