-- Customer distribution by age group
USE capstone_db;
SELECT
    CASE
        WHEN age <= 12 THEN 'Kids'
        WHEN age BETWEEN 13 AND 19 THEN 'Teenager'
        WHEN age BETWEEN 20 AND 55 THEN 'Adult'
        WHEN age >= 56 THEN 'Senior'
        ELSE 'Unknown'
    END AS age_group,
    COUNT(DISTINCT id) AS customer_count  -- Corrected to use 'id' instead of 'user_id'
FROM
    users
WHERE
    id IN (SELECT DISTINCT user_id FROM orders WHERE status NOT IN ('Cancelled', 'Returned'))
GROUP BY
    age_group
ORDER BY
    age_group;