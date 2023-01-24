SELECT CI.name AS city_name, IFNULL(CO.name, "INVALID") AS community_name
FROM mhl_cities CI
LEFT JOIN mhl_communes CO ON CI.commune_ID = CO.id;