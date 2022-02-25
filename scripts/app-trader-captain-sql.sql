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

