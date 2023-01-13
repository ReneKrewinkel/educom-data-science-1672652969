ALTER TABLE mhl_suppliers 
  ADD joindate DATE NULL DEFAULT NULL 
  AFTER p_city_ID;

UPDATE mhl_suppliers 
   SET joindate=CAST(CONCAT(2000+membertype,'-',(id%12)+1,'-',(id%28)+1) AS DATE);
   
   SET SQL_SAFE_UPDATES  = 0;
   
   
   
UPDATE mhl_suppliers
SET joindate = NULL;

SELECT id, id%12+1, id%28+1
FROM mhl_suppliers
ORDER BY id ASC;

SELECT MIN(membertype)
FROM mhl_suppliers;