

--General Observations
--  Way more play_store_apps than app_store_apps
--    app_store_apps - 7197
--    play_store_apps - 10840
--    So far after quering, no nulls found in app_store_apps



--Starting Strategy
--  Get rid of larger number apps like ABC News
--  Prioritize $1 or less apps and apps that are located in both stores
--  Which apps are both, rather than just one?
--  After cleanup, figure out SQL query to join these two tables (name column would be most appropriate)
--  Filter apps out over $1
--  Look into some SELECT queries for 3a

/*SELECT *
FROM play_store_apps;*/

/*SELECT *
FROM app_store_apps;*/


