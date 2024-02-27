SELECT customer_id
FROM(
SELECT customer_id, COUNT(delivery_date) as c1
FROM orders
GROUP BY customer_id
) t1
WHERE c1 = 0
ORDER BY customer_id DESC