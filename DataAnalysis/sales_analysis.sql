-- Data Analysis
-- Having completed all the steps in the data preparation and loading phase, you will now carry out some analysis on the dataset.
-- All queries should exclude orders in the Canceled and Returned status.
-- The VP of Online Sales is interested in tracking the following metrics.

-- Sales Analysis
-- Total revenue generated on a monthly basis, your result should include the date (displayed as the first day of the month), total sales, total orders as well as customer count.

 USE capstone_db;
   SELECT
		DATE_FORMAT(o.created_at, '%Y-%m-01') AS month,
		SUM(num_of_item) AS total_quantity_sold,
        SUM(oi.sale_price*o.num_of_item) AS total_sales,
		COUNT(DISTINCT o.order_id)  AS total_orders,
        COUNT(DISTINCT o.user_id) AS customer_count
	FROM 
		order_items oi
	JOIN 
		orders o ON oi.order_id = o.order_id
	WHERE 
		o.status NOT IN ('Cancelled', 'Returned')
	GROUP BY
		month
	ORDER BY
		month;     


