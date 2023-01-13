SELECT R.name, COUNT(mhl_suppliers_ID)
FROM mhl_suppliers_mhl_rubriek_view RR
INNER JOIN mhl_rubrieken R ON RR.mhl_rubriek_view_ID = R.id
GROUP BY R.name;