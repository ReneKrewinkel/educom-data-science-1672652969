SELECT name, straat, huisnr, postcode
FROM mhl_suppliers
WHERE city_ID IN (
	SELECT id 
    FROM mhl_cities 
    WHERE name = "Amsterdam")
OR p_city_ID IN (
	SELECT id 
    FROM mhl_cities 
    WHERE name = "Den Haag");