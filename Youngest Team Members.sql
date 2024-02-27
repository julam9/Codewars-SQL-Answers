SELECT employee_id, full_name, team, birth_date
FROM(
  SELECT employee_id, full_name, team, birth_date, 
  RANK() OVER(PARTITION BY team ORDER BY birth_date DESC) AS age_rank_decider
  FROM employees
  ) t1
WHERE age_rank_decider = 1
