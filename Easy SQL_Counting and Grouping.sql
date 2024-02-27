SELECT race, count(*) AS count
FROM demographics
GROUP BY race
ORDER BY count DESC