SELECT INITCAP(firstname ||' '|| lastname) AS shortlist
FROM Elves
WHERE firstname LIKE '%tegil%' 
OR lastname LIKE '%astar%'