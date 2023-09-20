CREATE VIEW weekly_report_view AS
SELECT
    DATE_FORMAT(o.created_at, '%W %d/%m/%Y') AS day_date,
    GROUP_CONCAT(CONCAT_WS('::', o.uuid, JSON_LENGTH(o.products), ROUND(o.amount * 100))) AS order_info
FROM orders o
WHERE YEARWEEK(o.created_at) = YEARWEEK(NOW())
GROUP BY day_date;

SELECT * FROM weekly_report_view;
