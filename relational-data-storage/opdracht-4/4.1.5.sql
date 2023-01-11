-- Deze is veel sneller met INNER/LEFT joins
SELECT name, straat, huisnr, postcode, LL1.lat, LL1.lng
FROM mhl_suppliers S
INNER JOIN pc_lat_long LL1 ON S.postcode = LL1.pc6
ORDER BY LL1.lat DESC
LIMIT 5;


-- Oude langzame query:
SELECT name, straat, huisnr, postcode, lat, lng
FROM mhl_suppliers S
RIGHT JOIN pc_lat_long ON S.postcode = pc_lat_long.pc6
ORDER BY lat DESC
LIMIT 5;
