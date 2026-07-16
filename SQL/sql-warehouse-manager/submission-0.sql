-- Write your query below
SELECT name AS warehouse_name, 
       SUM(units * width * length * height) AS volume
FROM warehouse
NATURAL JOIN products
GROUP BY name;