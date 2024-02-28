SELECT c.town, c.property_type, o.customer_id, o.order_id
FROM customer_preferences c 
LEFT JOIN order_info o 
ON c.customer_id = o.order_id