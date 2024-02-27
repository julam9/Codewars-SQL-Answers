SELECT distance_to_pump, mpg, fuel_left,
CASE 
    WHEN distance_to_pump <= mpg*fuel_left THEN true
    ELSE false 
END AS res
FROM zerofuel