WITH cte1 AS(
SELECT DISTINCT a.actor_id, CONCAT(first_name, ' ', last_name) full_name, f.film_id, f.title film_title
FROM film f
JOIN film_actor fa
ON f.film_id = fa.film_id
JOIN actor a 
ON fa.actor_id = a.actor_id
WHERE first_name LIKE 'J%'
),

cte2 AS(
SELECT actor_id, full_name, film_id, film_title, RANK() OVER(PARTITION BY actor_id ORDER BY film_id DESC, film_title DESC) film_id_rank
FROM cte1
)

SELECT actor_id, full_name, film_title
FROM cte2
WHERE film_id_rank = 1