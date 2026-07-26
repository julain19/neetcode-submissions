-- Write your query below
SELECT c.name AS customer_name, c.customer_id, o.order_id, o.order_date
FROM customers c
JOIN (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date DESC) AS rnk
    FROM orders
) o ON c.customer_id = o.customer_id
WHERE rnk IN (1, 2, 3)
ORDER BY c.name, c.customer_id, o.order_date DESC;