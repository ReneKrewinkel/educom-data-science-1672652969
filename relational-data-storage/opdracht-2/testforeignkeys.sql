USE testDBForeignKeys;

CREATE TABLE parent (
   id int(10) UNSIGNED NOT NULL,
    PRIMARY KEY (id)
) ENGINE=INNODB;
CREATE TABLE child (
    id int(10) UNSIGNED NOT NULL,
    parent_id int(10) UNSIGNED DEFAULT NULL,
    FOREIGN KEY (parent_id) REFERENCES parent(id) ON DELETE CASCADE
) ENGINE=INNODB;


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