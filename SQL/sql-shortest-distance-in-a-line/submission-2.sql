-- Write your query below
SELECT MIN(x - x_prev) AS shortest
FROM (
    SELECT x, LAG(x) OVER() AS x_prev FROM point
) t;