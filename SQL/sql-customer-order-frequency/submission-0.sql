-- Write your query below
SELECT c.customer_id, name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id AND
                  o.order_date BETWEEN '2020-06-01' AND '2020-06-30'
JOIN product p ON p.product_id = o.product_id
GROUP BY c.customer_id, name
HAVING SUM(o.quantity * p.price) >= 100
INTERSECT ALL
SELECT c.customer_id, name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id AND
                  o.order_date BETWEEN '2020-07-01' AND '2020-07-31'
JOIN product p ON p.product_id = o.product_id
GROUP BY c.customer_id, name
HAVING SUM(o.quantity * p.price) >= 100;