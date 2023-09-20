CREATE VIEW daily_update_of_the_week_view AS
SELECT 
  o.id AS order_id,
  o.products,
  u.id AS user_id,
  CONCAT(u.first_name, ' ', u.last_name) AS name,
  u.email,
  o.address,
  o.amount,
  p.id AS payment_id,
  p.type AS payment_type,
  os.id AS order_status_id,
  os.title AS order_status_title,
  o.shipped_at
FROM orders o
JOIN users u ON o.user_id = u.id
JOIN payments p ON o.payment_id = p.id
JOIN orders_statuses os ON o.order_status_id = os.id
WHERE WEEK(o.created_at) = WEEK(NOW()) AND YEAR(o.created_at) = YEAR(NOW());

SELECT * FROM daily_update_of_the_week_view;
