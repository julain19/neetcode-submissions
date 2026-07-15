-- Write your query below
SELECT DISTINCT ON (student_id) *
FROM exam_results
ORDER BY student_id ASC, score DESC, exam_id ASC;