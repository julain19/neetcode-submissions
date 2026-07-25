-- Write your query below
WITH team AS (
    SELECT team_id, COUNT(*) AS team_size
    FROM employee
    GROUP BY team_id
)
SELECT e.employee_id, t.team_size
FROM employee e
JOIN team t ON e.team_id = t.team_id;