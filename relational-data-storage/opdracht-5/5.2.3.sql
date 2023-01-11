SELECT
	year, 
    SUM(IF (month IN (1, 2, 3), hitcount, 0)) '1ste kwartaal',
    SUM(IF (month IN (4, 5, 6), hitcount, 0)) '2de kwartaal',
	SUM(IF (month IN (7, 8, 9), hitcount, 0)) '3de kwartaal',
    SUM(IF (month IN (10, 11, 12), hitcount, 0)) '4de kwartaal'
FROM mhl_hitcount
GROUP BY year;