-- Top ten countries with the most sales

USE capstone_db;
SELECT u.country, SUM(o.num_of_item) AS total_sales
FROM orders o
JOIN users u ON o.user_id = u.id
WHERE status NOT IN ('Cancelled', 'Returned')
GROUP BY u.country
ORDER BY total_sales DESC
LIMIT 10;