SELECT 
	R.name, 
    SUM(hitcount)
FROM mhl_suppliers S
INNER JOIN mhl_suppliers_mhl_rubriek_view RR ON S.id = RR.mhl_suppliers_ID
INNER JOIN mhl_rubrieken R ON RR.mhl_rubriek_view_ID = R.id
INNER JOIN mhl_hitcount H ON S.id = H.supplier_ID
GROUP BY R.name;