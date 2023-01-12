CREATE VIEW  VERZENDLIJST
AS
	SELECT 
		S.id AS ID,
		IF(p_address = '', CONCAT(straat, ' ', huisnr), p_address) AS adres,
        IF(p_postcode = '', postcode, p_postcode) AS postcode,
        IF(p_address <> '', p_city.name, city.name) AS stad
    FROM mhl_suppliers S
    LEFT JOIN mhl_cities p_city ON S.p_city_ID = p_city.id
    LEFT JOIN mhl_cities city ON S.city_ID = city.id;
    