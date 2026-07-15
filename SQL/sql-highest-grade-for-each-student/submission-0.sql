-- Write your query below
SELECT student_id, MIN(exam_id) AS exam_id, score
FROM exam_results
NATURAL JOIN (SELECT student_id, MAX(score) AS max_score
              FROM exam_results
              GROUP BY student_id)
WHERE score = max_score
GROUP BY student_id, score
ORDER BY student_id;