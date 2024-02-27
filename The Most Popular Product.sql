SELECT product_id, product_name, count_orders 
FROM (
    SELECT p.id AS product_id, product_name, COUNT(*) AS count_orders, 
    RANK() OVER(ORDER BY COUNT(*) DESC) AS rank_order
    FROM products p 
    JOIN orders o 
    ON p.id = o.product_id
    JOIN users u
    ON u.id = o.user_id
    GROUP BY p.id, product_name
) AS tb1
WHERE rank_order = 1
ORDER BY product_id DESC