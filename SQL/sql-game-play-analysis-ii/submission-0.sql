-- Write your query below
SELECT player_id, device_id
FROM (
    SELECT *, RANK() OVER (PARTITION BY player_id ORDER BY event_date) AS rnk
    FROM activity
) t
WHERE rnk = 1;