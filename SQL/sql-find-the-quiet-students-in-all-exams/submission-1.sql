-- Write your query below
WITH exam_stats AS (
     SELECT student_id,
          RANK() OVER(PARTITION BY exam_id ORDER BY score ASC) AS asc_rnk,
          RANK() OVER(PARTITION BY exam_id ORDER BY score DESC) AS desc_rnk
     FROM exam
),
loud_students AS (
     SELECT student_id
     FROM exam_stats
     WHERE asc_rnk = 1 OR desc_rnk = 1
)
SELECT s.student_id, s.student_name
FROM student s
WHERE s.student_id IN (SELECT student_id FROM exam) AND
      s.student_id NOT IN (SELECT student_id FROM loud_students);