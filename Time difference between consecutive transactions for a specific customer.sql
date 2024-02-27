SELECT 
    r.rental_id,
    c.customer_id, 
    TO_CHAR(r.rental_date, 'YYYY-MM-DD hh24:mi:ss') AS rental_date,
    rental_date - LAG(rental_date, 1) OVER (PARTITION BY customer_id ORDER BY customer_id, rental_date) AS time_since_previous_rental
FROM rental r
JOIN customer c
USING (customer_id)
WHERE customer_id = 1 OR customer_id = 2
GROUP BY 1,2,3
ORDER BY 2,3 