SELECT S.name, SUM(hitcount), COUNT(month), ROUND((SUM(hitcount)/COUNT(month)),0) AS avgpermonth
FROM mhl_hitcount
INNER JOIN mhl_suppliers S ON mhl_hitcount.supplier_ID = S.id
GROUP BY S.name
ORDER BY SUM(hitcount) DESC;