SELECT id, 
CASE 
    WHEN base%factor=0 THEN true 
    ELSE false 
END AS res
FROM kata