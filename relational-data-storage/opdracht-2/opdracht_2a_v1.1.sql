USE mhl;
SET SQL_SAFE_UPDATES = 0;

SELECT * FROM mhl_contacts;

-- DROP FK:

ALTER TABLE mhl_communes
DROP FOREIGN KEY FK_District_ID;
-- Success

ALTER TABLE mhl_contacts
DROP FOREIGN KEY FK_mhl_contacts_department;
-- Success

ALTER TABLE mhl_detaildefs
DROP FOREIGN KEY FK_mhl_detailsdefs_group_ID;
-- Success

ALTER TABLE mhl_detaildefs
DROP FOREIGN KEY FK_mhl_detailsdefs_propertytype_ID;

ALTER TABLE mhl_districts
DROP FOREIGN KEY FK_mhl_districts_country_ID;

-- Etc


-- CREATE FK ----------------------------------------------------------------

-- 1. mhl_cities EN mhl_communes ==============================================

ALTER TABLE mhl_cities
ADD CONSTRAINT FK_mhl_cities_Commune_ID
FOREIGN KEY (commune_ID) REFERENCES mhl_communes(id);
-- Fails
	
    -- Checken waar t mis gaat:
    SELECT * FROM mhl_cities
	LEFT JOIN mhl_communes ON mhl_cities.commune_ID = mhl_communes.id
	WHERE mhl_communes.id IS NULL;

	ALTER TABLE mhl_cities MODIFY commune_ID INT(11) NULL;
    
	UPDATE mhl_cities
	SET commune_ID=NULL
	WHERE commune_ID=0;
	--  Still nope
    
    -- ER is ook nog een niet bekende commune_ID 755:
    DELETE FROM mhl_cities WHERE commune_ID = 755;
    -- En dan werkt tie wel!

-- 2. mhl_communes EN mhl_districts ==========================================

ALTER TABLE mhl_communes
ADD CONSTRAINT FK_District_ID
FOREIGN KEY (district_ID) REFERENCES mhl_districts(id);
-- Success

-- 3. mhl_contracts & mhl_departments ===========================================

ALTER TABLE mhl_contacts
ADD CONSTRAINT FK_mhl_contacts_department
FOREIGN KEY (department) REFERENCES mhl_departments(id);
-- Success

-- 4. mhl_contacts & mhl_suppliers ================================================

ALTER TABLE mhl_contacts
ADD CONSTRAINT FK_mhl_contacts_supplier_ID
FOREIGN KEY (supplier_ID) REFERENCES mhl_suppliers(id);
-- Fails

    ALTER TABLE mhl_contacts MODIFY supplier_ID INT(11) NULL;

	UPDATE mhl_contacts
	SET supplier_ID = NULL
	WHERE supplier_ID IN(
		SELECT supplier_ID FROM mhl_contacts
		LEFT JOIN mhl_suppliers ON mhl_contacts.supplier_ID = mhl_suppliers.id
		WHERE mhl_suppliers.id IS NULL);
	-- Nu Werkt tie
   
-- 5. mhl_detaildefs & detailgroups =================================================

ALTER TABLE mhl_detaildefs
ADD CONSTRAINT FK_mhl_detailsdefs_group_ID
FOREIGN KEY (group_ID) REFERENCES mhl_detailgroups(id);
-- success

-- 6. mhl_detaildefs & mhl+propertytype_ID ===============================================

ALTER TABLE mhl_detaildefs
ADD CONSTRAINT FK_mhl_detailsdefs_propertytype_ID
FOREIGN KEY (propertytype_ID) REFERENCES mhl_propertytypes(id);
-- fails omdat in mhl_detaildefs ID 0 voorkomt. Dit komt niet voor in mhl_propertytypes. Als je alle 0's vervangt door NULL wordt dit opgelost.

	ALTER TABLE mhl_detaildefs MODIFY propertytype_ID INT(11) NULL;
    
	UPDATE mhl_detaildefs
	SET propertytype_ID=NULL
	WHERE propertytype_ID=0;
	-- En nu werkt de add foreign key statment hierboven wel
    
-- 7. mhl_districts & mhl_countries ===========================================================
    
ALTER TABLE mhl_districts
ADD CONSTRAINT FK_mhl_districts_country_ID
FOREIGN KEY (country_ID) REFERENCES mhl_countries(id);
-- Success

-- 8. mhl_properties & mhl_suppliers ===========================================================

-- Stap 1: uitproberen of de FK zo gemaakt kan worden
ALTER TABLE mhl_properties
ADD CONSTRAINT FK_mhl_properties_supplier_ID
FOREIGN KEY (supplier_ID) REFERENCES mhl_suppliers(id);
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`mhl`.`#sql-8f8_5d`, CONSTRAINT `FK_mhl_properties_supplier_ID` FOREIGN KEY (`supplier_ID`) REFERENCES `mhl_suppliers` (`id`))

-- Stap 2: de Join bekijken
SELECT * FROM mhl_properties
LEFT JOIN mhl_suppliers ON mhl_properties.supplier_ID = mhl_suppliers.id
WHERE mhl_suppliers.name IS NULL;

ALTER TABLE mhl_properties MODIFY supplier_ID INT(11) NULL;

-- Stap 3: de supplier_IDs toevoegen in de supplier tabel
INSERT INTO mhl_suppliers (id)
SELECT DISTINCT supplier_ID FROM mhl_properties WHERE id IN(
	SELECT mhl_properties.id FROM mhl_properties
	LEFT JOIN mhl_suppliers ON mhl_properties.supplier_ID = mhl_suppliers.id
	WHERE mhl_suppliers.membertype IS NULL);
    
-- Stap 4: Update die 200 record en voeg onbekend toe en bij de INTs NULL:
ALTER TABLE mhl_suppliers MODIFY membertype INT(11) NULL;

UPDATE mhl_suppliers
SET 
	membertype = NULL, 
    company = NULL,
    name = "onbekend",
    straat = "onbekend",
    huisnr = "onbekend",
    p_address = "onbekend"
WHERE city_ID IS NULL;

SELECT * FROM mhl_properties
LEFT JOIN mhl_suppliers ON mhl_properties.supplier_ID = mhl_suppliers.id
WHERE mhl_suppliers.name = "onbekend";
-- ALs je de varchar van 7 naar 8 characters zet bij postcode en p_postcode kan je hier ook onbekend in zetten
-- Bij de INT heb je eigenlijk een goeie standaard variable nodig die je kan gebruiken zodat duidelijk is dat dit ook onbekend is. Dit betekend wel dat je die dan ook in andere tabellen moet toevoegen als daarop een FK ligt.
-- Success, de FK werkt nu wel.

-- 9. mhl_properties & mhl_propertytypes ========================================================

ALTER TABLE mhl_properties
ADD CONSTRAINT FK_mhl_properties_propertytype_ID
FOREIGN KEY (propertytype_ID) REFERENCES mhl_propertytypes(id);

SELECT * FROM mhl_properties P
LEFT JOIN mhl_propertytypes PT ON P.propertytype_ID = PT.id
WHERE PT.id IS NULL;
-- Hier staan allemaal propertytype_ID = 0 in de mhl_properties tabel. Je kan dit dan veranderen door NULLs.

    ALTER TABLE mhl_properties MODIFY propertytype_ID INT(11) NULL;
	UPDATE mhl_properties
	SET propertytype_ID=NULL
	WHERE propertytype_ID=0;
-- Retry FK statement hierna en Success

-- 10. mhl_suppliers & mhl_membertypes =============================================================

ALTER TABLE mhl_suppliers 
ADD CONSTRAINT FK_mhl_suppliers_membertype
FOREIGN KEY (membertype) REFERENCES mhl_membertypes(id);
-- Dit failed omdat sommige values van mhl_suppliers(membertype) 0 zijn.

SELECT * FROM mhl_suppliers
LEFT JOIN mhl_membertypes ON mhl_suppliers.membertype = mhl_membertypes.id
WHERE mhl_membertypes.id IS NULL;
-- Dit is hier ook goed te zien

	ALTER TABLE mhl_suppliers MODIFY membertype INT(11) NULL;
    
	UPDATE mhl_suppliers
	SET membertype=NULL
	WHERE membertype=0;
    -- En dan werkt het

-- 11. mhl_suppliers & mhl_companies =======================================================
ALTER TABLE mhl_suppliers 
ADD CONSTRAINT FK_mhl_suppliers_company
FOREIGN KEY (company) REFERENCES mhl_companies(id);

SELECT * FROM mhl_suppliers S
LEFT JOIN mhl_companies C ON S.company = C.id
WHERE C.id IS NULL;
-- Ook hier weer is is het company int in mhl_suppliers 0 ipv NULL
    
	UPDATE mhl_suppliers
	SET company=NULL
	WHERE company=0;
-- Success

-- 12. mhl_suppliers & mhl_cities =============================================================

ALTER TABLE mhl_suppliers 
ADD CONSTRAINT FK_mhl_suppliers_city_ID
FOREIGN KEY (city_ID) REFERENCES mhl_cities(id);

SELECT * FROM mhl_suppliers S
LEFT JOIN mhl_cities C ON S.city_ID = C.id
WHERE C.id IS NULL;
-- Hier komen zowel 0 als andere variabels in de city_ID tabel voor

-- Stap 1: eerst de 0 values veranderen door NULL:
	UPDATE mhl_suppliers
	SET city_ID=NULL
	WHERE city_ID=0;

-- Nu inzoomen op de andere values:
SELECT * FROM mhl_suppliers S
LEFT JOIN mhl_cities C ON S.city_ID = C.id
WHERE C.id IS NULL AND S.city_ID IS NOT NULL;

-- Stap 2: De andere values in de mhl_cities tabel toevoegen
INSERT INTO mhl_cities (id)
SELECT DISTINCT city_ID FROM mhl_suppliers
WHERE mhl_suppliers.id IN (
	SELECT mhl_suppliers.id FROM mhl_suppliers
	LEFT JOIN mhl_cities ON mhl_suppliers.city_ID = mhl_cities.id
	WHERE mhl_cities.id IS NULL AND mhl_suppliers.city_ID IS NOT NULL
);

-- 13. mhl_suppliers & postcode =================================================================

ALTER TABLE mhl_suppliers 
ADD CONSTRAINT FK_mhl_suppliers_postcode
FOREIGN KEY (postcode) REFERENCES pc_lat_long(pc6);
-- LET OP dit moet hier pc6 zijn en dus niet zoals normaal het id!
-- standaard error code dus weer checken:

SELECT * FROM mhl_suppliers
LEFT JOIN pc_lat_long ON mhl_suppliers.postcode = pc_lat_long.pc6
WHERE pc_lat_long.id IS NULL;
-- Veel postcodes zijn niet ingevuld en andere zijn niet bekend.

	-- Stap 2:
	UPDATE mhl_suppliers
	SET postcode=NULL
	WHERE postcode="";
    
SELECT * FROM mhl_suppliers
LEFT JOIN pc_lat_long ON mhl_suppliers.postcode = pc_lat_long.pc6
WHERE pc_lat_long.id IS NULL AND mhl_suppliers.postcode IS NOT NULL;
-- Nu in principe 511 postcodes toevoegen in de pc6 kolom van pc_lat_long

-- Stap 3:
INSERT INTO pc_lat_long (pc6)
SELECT DISTINCT postcode FROM mhl_suppliers
WHERE mhl_suppliers.id IN (
	SELECT mhl_suppliers.id FROM mhl_suppliers
	LEFT JOIN pc_lat_long ON mhl_suppliers.postcode = pc_lat_long.pc6
	WHERE pc_lat_long.id IS NULL AND mhl_suppliers.postcode IS NOT NULL
);
-- 495 row(s) affected, 40 warning(s): 1265 Data truncated for column 'pc6' at row 1 1265 Data truncated for column 'pc6' at row 2 1265 Data truncated for column 'pc6' at row 36 1265 Data truncated for column 'pc6' at row 37 1265 Data truncated for column 'pc6' at row 38 1265 Data truncated for column 'pc6' at row 39 1265 Data truncated for column 'pc6' at row 40 1265 Data truncated for column 'pc6' at row 46 1265 Data truncated for column 'pc6' at row 47 1265 Data truncated for column 'pc6' at row 52 1265 Data truncated for column 'pc6' at row 55 1265 Data truncated for column 'pc6' at row 56 1265 Data truncated for column 'pc6' at row 60 1265 Data truncated for column 'pc6' at row 67 1265 Data truncated for column 'pc6' at row 73 1265 Data truncated for column 'pc6' at row 74 1265 Data truncated for column 'pc6' at row 76 1265 Data truncated for column 'pc6' at row 77 1265 Data truncated for column 'pc6' at row 78 1265 Data truncated for column 'pc6' at row 82 1265 Data truncated for column 'pc6' at row 83 1265 Data truncated for column 'pc6' at row 87 1265 Data truncated for column 'pc6' at row 90 1265 Data truncated for column 'pc6' at row 91 1265 Data truncated for column 'pc6' at row 94 1265 Data truncated for column 'pc6' at row 96 1265 Data truncated for column 'pc6' at row 97 1265 Data truncated for column 'pc6' at row 98 1265 Data truncated for column 'pc6' at row 102 1265 Data truncated for column 'pc6' at row 117 1265 Data truncated for column 'pc6' at row 118 1265 Data truncated for column 'pc6' at row 155 1265 Data truncated for column 'pc6' at row 226 1265 Data truncated for column 'pc6' at row 276 1265 Data truncated for column 'pc6' at row 350 1265 Data truncated for column 'pc6' at row 351 1265 Data truncated for column 'pc6' at row 352 1265 Data truncated for column 'pc6' at row 428 1265 Data truncated for column 'pc6' at row 452 1265 Data truncated for column 'pc6' at row 495 Records: 495  Duplicates: 0  Warnings: 40
-- 41 rows truncated en missen dus nu de laatste letter
DELETE FROM pc_lat_long
WHERE pc6 LIKE "% %";
-- de getruncate rijen weer weggehaald

SELECT REPLACE(UPPER(mhl_suppliers.postcode), " ", "") FROM mhl_suppliers
LEFT JOIN pc_lat_long ON mhl_suppliers.postcode = pc_lat_long.pc6
WHERE pc_lat_long.id IS NULL AND mhl_suppliers.postcode IS NOT NULL;
-- zo willen we t dr in zetten

INSERT INTO pc_lat_long (pc6)
SELECT DISTINCT REPLACE(UPPER(postcode), " ", "") FROM mhl_suppliers
WHERE mhl_suppliers.postcode <> "5626 an" AND mhl_suppliers.id IN (
	SELECT mhl_suppliers.id FROM mhl_suppliers
	LEFT JOIN pc_lat_long ON mhl_suppliers.postcode = pc_lat_long.pc6
	WHERE pc_lat_long.id IS NULL AND mhl_suppliers.postcode IS NOT NULL);

SELECT * FROM mhl_suppliers
LEFT JOIN pc_lat_long ON mhl_suppliers.postcode = pc_lat_long.pc6
WHERE pc_lat_long.pc6 = "2811EP";

DELETE FROM pc_lat_long
WHERE pc6 LIKE "% %";

INSERT INTO pc_lat_long (pc6)
SELECT DISTINCT REPLACE(UPPER(postcode)," ","") FROM mhl_suppliers
WHERE mhl_suppliers.id IN (
	SELECT mhl_suppliers.id FROM mhl_suppliers
	LEFT JOIN pc_lat_long ON mhl_suppliers.postcode = pc_lat_long.pc6
	WHERE pc_lat_long.id IS NULL AND mhl_suppliers.postcode IS NOT NULL);
    
-- DUPLICATE ENTRIES OOKAL STAAN ZE NIET IN DE JOIN

-- 14. mhl_suppliers p_postcode & pc_lat_long pc6 ==================================================================

ALTER TABLE mhl_suppliers
ADD CONSTRAINT FK_mhl_suppliers_p_postcode_pc_lat_long_pc6
FOREIGN KEY (p_postcode) REFERENCES pc_lat_long(pc6);

SELECT * FROM mhl_suppliers S
LEFT JOIN pc_lat_long P ON S.p_postcode = P.pc6
WHERE P.id IS NULL;
-- Eerst gaan we weer de open velden vervangen door NULLS.

UPDATE mhl_suppliers
SET p_postcode = NULL
WHERE p_postcode = "";
-- Nu zijn dr nog 611 rows over

SELECT * FROM mhl_suppliers S
LEFT JOIN pc_lat_long P ON S.p_postcode = P.pc6
WHERE P.id IS NULL AND p_postcode IS NOT NULL;
-- hiermee om de join te zien zonder alle NULLS in p_postcode

INSERT IGNORE INTO pc_lat_long (pc6)
SELECT DISTINCT REPLACE(UPPER(p_postcode)," ","") FROM mhl_suppliers
WHERE mhl_suppliers.id IN (
	SELECT mhl_suppliers.id FROM mhl_suppliers
	LEFT JOIN pc_lat_long ON mhl_suppliers.p_postcode = pc_lat_long.pc6
	WHERE pc_lat_long.id IS NULL AND mhl_suppliers.postcode IS NOT NULL); 

-- 15.

ALTER TABLE mhl_suppliers_mhl_rubriek_view
ADD CONSTRAINT FK_mhl_suppliers_mhl_rubriek_view_mhl_rubriek_view_ID
FOREIGN KEY (mhl_rubriek_view_ID) REFERENCES mhl_rubrieken(id);
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`mhl`.`#sql-8f8_fc`, CONSTRAINT `FK_mhl_suppliers_mhl_rubriek_view_mhl_rubriek_view_ID` FOREIGN KEY (`mhl_rubriek_view_ID`) REFERENCES `mhl_rubrieken` (`id`))

SELECT * FROM mhl_suppliers_mhl_rubriek_view V
LEFT JOIN mhl_rubrieken R ON V.mhl_rubriek_view_ID = R.id
WHERE R.id IS NULL;
