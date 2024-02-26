SELECT DISTINCT supplier_id, total_products
FROM (
    SELECT supplier_id, COUNT(id) OVER(PARTITION BY supplier_id) AS total_products
    FROM products
) tb1
ORDER BY supplier_id DESC