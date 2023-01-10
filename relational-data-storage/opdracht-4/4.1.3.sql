SELECT supplier_name, straat, huisnr, postcode, mhl_rubrieken.name AS rubriek_name
FROM SelectSupplierAreaInfo BigBoyArea
INNER JOIN mhl_suppliers_mhl_rubriek_view rubriekTussenTabel 
	ON BigBoyArea.id = rubriekTussenTabel.mhl_suppliers_id
INNER JOIN mhl_rubrieken 
	ON rubriekTussenTabel.mhl_rubriek_view_ID = mhl_rubrieken.id
WHERE mhl_rubrieken.name = "Drank" OR mhl_rubrieken.parent=235
ORDER BY 5, 1;