-- Top Selling Products, Brands, Categories
-- Write SQL Queries to show the following based on the quantity sold
-- Top Selling brands 

-- Display the total sales value as well as the total quantity sold.
-- Include a rank as the first column of the result set
-- Use rank. row number, dense rank, for them respectively
-- Row_number function where there is a tie in total quantity sold, displays the same rank for the item/product/brand.

-- Top Selling Brands:

USE capstone_db
WITH brand_sales AS (
    SELECT
        p.brand,
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
        p.brand
)
SELECT
	RANK()  OVER (ORDER BY total_quantity_sold DESC) AS brand_rank,
    ROW_NUMBER() OVER (ORDER BY total_quantity_sold DESC) AS brand_row,
	DENSE_RANK() OVER (ORDER BY total_quantity_sold DESC) AS brand_dense_rank,
    brand,
    total_quantity_sold,
    total_sales_value
FROM
    brand_sales;
