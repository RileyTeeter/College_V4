CREATE TABLE `people_audit_table` (
  `people_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `system_userid` varchar(45) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `audit_user_id` varchar(10) NOT NULL,
  `audit_timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `type_of_audit` varchar(45) NOT NULL,
  KEY `person_first_name` (`first_name`),
  KEY `person_last_name` (`last_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci



DELIMITER //
CREATE TRIGGER people_audit_table_insert
	BEFORE INSERT ON People
    FOR EACH ROW
BEGIN
	INSERT INTO people_audit_table (people_id,first_name,last_name,system_userid,email,phone_number,address,audit_user_id,type_of_audit)
    VALUES (NEW.people_id,NEW.first_name,NEW.last_name,NEW.system_userid,NEW.email,NEW.phone_number,NEW.address, NEW.audit_user_id, 'INSERT');
END//



DELIMITER //
CREATE TRIGGER people_audit_table_delete
	BEFORE DELETE ON People
    FOR EACH ROW
BEGIN
	INSERT INTO people_audit_table (people_id,first_name,last_name,system_userid,email,phone_number,address,audit_user_id,type_of_audit)
    VALUES (OLD.people_id,OLD.first_name,OLD.last_name,OLD.system_userid,OLD.email,OLD.phone_number,OLD.address, OLD.audit_user_id, 'DELETE');
END//

DELIMITER //

CREATE TRIGGER people_audit_table_update
	BEFORE UPDATE ON People
    FOR EACH ROW
BEGIN
	INSERT INTO people_audit_table (people_id,first_name,last_name,system_userid,email,phone_number,address,audit_user_id,type_of_audit)
    VALUES (OLD.people_id,OLD.first_name,OLD.last_name,OLD.system_userid,OLD.email,OLD.phone_number,OLD.address, NEW.audit_user_id, 'UPDATE');
END//

SET GLOBAL event_scheduler = ON;
DELIMITER //
CREATE EVENT IF NOT EXISTS people_audit_monthy_truncate
	ON SCHEDULE EVERY 1 MONTH
    STARTS CURRENT_TIMESTAMP + INTERVAL 1 MONTH
    DO
    BEGIN
		TRUNCATE TABLE people_audit_table;
	END //
