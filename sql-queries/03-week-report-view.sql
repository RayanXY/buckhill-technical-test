CREATE VIEW weekly_report_view AS
SELECT
    MAX(CASE WHEN DAYOFWEEK(created_at) = 2 THEN (CONCAT_WS('::', o.uuid, JSON_LENGTH(o.products), ROUND(o.amount * 100))) END) AS Monday,
    MAX(CASE WHEN DAYOFWEEK(created_at) = 3 THEN (CONCAT_WS('::', o.uuid, JSON_LENGTH(o.products), ROUND(o.amount * 100))) END) AS Tuesday,
    MAX(CASE WHEN DAYOFWEEK(created_at) = 4 THEN (CONCAT_WS('::', o.uuid, JSON_LENGTH(o.products), ROUND(o.amount * 100))) END) AS Wednesday,
    MAX(CASE WHEN DAYOFWEEK(created_at) = 5 THEN (CONCAT_WS('::', o.uuid, JSON_LENGTH(o.products), ROUND(o.amount * 100))) END) AS Thursday,
    MAX(CASE WHEN DAYOFWEEK(created_at) = 6 THEN (CONCAT_WS('::', o.uuid, JSON_LENGTH(o.products), ROUND(o.amount * 100))) END) AS Friday,
    MAX(CASE WHEN DAYOFWEEK(created_at) = 7 THEN (CONCAT_WS('::', o.uuid, JSON_LENGTH(o.products), ROUND(o.amount * 100))) END) AS Saturday,
    MAX(CASE WHEN DAYOFWEEK(created_at) = 1 THEN (CONCAT_WS('::', o.uuid, JSON_LENGTH(o.products), ROUND(o.amount * 100))) END) AS Sunday
FROM orders o
WHERE YEARWEEK(o.created_at) = YEARWEEK(NOW());

SELECT * FROM weekly_report_view;
