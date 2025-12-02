DELIMITER //

CREATE OR REPLACE TRIGGER trg_system_userid
BEFORE INSERT ON People
FOR EACH ROW
BEGIN trg_system_useridtrg_system_userid

	DECLARE base_id VARCHAR(50);
    DECLARE num INT;
    
	-- Creates the user id (Ex: jasmith
	SET base_id = LOWER(
		CONCAT(
			LEFT(NEW.first_name, 2), 
            LEFT(NEW.last_name, 4)
	));
    
	-- Counts how many IDs are already using this base
    SELECT COUNT(*) INTO num
    FROM People
    WHERE system_userid LIKE CONCAT(base_id, '%');
    
    -- Creates new userid with the base and count + 1
    SET NEW.system_userid = CONCAT(base_id, num + 1);
    
	-- Create campus email
    SET NEW.email = CONCAT(NEW.system_userid, '@wsc.edu');
    
END //

DELIMITER ;