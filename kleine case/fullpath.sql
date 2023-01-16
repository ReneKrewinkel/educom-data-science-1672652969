DROP FUNCTION IF EXISTS FullPath;

DELIMITER $$

CREATE FUNCTION FullPath(
    folder_id INT
) 
RETURNS VARCHAR(1000)
READS SQL DATA
BEGIN
    DECLARE folder_name VARCHAR(1000) DEFAULT '';
    DECLARE parent_name VARCHAR(1000) DEFAULT '';
	DECLARE parent_id INT DEFAULT 0;
    
	SELECT 
		name, parent INTO folder_name, parent_id 
	FROM folders 
	WHERE id = folder_id;
	WHILE parent_id > 0 DO
		SELECT 
			name, parent INTO parent_name, parent_id 
		FROM folders 
		WHERE id = parent_id;
		SET folder_name = CONCAT(parent_name,'\\', folder_name);
	END WHILE;
    RETURN (folder_name);
END$$

DELIMITER ;

SELECT FullPath(40);
