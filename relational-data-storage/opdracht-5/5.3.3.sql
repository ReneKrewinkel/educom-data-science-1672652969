SELECT 
	S.name,
    IF (D.contact IS NULL, 't.a.v. directie', D.contact) AS contact,
    V.adres,
    V.postcode,
    V.stad
FROM mhl_suppliers S
LEFT JOIN directie D ON S.id =D.id
LEFT JOIN verzendlijst V ON S.id = V.ID;