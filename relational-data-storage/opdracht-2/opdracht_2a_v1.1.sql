USE mhl;

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

ALTER TABLE mhl_properties
ADD CONSTRAINT FK_mhl_properties_supplier_ID
FOREIGN KEY (supplier_ID) REFERENCES mhl_suppliers(id);
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`mhl`.`#sql-8f8_5d`, CONSTRAINT `FK_mhl_properties_supplier_ID` FOREIGN KEY (`supplier_ID`) REFERENCES `mhl_suppliers` (`id`))

SELECT * FROM mhl_properties
LEFT JOIN mhl_suppliers ON mhl_properties.supplier_ID = mhl_suppliers.id
WHERE mhl_suppliers.id IS NULL;

ALTER TABLE mhl_properties MODIFY supplier_ID INT(11) NULL;

CREATE TABLE parent (
   id int(10) UNSIGNED NOT NULL,
    PRIMARY KEY (id)
) ENGINE=INNODB;
CREATE TABLE child (
    id int(10) UNSIGNED NOT NULL,
    parent_id int(10) UNSIGNED DEFAULT NULL,
    FOREIGN KEY (parent_id) REFERENCES parent(id) ON DELETE CASCADE
) ENGINE=INNODB;

USE testDBForeignKeys;

CREATE TABLE mhl_suppliers (
	id INT(11) UNSIGNED NOT NULL,
    membertype INT(11),
    company INT(11),
    name VARCHAR(75) NULL,
    straat VARCHAR(50) NULL,
    huisnr VARCHAR(25) NULL,
    postcode VARCHAR(7) NULL,
    city_ID INT(11) NULL,
    p_address VARCHAR(30) NULL,
    p_postcode VARCHAR(7) NULL,
    p_city_ID INT(11) NULL,
    PRIMARY KEY (id)
    ) ENGINE=INNODB;
CREATE TABLE mhl_properties (
	id INT(11) UNSIGNED NOT NULL,
    supplier_ID INT(11) UNSIGNED DEFAULT NULL,
    propertytype_ID INT(11),
    content TEXT,
    FOREIGN KEY(supplier_ID) REFERENCES mhl_suppliers(id) ON DELETE CASCADE
    ) ENGINE=INNODB;

-- 9.

ALTER TABLE mhl_properties
ADD CONSTRAINT FK_mhl_properties_propertytype_ID
FOREIGN KEY (propertytype_ID) REFERENCES mhl_propertytypes(id);

    ALTER TABLE mhl_properties MODIFY propertytype_ID INT(11) NULL;
	UPDATE mhl_properties
	SET propertytype_ID=NULL
	WHERE propertytype_ID=0;
-- Retry FK statement hierna en Success

ALTER TABLE mhl_suppliers 
ADD CONSTRAINT FK_mhl_suppliers_membertype
FOREIGN KEY (membertype) REFERENCES mhl_membertypes(id);
-- Dit failed omdat sommige values van mhl_suppliers(membertype) 0 zijn.
	ALTER TABLE mhl_suppliers MODIFY membertype INT(11) NULL;
    
    SET SQL_SAFE_UPDATES = 0;
	UPDATE mhl_suppliers
	SET membertype=NULL
	WHERE membertype=0;
    
    SELECT *
	FROM mhl_suppliers
	WHERE membertype NOT BETWEEN 1 AND 10;
-- Success

ALTER TABLE mhl_suppliers 
ADD CONSTRAINT FK_mhl_suppliers_company
FOREIGN KEY (company) REFERENCES mhl_companies(id);
    
	UPDATE mhl_suppliers
	SET company=NULL
	WHERE company=0;
-- Success

ALTER TABLE mhl_suppliers 
ADD CONSTRAINT FK_mhl_suppliers_city_ID
FOREIGN KEY (city_ID) REFERENCES mhl_cities(id);

	UPDATE mhl_suppliers
	SET city_ID=NULL
	WHERE city_ID=0;
-- Still fails
    
ALTER TABLE mhl_suppliers 
ADD CONSTRAINT FK_mhl_suppliers_p_city_ID
FOREIGN KEY (p_city_ID) REFERENCES pc_lat_long(id);
    
	UPDATE mhl_suppliers
	SET p_city_ID=NULL
	WHERE p_city_ID=0;
-- Still fails

ALTER TABLE mhl_suppliers_mhl_rubriek_view
ADD CONSTRAINT FK_mhl_suppliers_mhl_rubriek_view_mhl_rubriek_view_ID
FOREIGN KEY (mhl_rubriek_view_ID) REFERENCES mhl_rubrieken(id);
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`mhl`.`#sql-8f8_fc`, CONSTRAINT `FK_mhl_suppliers_mhl_rubriek_view_mhl_rubriek_view_ID` FOREIGN KEY (`mhl_rubriek_view_ID`) REFERENCES `mhl_rubrieken` (`id`))


