
CREATE VIEW DIRECTIE
AS
SELECT 
	C.supplier_id 'id', 
    C.name AS contact, 
    C.contacttype 'functie',
    CASE 
		WHEN C.contacttype LIKE "%directeur%" THEN 'directie'
		WHEN D.name = "nvt" THEN D.name
        ELSE 'directie'
	END AS department
FROM mhl_contacts C
LEFT JOIN mhl_departments D ON C.department = D.id