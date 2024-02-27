WITH t1 AS (
SELECT student_id, name, course_name, score
FROM students s 
JOIN courses c
ON s.id = c.student_id
),
t2 AS(
SELECT t11.student_id, t11.name, t11.course_name AS math_course, 
  t12.course_name  AS science_course, t11.score AS math_score, t12.score AS science_score
FROM t1 t11
JOIN t1 t12
ON t11.student_id = t12.student_id
AND t11.course_name = 'Math'
AND t12.course_name = 'Science'
)
SELECT student_id, name, abs(math_score-science_score) AS score_difference
FROM t2
WHERE science_score > math_score
ORDER BY score_difference DESC, student_id