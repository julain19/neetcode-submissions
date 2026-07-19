-- Write your query below
WITH friends AS (
    SELECT CASE 
      WHEN user1_id = 1 
      THEN user2_id 
      ELSE user1_id 
    END AS user_id
    FROM friendship
    WHERE 1 IN (user1_id, user2_id)
)
SELECT DISTINCT l.page_id AS recommended_page
FROM likes l
JOIN friends f ON f.user_id = l.user_id
WHERE l.page_id NOT IN (SELECT page_id FROM likes WHERE user_id = 1);