-- Write your query below
WITH sorted AS (
    SELECT * FROM point ORDER BY x ASC
)
SELECT MIN(x - x_prev) AS shortest
FROM (
    SELECT x, LAG(x) OVER() AS x_prev FROM sorted
) t;