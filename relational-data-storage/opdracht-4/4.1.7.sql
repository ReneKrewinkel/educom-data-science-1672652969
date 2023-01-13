SELECT  
	C1.city_name AS 'C1.city_name', 
    C2.city_name AS 'C2.city_name', 
    C1.id AS 'C1.id', 
    C2.id AS 'C2.id', 
    C1.commune_ID AS 'C1.commune_ID', 
    C2.commune_ID AS 'C2.commune_ID'
FROM selectsupplierareainfo C1, selectsupplierareainfo C2
WHERE C1.city_name = C2.city_name 
AND C1.city_name <> "---"
ORDER BY C1.city_name ASC;
-- zowel langzaam als heeft duplicates


-- Antwoord:
SELECT 
	C1.name, 
    C2.name, 
    C1.id, C2.id, 
    C1.commune_id, 
    C2.commune_id
FROM mhl_cities C1
JOIN mhl_cities AS C2 ON C1.name = C2.name
WHERE C1.id < C2.id
ORDER BY C1.name;
-- Zonder de join zou dit ook langzamer zijn en duplicates hebben

-- Oude Verbeterd? Not really
SELECT 
	C1.city_name AS 'C1.city_name', 
    C2.city_name AS 'C2.city_name', 
    C1.id AS 'C1.id', 
    C2.id AS 'C2.id', 
    C1.commune_ID AS 'C1.commune_ID', 
    C2.commune_ID AS 'C2.commune_ID'
FROM selectsupplierareainfo C1
JOIN selectsupplierareainfo C2 ON C1.city_name = C2.city_name
WHERE C1.id <> C2.id

