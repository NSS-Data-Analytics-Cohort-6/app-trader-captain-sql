/*SELECT name, category, rating, review_count, size, install_count, type, price, content_rating, genres
FROM play_store_apps
WHERE rating IS NULL
GROUP BY name, category, rating, review_count, size, install_count, type, price, content_rating, genres; 

SELECT COUNT(review_count)
FROM app_store_apps
WHERE CAST(review_count AS int) > 5000; */


