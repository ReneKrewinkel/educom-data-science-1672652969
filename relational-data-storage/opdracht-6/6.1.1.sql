SELECT 
	year,
    CASE
		WHEN month = 1 THEN "Januari"
		WHEN month = 2 THEN "Februari"
        WHEN month = 3 THEN "Maart"
		WHEN month = 4 THEN "April"
		WHEN month = 5 THEN "Mei"
        WHEN month = 6 THEN "juni"
        WHEN month = 7 THEN "juli"
        WHEN month = 8 THEN "Augustus"
        WHEN month = 9 THEN "September"
        WHEN month = 10 THEN "Oktober"
        WHEN month = 11 THEN "November"
        WHEN month = 12 THEN "December"
	END AS maand,
    COUNT(hitcount),
    MIN(hitcount),
    MAX(hitcount),
    AVG(hitcount),
    SUM(hitcount)
FROM mhl_hitcount
GROUP BY year, month
ORDER BY year DESC, month DESC;