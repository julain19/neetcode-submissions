-- Write your query below
WITH parents AS (
    SELECT p_id
    FROM tree
    WHERE p_id IS NOT NULL
)
SELECT id, CASE
            WHEN p_id IS NULL THEN 'Root'
            WHEN id IN (SELECT * FROM parents) THEN 'Inner'
            WHEN id NOT IN (SELECT * FROM parents) THEN 'Leaf'
           END AS type
FROM tree;