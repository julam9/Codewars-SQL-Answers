SELECT id, name
FROM departments d
WHERE EXISTS (
    SELECT d.id, d.name
    FROM sales s
    WHERE s.department_id = d.id
    AND price > 98.00)