WITH RECURSIVE count_item AS (
  SELECT c.id,
  c.parent,
  (SELECT COUNT(i.id) 
  FROM items AS i 
  WHERE i.category_id = c.id) AS total
  FROM categories AS c
  ), 
  h AS (
  SELECT id, parent, total
  FROM count_item 
  WHERE id NOT IN (
    SELECT parent 
    FROM categories 
    WHERE parent IS NOT NULL)
  UNION ALL 
  SELECT c.id, c.parent, c.total + h.total AS total
  FROM h
  JOIN count_item AS c 
  ON h.parent = c.id)
SELECT id, SUM(total)::INT AS total
FROM h
GROUP BY id
ORDER BY id;