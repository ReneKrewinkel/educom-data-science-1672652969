SELECT S.name, straat, huisnr, postcode, mhl_propertytypes.name
FROM mhl_suppliers S
INNER JOIN mhl_properties Prop ON S.id = Prop.supplier_ID
LEFT JOIN mhl_propertytypes ON Prop.propertytype_ID = mhl_propertytypes.id
WHERE (mhl_propertytypes.name="ook voor particulieren") OR mhl_propertytypes.name="specialistische leverancier";