-- Revenue generated over the last nine months

USE capstone_db;
   SELECT
		DATE_FORMAT(o.created_at, '%Y-%m-01') AS month,
		SUM(num_of_item) AS total_quantity_sold,
        SUM(oi.sale_price*o.num_of_item) AS revenue,
		COUNT(DISTINCT o.order_id)  AS total_orders,
        COUNT(DISTINCT u.id)  AS total_customers,
        u.country
        
	FROM 
		order_items oi
	JOIN 
		orders o ON oi.order_id = o.order_id
	JOIN
		users u ON o.user_id = u.id
	WHERE 
		o.status NOT IN ('Cancelled', 'Returned')
	GROUP BY
		month
	ORDER BY
		month DESC
        LIMIT 9;