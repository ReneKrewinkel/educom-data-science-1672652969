SELECT 
    DATE_FORMAT(joindate, "%d.%m.%Y") AS joindate,
    id
FROM mhl_suppliers
WHERE DAYOFMONTH(LAST_DAY(joindate)) - DAYOFMONTH(joindate) <= 7;