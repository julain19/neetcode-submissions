-- Write your query below
SELECT from_id AS person1,
       to_id AS person2,
       COUNT(*) AS call_count,
       SUM(duration) AS total_duration
FROM (SELECT * FROM calls WHERE from_id < to_id
      UNION ALL
      SELECT to_id AS from_id, from_id AS to_id, duration FROM calls WHERE from_id > to_id)
GROUP BY from_id, to_id;