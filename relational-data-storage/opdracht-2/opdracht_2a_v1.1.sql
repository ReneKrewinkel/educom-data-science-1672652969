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

ALTER TABLE mhl_cities
ADD CONSTRAINT FK_mhl_cities_Commune_ID
FOREIGN KEY (commune_ID) REFERENCES mhl_communes(id);
-- Fails

	ALTER TABLE mhl_cities MODIFY commune_ID INT(11) NULL;
    
	UPDATE mhl_cities
	SET commune_ID=NULL
	WHERE commune_ID=0;
	--  Still nope

ALTER TABLE mhl_communes
ADD CONSTRAINT FK_District_ID
FOREIGN KEY (district_ID) REFERENCES mhl_districts(id);
-- Success

ALTER TABLE mhl_contacts
ADD CONSTRAINT FK_mhl_contacts_department
FOREIGN KEY (department) REFERENCES mhl_departments(id);
-- Success

ALTER TABLE mhl_contacts
ADD CONSTRAINT FK_mhl_contacts_supplier_ID
FOREIGN KEY (supplier_ID) REFERENCES mhl_suppliers(id);
-- Fails

ALTER TABLE mhl_detaildefs
ADD CONSTRAINT FK_mhl_detailsdefs_group_ID
FOREIGN KEY (group_ID) REFERENCES mhl_detailgroups(id);
-- success

ALTER TABLE mhl_detaildefs
ADD CONSTRAINT FK_mhl_detailsdefs_propertytype_ID
FOREIGN KEY (propertytype_ID) REFERENCES mhl_propertytypes(id);
-- fails omdat in mhl_detaildefs ID 0 voorkomt. Dit komt niet voor in mhl_propertytypes. Als je alle 0's vervangt door NULL wordt dit opgelost.

	ALTER TABLE mhl_detaildefs MODIFY propertytype_ID INT(11) NULL;
    
	UPDATE mhl_detaildefs
	SET propertytype_ID=NULL
	WHERE propertytype_ID=0;
	-- En nu werkt de add foreign key statment hierboven wel
    
ALTER TABLE mhl_districts
ADD CONSTRAINT FK_mhl_districts_country_ID
FOREIGN KEY (country_ID) REFERENCES mhl_countries(id);
-- Success

ALTER TABLE mhl_properties
ADD CONSTRAINT FK_mhl_properties_supplier_ID
FOREIGN KEY (supplier_ID) REFERENCES mhl_suppliers(id);
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`mhl`.`#sql-8f8_5d`, CONSTRAINT `FK_mhl_properties_supplier_ID` FOREIGN KEY (`supplier_ID`) REFERENCES `mhl_suppliers` (`id`))

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


