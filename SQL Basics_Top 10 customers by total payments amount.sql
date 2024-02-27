SELECT c.customer_id, email, COUNT(payment_id) payments_count, SUM(amount)::FLOAT total_amount
FROM customer c 
JOIN payment p 
ON c.customer_id = p.customer_id 
GROUP BY 1,2
ORDER BY 4 DESC
LIMIT 10