SELECT bool,
CASE 
    WHEN bool IS true THEN 'Yes'
    ELSE 'No'
END AS res
FROM booltoword