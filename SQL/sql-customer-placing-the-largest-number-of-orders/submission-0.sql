-- Write your query below
SELECT customer_number
FROM
(SELECT customer_number, COUNT(order_number) AS orders
FROM orders
GROUP BY customer_number
ORDER BY orders DESC
LIMIT 1);