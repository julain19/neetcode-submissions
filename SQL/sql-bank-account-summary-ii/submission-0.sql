-- Write your query below
SELECT name, SUM(amount) AS balance
FROM transactions
NATURAL JOIN users
GROUP BY name
HAVING SUM(amount) > 10000;