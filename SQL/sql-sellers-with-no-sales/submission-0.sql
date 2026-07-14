-- Write your query below
SELECT seller_name
FROM seller s
WHERE NOT EXISTS (SELECT 1
                  FROM orders o
                  WHERE o.seller_id = s.seller_id
                    AND sale_date BETWEEN '2020-01-01' AND '2020-12-31')
ORDER BY seller_name;