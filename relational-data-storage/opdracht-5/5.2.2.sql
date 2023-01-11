SELECT 
	C.name AS city_name, 
    COUNT(IF(MT.name = 'Gold', 1, NULL)) Gold,
    COUNT(IF(MT.name = 'Silver', 1, NULL)) Silver,
    COUNT(IF(MT.name = 'Bronze', 1, NULL)) Bronze,
    COUNT(IF(MT.name NOT IN ('Gold', 'Silver', 'Bronze'), 1, NULL)) Other
FROM mhl_suppliers  S
INNER JOIN mhl_cities C ON C.id = S.city_ID
INNER JOIN mhl_membertypes MT ON MT.id = S.membertype
GROUP BY C.name
ORDER BY 2 DESC;