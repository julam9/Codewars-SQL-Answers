SELECT s, right(left(s, LENGTH(s)-1), -1) AS res
FROM removechar