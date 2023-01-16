DELIMITER $$

CREATE PROCEDURE p_getPcustomer_shipping(
	IN pCustomerNumber INT
)

BEGIN 
	DECLARE customerCountry VARCHAR(100);
    DECLARE pShipping VARCHAR(50);
    
    SELECT country
    INTO customerCountry
    FROM customers
    WHERE customerNumber = pCustomerNumber;
    
    CASE customerCountry
		WHEN 'USA' THEN SET pShipping = '2-day Shipping';
        WHEN 'Canada' THEN SET pShipping = '3-day-Shipping';
        ELSE SET pShipping = '5-day Shipping';
	END CASE;
    
    SELECT pShipping;
    
END$$

DELIMITER ;

SELECT *
FROM customers;

CALL p_getPcustomer_shipping(114)