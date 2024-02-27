SELECT MIN(score) min, PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY score) median, MAX(score) max
FROM result