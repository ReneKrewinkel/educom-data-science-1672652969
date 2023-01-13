-- SELECT hitcount, name, city_name, 

SELECT hitcount, supplier_name, city_name, commune_name, district_name
FROM selectsupplierareainfo
INNER JOIN mhl_hitcount ON selectsupplierareainfo.id = mhl_hitcount.supplier_ID
WHERE 
	(selectsupplierareainfo.district_name = "Noord-Brabant" OR selectsupplierareainfo.district_name = "Limburg" OR selectsupplierareainfo.district_name = "Zeeland")
    AND mhl_hitcount.month=1 AND mhl_hitcount.year=2014;