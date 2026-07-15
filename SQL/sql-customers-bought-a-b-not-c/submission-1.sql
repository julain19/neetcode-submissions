-- Write your query below
SELECT DISTINCT customer_id, customer_name
FROM customers c
NATURAL JOIN (SELECT customer_id
              FROM orders
              WHERE product_name = 'A')
NATURAL JOIN (SELECT customer_id
              FROM orders
              WHERE product_name = 'B')
WHERE customer_id NOT IN (SELECT customer_id
                          FROM orders
                          WHERE product_name = 'C')
ORDER BY customer_name;