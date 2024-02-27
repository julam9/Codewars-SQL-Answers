WITH actor_film AS(
SELECT a.actor_id, fa.film_id, CONCAT(first_name, ' ',last_name) full_name, f.title
FROM actor a
JOIN film_actor fa
ON a.actor_id = fa.actor_id
JOIN film f
ON fa.film_id = f.film_id), 

two_actors AS(
SELECT af1.actor_id first_actor_id, af2.actor_id second_actor_id, af1.full_name first_actor, af2.full_name second_actor, af1.title
FROM actor_film af1
JOIN actor_film af2
ON af1.film_id = af2.film_id
WHERE af1.actor_id < af2.actor_id
), 

rank_table AS(
SELECT first_actor, second_actor, RANK() OVER(ORDER BY COUNT(title) DESC) appearances_rank
FROM two_actors 
GROUP BY first_actor, second_actor
)

SELECT first_actor, second_actor, title
FROM two_actors
WHERE first_actor IN (
    SELECT first_actor
    FROM rank_table
    WHERE appearances_rank = 1)
    AND second_actor in (
        SELECT second_actor
        FROM rank_table
        WHERE appearances_rank = 1)
ORDER BY title