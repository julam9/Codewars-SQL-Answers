WITH t1 AS
(SELECT f.film_id, title, COUNT(DISTINCT r.customer_id) AS rental_count, 
CASE WHEN COUNT(DISTINCT r.customer_id) <=5 THEN 'not popular'
WHEN COUNT(DISTINCT r.customer_id) <= 15 THEN 'slightly popular'
WHEN COUNT(DISTINCT r.customer_id) <= 30 THEN 'moderately popular'
ELSE 'very popular'
END AS popularity
FROM film f
JOIN film_category fc
ON f.film_id = fc.film_id
JOIN category c
ON fc.category_id = c.category_id
JOIN inventory i
ON f.film_id = i.film_id
JOIN rental r
ON i.inventory_id = r.inventory_id
WHERE c.name = 'Children'
GROUP BY f.film_id, title
ORDER BY rental_count DESC, title)
SELECT film_id, title ||' is '|| popularity AS popularity, rental_count
FROM t1