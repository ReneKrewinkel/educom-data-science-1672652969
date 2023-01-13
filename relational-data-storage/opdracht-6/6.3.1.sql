SELECT 
	name,
    CASE
		WHEN LEFT(name,1)="'" THEN CONCAT(
			SUBSTRING(name,1,3),
            UPPER(SUBSTRING(name,4,1)),
			SUBSTRING(name,5,100)
		)
        WHEN SUBSTRING(name,1)<>"'" THEN CONCAT(UPPER(SUBSTRING(name,1,1)),SUBSTRING(name,2,100) )
	END AS nice_name
FROM mhl_cities
ORDER BY name;