WITH full_table AS(
SELECT 
  title
  ,fa.actor_id
  ,a.first_name
  ,a.last_name
FROM film f
JOIN film_actor fa
ON f.film_id = fa.film_id
JOIN actor a
ON fa.actor_id = a.actor_id
),

table2 AS(
SELECT 
    ft1.title AS title, 
    ft1.actor_id AS first_actor_id, 
    ft2.actor_id AS second_actor_id
FROM full_table ft1 
JOIN full_table ft2 
ON ft1.title = ft2.title
WHERE ft1.actor_id <> ft2.actor_id
AND (ft1.actor_id = 105 AND ft2.actor_id = 122)
OR (ft2.actor_id = 105 AND ft1.actor_id = 122)
)

SELECT DISTINCT title
FROM table2
ORDER BY 1