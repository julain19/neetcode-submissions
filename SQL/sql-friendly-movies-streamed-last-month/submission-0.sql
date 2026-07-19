-- Write your query below
SELECT DISTINCT c.title
FROM content c
JOIN tv_program p ON c.content_id = p.content_id
WHERE c.kids_content = 'Y' AND
      c.content_type = 'Movies' AND
      p.program_date >= '2020-06-01' AND
      p.program_date < '2020-07-01';