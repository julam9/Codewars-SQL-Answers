SELECT p.id, name, COUNT(sale) sale_count, RANK() OVER(ORDER BY COUNT(sale) DESC) sale_rank
FROM people p 
JOIN sales s
ON p.id = s.people_id
GROUP BY p.id, name