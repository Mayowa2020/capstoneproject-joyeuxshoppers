-- Gender distribution for all orders made

USE capstone_db;
SELECT COUNT(order_id) AS total_orders, gender
FROM orders o
WHERE status NOT IN ('Cancelled', 'Returned')
GROUP BY gender
ORDER BY total_orders DESC;