SELECT name, SUM(won) AS won, SUM(lost) AS lost
FROM fighters
WHERE move_id IN (
    SELECT id
    FROM winning_moves
    WHERE move NOT IN ('Hadoken', 'Shouoken', 'Kikoken'))
GROUP BY name
ORDER BY won DESC
LIMIT 6