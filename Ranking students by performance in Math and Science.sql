with t1 as(
select c1.student_id, c1.course_name as math, c2.course_name as science, 
c1.score as math_score, c2.score as science_score
from courses c1
join courses c2
on c1.student_id = c2.student_id
and c1.course_name = 'Math'
and c2.course_name = 'Science')

select rank() over(order by math_score + science_score desc, s.id) as rank, s.id as student_id, 
name, math_score + science_score as total_score
from students s
join t1 
on s.id = t1.student_id
order by rank 