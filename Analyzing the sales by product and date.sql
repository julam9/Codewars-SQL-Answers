SELECT
  name AS product_name,
  extract(YEAR FROM date)::INT AS year,
  extract(MONTH FROM date)::INT AS month,
  extract(DAY FROM date)::INT AS day,
  SUM(price * count) AS total
FROM sales_details sd
JOIN sales s ON sd.sale_id = s.id
JOIN products p ON sd.product_id = p.id
GROUP BY name, ROLLUP(YEAR, MONTH, DAY)
ORDER BY product_name, YEAR, MONTH, DAY 