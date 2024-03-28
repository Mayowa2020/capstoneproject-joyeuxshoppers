-- Gender Analysis
-- Write a query to display the revenue generated by gender.
-- Include the Gender (M/F) , total revenue, and total items purchased.

USE capstone_db;
SELECT
    u.gender,
    SUM(oi.sale_price*o.num_of_item) AS total_revenue,
	SUM(o.num_of_item) AS total_quatity_sold
FROM
    order_items oi
JOIN
    orders o ON oi.order_id = o.order_id
JOIN
    users u ON o.user_id = u.id
WHERE
    o.status NOT IN ('Cancelled', 'Returned')
GROUP BY
    u.gender;