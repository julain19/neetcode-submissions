-- Write your query below
SELECT CASE WHEN s.salary IS NULL THEN e.employee_id
            WHEN e.name IS NULL THEN s.employee_id
       END AS employee_id
FROM employees e
FULL OUTER JOIN salaries s ON e.employee_id = s.employee_id
WHERE s.salary IS NULL OR e.name IS NULL
ORDER BY employee_id;