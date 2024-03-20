-- Demography Analysis
-- Write a query to display a breakdown of the total customers by country,
-- the breakdown should include the gender of the customers.

USE capstone_db;
SELECT
    u.country,
    u.gender,
    COUNT(DISTINCT o.user_id) AS customer_count
FROM
    users u
JOIN
    orders o ON u.id = o.user_id
WHERE
    o.status NOT IN ('Cancelled', 'Returned')
GROUP BY
    u.country, u.gender
ORDER BY
    u.country, u.gender;