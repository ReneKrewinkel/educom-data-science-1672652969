SELECT id FROM mhl_brands;

DELIMITER //

CREATE PROCEDURE getAllBrands()
BEGIN
	SELECT name FROM mhl_brands;
END //

DELIMITER ;

CALL getAllBrands;
DROP PROCEDURE getAllBrands;