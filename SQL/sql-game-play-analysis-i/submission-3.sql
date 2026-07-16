-- Write your query below
SELECT player_id, event_date AS first_login
FROM (
    SELECT *, 
           DENSE_RANK() OVER(PARTITION BY player_id ORDER BY event_date) AS rnk
    FROM activity
)
WHERE rnk = 1;