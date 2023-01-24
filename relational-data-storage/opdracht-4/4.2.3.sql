WITH RECURSIVE cte (id, name) AS (
SELECT 
	R1.id, 
    IF(R1.parent = 0, R1.name,""), 
    R2.name FROM mhl_rubrieken R1
INNER JOIN mhl_rubrieken R2 ON R1.id = R2.id;


WITH RECURSIVE cte (id, name, parent) as (
	SELECT
		mhl_rubrieken.id,
		mhl_rubrieken.name,
        mhl_rubrieken.parent
FROM mhl_rubrieken
UNION ALL
SELECT 
	R2.id,
	R2.name,
    R2.parent
FROM mhl_rubrieken R2
INNER JOIN cte ON R2.parent = cte.id)
SELECT * FROM cte;



SELECT sub.name, hoofd.name 
FROM mhl_rubrieken AS sub 
LEFT JOIN mhl_rubrieken AS hoofd ON hoofd.id=sub.parent;


SELECT * FROM mhl_rubrieken;

-- https://stackoverflow.com/questions/20215744/how-to-create-a-mysql-hierarchical-recursive-query