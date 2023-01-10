CREATE VIEW SelectSupplierAreaInfo 
AS
SELECT S.id, membertype, company, S.name AS supplier_name, straat, huisnr, postcode, city_ID, p_address, p_postcode, p_city_ID, C.id AS city_table_id, commune_ID, C.name AS city_name, COM.name AS commune_name
FROM mhl_suppliers S
LEFT JOIN mhl_cities C ON S.city_ID = C.id
LEFT JOIN mhl_communes COM ON C.Commune_ID = COM.id;
    
SELECT * FROM SelectSupplierAreaInfo;
DROP VIEW SelectSupplierAreaInfo;


SELECT supplier_name, straat, huisnr, postcode FROM SelectSupplierAreaInfo WHERE city_name =  "Amsterdam";