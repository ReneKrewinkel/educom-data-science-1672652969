-- LOOP

DROP PROCEDURE IF EXISTS p_loop_demo;

DELIMITER $$

CREATE PROCEDURE p_loop_demo()
BEGIN
	DECLARE x INT;
	DECLARE str VARCHAR(255);
	
    SET str = '';
    SET x = 1;
    
    loop_label: LOOP
		IF x > 10 THEN LEAVE loop_label;
        END IF;
        
        SET x = x + 1;
        
        IF (x mod 2) THEN ITERATE loop_label;
        -- checkt of x een remainder heeft na delen door 2.
        ELSE SET str = CONCAT(str,x,',');
        END IF;
	END LOOP;
	SELECT str;
    
END $$
DELIMITER ;

CALL p_loop_demo();
-- WHILE LOOP ----------------------------------

DROP PROCEDURE IF EXISTS p_while_demo;

DELIMITER $$
CREATE PROCEDURE p_while_demo()
BEGIN
	DECLARE x INT;
    DECLARE str VARCHAR(255);
    
    SET x = 1;
    SET str = '';
	
    loop_label: WHILE x <= 10 DO
		IF NOT (x MOD 2) THEN SET str = CONCAT(str,x,',');
		END IF;
        
        SET x = x + 1;
	END WHILE;
    SELECT str;
END$$
DELIMITER ;
-- NOTE: achter de DELIMTERS MOET een spactie en daarna pas t teken!

CALL p_while_demo();




-- REPEAT ------------------------------------------------------------------------

DROP PROCEDURE IF EXISTS p_repeat_demo;

DELIMITER $$
CREATE PROCEDURE p_repeat_demo()
BEGIN
	DECLARE x INT;
    DECLARE str VARCHAR(255);
    
    SET x = 1;
    SET str = '';
	
    loop_label: REPEAT
		IF NOT (x MOD 2) THEN SET str = CONCAT(str,x,',');
		END IF;
        
        SET x = x + 1;
	UNTIL x > 10
	END REPEAT;
    SELECT str;
END$$
DELIMITER ;

CALL p_repeat_demo();