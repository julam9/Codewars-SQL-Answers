WITH tb1 AS(
SELECT u.id AS user_id, u.name AS name, p.id AS product_id, o.id AS order_id
FROM users u 
JOIN orders o 
ON u.id = o.user_id
JOIN products p
ON p.id = o.product_id
),

tb2 AS
(SELECT user_id, name, COUNT(product_id) AS product_count
FROM tb1
GROUP BY user_id, name
),

tb3 AS
(SELECT user_id, name, product_id, COUNT(order_id) AS order_count
FROM tb1
GROUP BY user_id, name, product_id)

SELECT DISTINCT user_id, name
FROM tb1
WHERE user_id IN (
    SELECT user_id 
    FROM tb2 
    WHERE product_count = (
        SELECT COUNT(DISTINCT id) 
        FROM products))
        AND user_id IN (
            SELECT user_id
            FROM tb3
            WHERE order_count <> 0)
            ORDER BY user_id DESC