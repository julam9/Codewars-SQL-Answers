SELECT player_name, games, ROUND(hits::NUMERIC/at_bats::NUMERIC, 3)::TEXT batting_average
FROM yankees
WHERE at_bats >= 100
ORDER BY 3 DESC