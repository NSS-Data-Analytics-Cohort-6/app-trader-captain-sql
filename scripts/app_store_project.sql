

--General Observations
--  Way more play_store_apps than app_store_apps
--    app_store_apps - 7197
--    play_store_apps - 10840


--Starting Strategy
--  Get rid of larger number apps like ABC News
--  Prioritize $1 or less apps and apps that are located in both stores
--  Which apps are both, rather than just one?
--  After cleanup, figure out SQL query to join these two tables (name column would be most appropriate)
--  Filter apps out over $1
--  Look into some SELECT queries for 3a

	 
 
--Play Store Test Queries
  --NAME COLUMN
		SELECT name
		FROM play_store_apps; 
		--RESULT(S):
		  --10,840 Rows Found
		  -- Possibly need translations for foreign languages********************
		  -- Thumbnails/icons removed********************************************
		  
		  SELECT DISTINCT name
		FROM play_store_apps;
		--RESULT(S):
		  -- 9659 rows returned, so there are some duplicates*********************************

		SELECT name
		FROM play_store_apps
		WHERE name IS NULL;
		--RESULT(S):
		  --Good news! No NULLS

  --CATEGORY COLUMN
  		SELECT DISTINCT category -- Reason for DISTINCT is to shorten the list as much as possible. Duplicates in this case are fine.
		FROM play_store_apps
		ORDER BY category; 
		--RESULT(S):
  		-- Checked out fine other than underscores - do we want to leave or remove************************

		SELECT category 
		FROM play_store_apps
		WHERE category IS NULL;
		--RESULT(S):
  		-- No NULLS
		
  --RATNG COLUMN
		SELECT rating
		FROM play_store_apps
		ORDER BY rating DESC;
		--RESULT(S):
		--Almost 1500 nulls***************************
		
		SELECT DISTINCT rating -- Again, DISTINCT is to shorten the list up to make it more observable
		FROM play_store_apps
		WHERE rating IS NOT NULL
		ORDER BY rating DESC;
		--RESULT(S):
		--No additional issues
		
  --REVIEW COUNT COLUMN
  		SELECT review_count
		FROM play_store_apps
		WHERE review_count IS NULL;
		--RESULT(S):
		--No NULLS
		
		SELECT DISTINCT review_count
		FROM play_store_apps
		ORDER BY review_count DESC;
	    --RESULT(S):
		--No issues
		
	   --SIZE COLUMN
		SELECT size
		FROM play_store_apps
		WHERE size IS NULL;	
		--RESULT(S):
		-- No NULLS
	
		SELECT DISTINCT size
		FROM play_store_apps
		ORDER BY size DESC;
		--RESULT(S)
		--My only concern is the last row which bears the text 'Varies with device.' While this row is a text data type, the remaining rows in the                 entire table bear file sizes.*********************************

	  --INSTALL COUNT COLUMN
		SELECT install_count
		FROM play_store_apps
		WHERE size IS NULL;
		--RESULT(S):
		-- No NULLS
	
		SELECT DISTINCT install_count
		FROM play_store_apps
		ORDER BY install_count DESC;
		--RESULT(S)
		--May be fine as is. Show to team to get their opinion

	  --TYPE COLUMN

		SELECT type
		FROM play_store_apps
		WHERE type IS NULL;
		--RESULT(S):
		-- 1 NULL*****************************************
	
		SELECT DISTINCT type
		FROM play_store_apps
		ORDER BY type DESC;
		--RESULT(S):
		-- 1 NULL**************************
		-- No other issues
	
     --PRICE COLUMN
	  
	    SELECT price
		FROM play_store_apps
		WHERE price IS NULL;
		--RESULT(S):
		-- No NULLs
		
		SELECT DISTINCT price
		FROM play_store_apps
		ORDER BY price;
		--RESULT(S):
		--Issue with the amount not sorting correctly, i.e. $154.99 shows up after 15.99 and then 16.99 follows.**************
		
    --CONTENT RATING COLUMN
	   SELECT content_rating
		FROM play_store_apps
		WHERE content_rating IS NULL;
		--RESULT(S)
		--No NULLS
		
		SELECT DISTINCT content_rating
		FROM play_store_apps
		ORDER BY content_rating;
        --RESULT(S)
		--No issues
		--Run it by team
		
	--GENRES COLUMN
	  SELECT genres
		FROM play_store_apps
		WHERE genres IS NULL;
		--RESULT(S)
		--No NULLS
  
		SELECT DISTINCT genres
		FROM play_store_apps
		ORDER BY genres;
		--RESULT(S)
		--A Mess!*********************
		
		SELECT COUNT(DISTINCT genres)
		FROM play_store_apps
		GROUP BY genres
		ORDER BY genres;
		--RESULT(S)
		--Was just curious - There are 119 diferent genres, many with very similar names*********************
		
		
		
--App Store Test Queries
  --NAME COLUMN
   SELECT name
   FROM app_store_apps;
   --RESULT(S)
		--There are 7197 rows
   SELECT DISTINCT name
   FROM app_store_apps
   ORDER BY name;
   --RESULT(S)
		--There are 7195 rows, so only 2 duplicates*************
		--There are many names in foreign languages and names with special characters**************
   SELECT name
   FROM app_store_apps
   WHERE name IS NULL;
   --RESULT(S)
		--No NULLS
		
  --SIZE BYTES COLUMN
  
  SELECT size_bytes
  FROM app_store_apps
  WHERE size_bytes IS NULL;
  --RESULT(S)
		--No NULLS
		
  SELECT DISTINCT size_bytes
		FROM app_store_apps
		ORDER BY size_bytes;
        --RESULT(S)
		--No issues, the only thing I could think of is spaces on the right side of the bytes amount, but they're on numbers with less digits and I               think the values are left aligned. 
		
  --CURRENCY COLUMN
  SELECT currency
  FROM app_store_apps
  WHERE currency IS NULL;
  --RESULT(S)
		--No NULLS
		
  SELECT DISTINCT currency
		FROM app_store_apps
		ORDER BY currency;
  		--RESULT(S)
		--No Issues

  --PRICE COLUMN
    SELECT price
    FROM app_store_apps
    WHERE price IS NULL;
	--RESULT(S)
		--No NULLS
		
	SELECT DISTINCT price
	FROM app_store_apps
	ORDER BY price
  	--RESULT(S)
	--No Issues	
	
  --REVIEW COUNT COLUMN
    SELECT review_count
    FROM app_store_apps
    WHERE review_count IS NULL;
	--RESULT(S)
		--No NULLS
   
	SELECT DISTINCT review_count
	FROM app_store_apps
	ORDER BY review_count DESC;
  	--RESULT(S)
	--Not sorting correctly************	
	
	--RATING COLUMN
	SELECT rating
    FROM app_store_apps
    WHERE rating IS NULL;
	--RESULT(S)
		--No NULLS
		
	SELECT DISTINCT rating
	FROM app_store_apps
	ORDER BY rating DESC;
	--RESULT(S)
	--No Issues
	
--CONTENT_RATING COLUMN
  SELECT content_rating
    FROM app_store_apps
    WHERE content_rating IS NULL;
	--RESULT(S)
		--No NULLS
		
    SELECT DISTINCT content_rating
	FROM app_store_apps
	ORDER BY content_rating DESC;
	--RESULT(S)
	--No Issues
	
-- PRIMARY GENRE
   SELECT primary_genre
   FROM app_store_apps
   WHERE primary_genre IS NULL;
   --RESULT(S)
		--No NULLS
   
   SELECT DISTINCT primary_genre
   FROM app_store_apps
   ORDER BY primary_genre DESC;
   --RESULT(S)
	--No Issues
   
	

	
--Queries from Class 	
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
SELECT name, rating, CAST(review_count AS float) 
FROM app_store_apps
WHERE rating >= 4
ORDER BY rating DESC, review_count DESC
LIMIT 50;

SELECT name, rating, review_count
FROM app_store_apps
WHERE rating >= 4
ORDER BY rating DESC, review_count DESC
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
USING name;*/

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
ON a.name = p.name; */



