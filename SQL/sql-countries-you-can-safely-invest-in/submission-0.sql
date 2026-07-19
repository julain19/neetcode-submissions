-- Write your query below
WITH local_calls AS (
    SELECT ca.caller_id, ca.callee_id, duration, 
           SUBSTRING(p1.phone_number, 1, 3) AS country_code
    FROM calls ca
    JOIN person p1 ON ca.caller_id = p1.id
    JOIN person p2 ON ca.caller_id = p2.id
    WHERE SUBSTRING(p1.phone_number, 1, 3) = SUBSTRING(p2.phone_number, 1, 3)
)
SELECT name AS country
FROM country co
JOIN local_calls lc ON co.country_code = lc.country_code
GROUP BY co.country_code, co.name
HAVING AVG(duration) > (SELECT AVG(duration) FROM calls);