WITH t1 AS(
SELECT cu.customer_id, f.film_id, f.title, fc.category_id, ca.name AS genre, rental_id, rental_date
FROM customer cu
JOIN rental r
ON cu.customer_id = r.customer_id
JOIN inventory i
ON r.inventory_id = i.inventory_id
JOIN film f
ON i.film_id = f.film_id
ON film_category fc
ON f.film_id = fc.film_id
JOIN category ca
ON fc.category_id = ca.category_id),

threemonthsrent1 AS(
SELECT customer_id, EXTRACT(MONTH FROM rental_date) AS rental_month, COUNT(rental_id) AS rental_count
FROM t1
WHERE extract(MONTH FROM rental_date) in (5,6,7)
GROUP BY customer_id, extract(MONTH FROM rental_date) 
),

threemonthsrent2 AS(
SELECT customer_id, COUNT(rental_month)
FROM threemonthsrent1
GROUP BY customer_id
HAVING COUNT(rental_month) = 3)

SELECT genre, COUNT(rental_id) AS total_rentals
FROM t1
WHERE customer_id IN (
SELECT customer_id
FROM threemonthsrent2)
GROUP BY genre
ORDER BY total_rentals DESC, genre
LIMIT 5;