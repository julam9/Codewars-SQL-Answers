WITH tb1 AS(
SELECT created_at::DATE only_date, title
FROM posts),

tb2 AS(
SELECT date_trunc('month', only_date)::DATE first_day_of_month, title 
FROM tb1
)

SELECT first_day_of_month date, COUNT(title), ROUND((100.0 * (COUNT(title) - LAG(COUNT(title), 1) OVER (ORDER BY first_day_of_month)) / LAG(COUNT(title), 1) OVER
           (ORDER BY first_day_of_month)),1) || '%' AS percent_growth
FROM tb2
GROUP BY first_day_of_month