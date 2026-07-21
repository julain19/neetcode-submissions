-- Write your query below
SELECT COALESCE(e.employee_id, s.employee_id) AS employee_id
FROM employees e
FULL OUTER JOIN salaries s ON e.employee_id = s.employee_id
WHERE s.salary IS NULL OR e.name IS NULL
ORDER BY employee_id;