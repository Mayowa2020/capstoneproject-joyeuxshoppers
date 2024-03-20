-- Top Selling Products, Brands, Categories
-- Write SQL Queries to show the following based on the quantity sold
-- Top selling products 

-- Display the total sales value as well as the total quantity sold.
-- Include a rank as the first column of the result set
-- Use rank. row number, dense rank, for them respectively
-- Row_number function where there is a tie in total quantity sold, displays the same rank for the item/product/brand.


-- Top selling products 
USE capstone_db;
WITH product_sales AS (
    SELECT
        p.id,
        p.name,
        SUM(o.num_of_item) AS total_quantity_sold,
		SUM(oi.sale_price * o.num_of_item) AS total_sales_value
    FROM
        products p
    JOIN
        order_items oi ON p.id = oi.product_id
    JOIN
        orders o ON oi.order_id = o.order_id
    WHERE
        o.status NOT IN ('Cancelled', 'Returned')
    GROUP BY
        p.id, p.name
)
SELECT
    RANK()  OVER (ORDER BY total_quantity_sold DESC) AS product_rank,
    ROW_NUMBER() OVER (ORDER BY total_quantity_sold DESC) AS product_row,
	DENSE_RANK() OVER (ORDER BY total_quantity_sold DESC) AS product_dense_rank,
    id,
    name AS product,
    total_quantity_sold,
    total_sales_value
FROM
    product_sales;
