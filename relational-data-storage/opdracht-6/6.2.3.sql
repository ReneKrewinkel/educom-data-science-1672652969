SELECT 
	DATE_FORMAT(joindate, "%W"),
    COUNT(name)
FROM mhl_suppliers
GROUP BY 1
ORDER BY FIELD(DATE_FORMAT(joindate, "%W"), "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday")