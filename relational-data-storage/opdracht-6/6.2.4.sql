SELECT 
	YEAR(joindate) AS jaar,
    MONTHNAME(joindate) AS maand,
    COUNT(id) AS aantal
FROM mhl_suppliers
GROUP BY 1, 2
ORDER BY joindate;