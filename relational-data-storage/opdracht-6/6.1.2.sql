SELECT COM.name, S.name, SUM(H.hitcount) AS total_hitcount, AVG(hitcount) AS average_hitcount
FROM mhl_suppliers S
INNER JOIN mhl_cities C ON S.city_ID = C.id
INNER JOIN mhl_communes COM ON C.commune_ID = COM.id
LEFT JOIN mhl_hitcount H ON S.id = H.supplier_ID
GROUP BY COM.name,  S.name
HAVING average_hitcount > (
	SELECT AVG(hitcount)
	FROM mhl_hitcount)
ORDER BY average_hitcount DESC;