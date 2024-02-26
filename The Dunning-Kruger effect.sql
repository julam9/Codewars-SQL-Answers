SELECT *, 
CASE 
    WHEN skill_overestimation <= 2 THEN 'Mild case of overconfidence'
    WHEN skill_overestimation <= 5 THEN 'Moderate case of overconfidence'
    WHEN skill_overestimation <= 7 THEN 'Serious case of overconfidence'
    ELSE 'Extreme case of Dunning-Kruger effect detected!'
END AS overconfidence_category 
FROM (
    SELECT id, name, perceived_skill_level-actual_skill_level AS skill_overestimation
    FROM users
    WHERE  perceived_skill_level > actual_skill_level
) AS tb1
ORDER BY 3 DESC, 1 DESC