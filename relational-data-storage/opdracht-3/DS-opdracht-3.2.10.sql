SELECT name, straat, huisnr, postcode 
FROM mhl_suppliers
WHERE name LIKE "%&%" 
AND name NOT LIKE "% & %";