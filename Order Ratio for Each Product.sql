WITH t1 as(
SELECT product_id, COUNT(order_id) AS count
FROM orders
GROUP BY product_id
) 
SELECT product_id, count, round(count*100.0/(SELECT SUM(count) FROM t1), 2) AS ratio
FROM t1
ORDER BY product_id