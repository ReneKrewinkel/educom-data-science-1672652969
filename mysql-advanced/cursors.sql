DROP PROCEDURE IF EXISTS p_create_emaillist;

DELIMITER $$
CREATE PROCEDURE p_create_emaillist(
	INOUT emailList VARCHAR(4000)
)
BEGIN
	DECLARE finished INTEGER DEFAULT 0;
    DECLARE emailAdress VARCHAR(100) DEFAULT "";
    
    -- Declare cursor for employee email
    DECLARE curEmail
    CURSOR FOR 
		SELECT email FROM employees;
        
	DECLARE CONTINUE HANDLER 
		FOR NOT FOUND SET finished = 1;
	
    OPEN curEmail;
    
    getEmail: LOOP
		FETCH curEmail INTO emailAdress;
        IF finished = 1 THEN
			LEAVE getEmail;
		END IF;
        -- Build email list
        SET emailList = CONCAT(emailAdress,",",emailList);
	END LOOP getEmail;
    CLOSE curEMail;
END$$
DELIMITER ;

SET @emailList ="";
CALL p_create_emaillist(@emailList);
SELECT @emailList;


-- Assignment:
DROP PROCEDURE IF EXISTS p_add_customer_reporting;

DELIMITER $$
CREATE PROCEDURE p_add_customer_reporting()
BEGIN
	SELECT customerName INTO customer_reporting FROM customers;
END$$
DELIMITER ;

SELECT customerName INTO customer_reporting FROM customers;