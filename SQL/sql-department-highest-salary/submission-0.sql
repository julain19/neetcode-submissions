-- Write your query below
SELECT d.name AS department, e.name AS employee, e.salary
FROM department d
JOIN (
    SELECT *, RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS rnk
    FROM employee
) e ON e.department_id = d.id
WHERE rnk = 1;