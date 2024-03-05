SELECT RANK() OVER(ORDER BY town ASC, property_type ASC) AS rank_order, town, property_type, customer_id, order_id
FROM (
SELECT c.town, c.property_type, o.customer_id, o.order_id
FROM customer_preferences c 
LEFT JOIN order_info o 
ON c.customer_id = o.customer_id
) AS t1 
ORDER BY rank_order, customer_id, order_id