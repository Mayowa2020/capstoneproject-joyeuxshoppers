-- Best Performing Channels
-- What are the top 3 best performing channels?

USE capstone_db;
SELECT e.traffic_source AS channels, COUNT(*) AS event_count
FROM events e
JOIN users u ON e.user_id = u.id
JOIN orders o ON u.id = o.user_id
WHERE o.status NOT IN ('Cancelled', 'Returned')
GROUP BY e.traffic_source
ORDER BY event_count DESC
LIMIT 3;