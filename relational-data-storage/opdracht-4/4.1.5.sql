SELECT name, straat, huisnr, postcode, lat, lng
FROM mhl_suppliers S
RIGHT JOIN pc_lat_long ON S.city_ID = pc_lat_long.pc6
ORDER BY lat DESC
LIMIT 5;



SELECT name, straat, huisnr, postcode, LL1.lat, LL1.lng, LL2.lat, LL2.lng
FROM mhl_suppliers S
INNER JOIN pc_lat_long LL1 ON S.city_ID = LL1.pc6
INNER JOIN pc_lat_long LL2 ON S.p_city_ID = LL2.pc6
ORDER BY LL1.lat DESC, LL2.lat DESC
LIMIT 5;
