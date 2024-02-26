SELECT id, name, COUNT(subordinate_id) AS older_subordinate_count
FROM(
    SELECT e1.id AS subordinate_id, date_part('year', age(e1.birthdate)) AS subordinate_age,
    e1.manager_id AS id, e2.name AS name 
    FROM employees e1
    JOIN employees e2
    ON e1.manager_id = e2.id
    WHERE date_part('year', age(e1.birthdate)) >= 60
) t1
GROUP BY id, name
HAVING COUNT(subordinate_id) >= 2
ORDER BY older_subordinate_count DESC, id DESC