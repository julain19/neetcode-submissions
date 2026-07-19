-- Write your query below
WITH local_calls AS (
    SELECT caller_id, duration FROM calls
    UNION ALL
    SELECT callee_id, duration FROM calls
)
SELECT co.name AS country
FROM country co
JOIN person p ON SUBSTRING(p.phone_number, 1, 3) = co.country_code
JOIN local_calls lc ON p.id = lc.caller_id
GROUP BY co.country_code, co.name
HAVING AVG(lc.duration) > (SELECT AVG(duration) FROM calls);