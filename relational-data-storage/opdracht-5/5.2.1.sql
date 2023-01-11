SELECT 
supplier_name, 
IFNULL(mhl_contacts.name, "t.a.v. de directie"),
IF (p_address = '', postcode, p_address),
postcode,
city_name
FROM selectsupplierareainfo M
LEFT JOIN mhl_contacts ON M.id = mhl_contacts.supplier_ID
ORDER BY district_name, city_name, supplier_name;