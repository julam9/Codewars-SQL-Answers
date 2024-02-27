SELECT ss1.state AS state_a, ss2.state AS state_b, ABS(ss1.total_streams-ss2.total_streams) AS difference
FROM state_streams ss1
JOIN state_streams ss2
ON ss1.state < ss2.state
WHERE ABS(ss1.total_streams-ss2.total_streams) < 1000
ORDER BY state_a, state_b
