-- Age Distribution Analysis - 
-- The company is interested in a number of marketing campaigns and they would like to target different age groups. Write a query to display the order distribution across various age groups. For the sake of this analysis, your analysis should consider the age group defined below.
  
-- Age Group
-- Age range (years)
-- Kids
-- 12 and below
-- Teenager
-- 13 - 19
-- Adult
-- 20 - 55
-- Senior
-- 56 and above

-- Write a query to display the customer count by age group.


USE capstone_db;
SELECT
    CASE
        WHEN age <= 12 THEN 'Kids'
        WHEN age BETWEEN 13 AND 19 THEN 'Teenager'
        WHEN age BETWEEN 20 AND 55 THEN 'Adult'
        WHEN age >= 56 THEN 'Senior'
        ELSE 'Unknown'
    END AS age_group,
    COUNT(DISTINCT id) AS customer_count 
FROM
    users
WHERE
    id IN (SELECT DISTINCT user_id FROM orders WHERE status NOT IN ('Cancelled', 'Returned'))
GROUP BY
    age_group
ORDER BY
    age_group;