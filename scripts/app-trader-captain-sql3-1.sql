select *
from app_store_apps
where price < 1.00
Order by price desc;

SELECT *
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
ON a.name = p.name;

SELECT *
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
ON a.name = p.name
WHERE a.price < 1;

SELECT SUM(p.rating + a.rating) AS combined_rating
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
ON a.name = p.name
WHERE a.price < 1;

SELECT name, CAST(review_count AS float), rating
FROM app_store_apps
WHERE rating >= 4
ORDER BY rating DESC, review_count DESC
LIMIT 100;

Select name, (Cast(review_count AS integer)/rating)
From app_store_apps;

SELECT DISTINCT p.name,
CAST(a.review_count AS int) AS a_review_count,
p.review_count AS p_review_count,
a.rating AS a_rating,
p.rating AS p_rating,
SUM(CAST(a.review_count AS int) + p.review_count) AS total_review_counts
FROM play_store_apps AS p
INNER JOIN app_store_apps AS a
ON a.name = p.name
WHERE a.price <= 1
GROUP BY a.review_count, p.review_count, a.rating, p.rating, p.name;

SELECT DISTINCT TRIM(a.name),
CAST(a.review_count AS int) AS a_review_count,
MAX(p.review_count) AS p_review_count,
a.rating AS a_rating,
p.rating AS p_rating,
SUM(CAST(a.review_count AS int) + p.review_count) AS total_review_counts
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
ON a.name = p.name
WHERE a.price <= 1 AND a.rating >= 4.5 AND p.rating >= 4.5
GROUP BY a.review_count, a.rating, p.rating, a.name
ORDER BY total_review_counts DESC
LIMIT 50;

SELECT DISTINCT TRIM(a.name),
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

SELECT COUNT(*),primary_genre
FROM app_store_apps
GROUP BY primary_genre
ORDER BY count DESC;

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