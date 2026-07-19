-- Write your query below
SELECT id, CASE
            WHEN p_id IS NULL THEN 'Root'
            WHEN EXISTS (SELECT 1 FROM tree t2
                         WHERE t2.p_id = t1.id) THEN 'Inner'
            ELSE 'Leaf'
           END AS type
FROM tree t1;