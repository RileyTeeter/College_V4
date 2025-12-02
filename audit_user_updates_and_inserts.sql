DELIMITER //
CREATE TRIGGER audit_field_insert_people
	BEFORE INSERT ON People
	FOR EACH ROW
BEGIN
	DECLARE audit_user VARCHAR(10);  -- temp value for the id of the audit user
	SET @user_id = CURRENT_USER(); -- finds the full email of the current user
	SELECT SUBSTRING_INDEX(@user_id, '@', 1) into audit_user; -- truncates the @user_id to remove the email suffix
	SET NEW.audit_user_id = (audit_user); -- sets the audit_user_id to the new user_id
END//

CREATE TRIGGER audit_field_update_people
	BEFORE UPDATE ON People
    FOR EACH ROW
BEGIN
	DECLARE audit_user VARCHAR(10);  -- temp value for the id of the audit user
	SET @user_id = CURRENT_USER(); -- finds the full email of the current user
	SELECT SUBSTRING_INDEX(@user_id, '@', 1) into audit_user; -- truncates the @user_id to remove the email suffix
	SET NEW.audit_user_id = (audit_user); -- sets the audit_user_id to the new user_id
END//
DELIMITER //
CREATE TRIGGER audit_field_insert_admin
BEFORE INSERT ON Admin
FOR EACH ROW
BEGIN
    DECLARE audit_user VARCHAR(50);
    SET @user_id = CURRENT_USER();
    SELECT SUBSTRING_INDEX(@user_id, '@', 1) INTO audit_user;
    SET NEW.audit_user_id = audit_user;
END//
CREATE TRIGGER audit_field_update_admin
BEFORE UPDATE ON Admin
FOR EACH ROW
BEGIN
    DECLARE audit_user VARCHAR(50);
    SET @user_id = CURRENT_USER();
    SELECT SUBSTRING_INDEX(@user_id, '@', 1) INTO audit_user;
    SET NEW.audit_user_id = audit_user;
END//
DELIMITER ;
DELIMITER //
CREATE TRIGGER audit_field_insert_bill
BEFORE INSERT ON Bill
FOR EACH ROW
BEGIN
    DECLARE audit_user VARCHAR(50);
    SET @user_id = CURRENT_USER();
    SELECT SUBSTRING_INDEX(@user_id, '@', 1) INTO audit_user;
    SET NEW.audit_user_id = audit_user;
END//
CREATE TRIGGER audit_field_update_bill
BEFORE UPDATE ON Bill
FOR EACH ROW
BEGIN
    DECLARE audit_user VARCHAR(50);
    SET @user_id = CURRENT_USER();
    SELECT SUBSTRING_INDEX(@user_id, '@', 1) INTO audit_user;
    SET NEW.audit_user_id = audit_user;
END//
DELIMITER ;
DELIMITER //
CREATE TRIGGER audit_field_insert_building
BEFORE INSERT ON Building
FOR EACH ROW
BEGIN
    DECLARE audit_user VARCHAR(50);
    SET @user_id = CURRENT_USER();
    SELECT SUBSTRING_INDEX(@user_id, '@', 1) INTO audit_user;
    SET NEW.audit_user_id = audit_user;
END//
CREATE TRIGGER audit_field_update_building
BEFORE UPDATE ON Building
FOR EACH ROW
BEGIN
    DECLARE audit_user VARCHAR(50);
    SET @user_id = CURRENT_USER();
    SELECT SUBSTRING_INDEX(@user_id, '@', 1) INTO audit_user;
    SET NEW.audit_user_id = audit_user;
END//
DELIMITER ;
DELIMITER //
CREATE TRIGGER audit_field_insert_courses
BEFORE INSERT ON Courses
FOR EACH ROW
BEGIN
    DECLARE audit_user VARCHAR(50);
    SET @user_id = CURRENT_USER();
    SELECT SUBSTRING_INDEX(@user_id, '@', 1) INTO audit_user;
    SET NEW.audit_user_id = audit_user;
END//
CREATE TRIGGER audit_field_update_courses
BEFORE UPDATE ON Courses
FOR EACH ROW
BEGIN
    DECLARE audit_user VARCHAR(50);
    SET @user_id = CURRENT_USER();
    SELECT SUBSTRING_INDEX(@user_id, '@', 1) INTO audit_user;
    SET NEW.audit_user_id = audit_user;
END//
DELIMITER ;
DELIMITER //
CREATE TRIGGER audit_field_insert_course_section
BEFORE INSERT ON Course_Section
FOR EACH ROW
BEGIN
    DECLARE audit_user VARCHAR(50);
    SET @user_id = CURRENT_USER();
    SELECT SUBSTRING_INDEX(@user_id, '@', 1) INTO audit_user;
    SET NEW.audit_user_id = audit_user;
END//
CREATE TRIGGER audit_field_update_course_section
BEFORE UPDATE ON Course_Section
FOR EACH ROW
BEGIN
    DECLARE audit_user VARCHAR(50);
    SET @user_id = CURRENT_USER();
    SELECT SUBSTRING_INDEX(@user_id, '@', 1) INTO audit_user;
    SET NEW.audit_user_id = audit_user;
END//
DELIMITER ;
DELIMITER //
CREATE TRIGGER audit_field_insert_dorm_room
BEFORE INSERT ON Dorm_room
FOR EACH ROW
BEGIN
    DECLARE audit_user VARCHAR(50);
    SET @user_id = CURRENT_USER();
    SELECT SUBSTRING_INDEX(@user_id, '@', 1) INTO audit_user;
    SET NEW.audit_user_id = audit_user;
END//
CREATE TRIGGER audit_field_update_dorm_room
BEFORE UPDATE ON Dorm_room
FOR EACH ROW
BEGIN
    DECLARE audit_user VARCHAR(50);
    SET @user_id = CURRENT_USER();
    SELECT SUBSTRING_INDEX(@user_id, '@', 1) INTO audit_user;
    SET NEW.audit_user_id = audit_user;
END//
DELIMITER ;
DELIMITER //
CREATE TRIGGER audit_field_insert_emergency_contact
BEFORE INSERT ON emergency_contact
FOR EACH ROW
BEGIN
    DECLARE audit_user VARCHAR(50);
    SET @user_id = CURRENT_USER();
    SELECT SUBSTRING_INDEX(@user_id, '@', 1) INTO audit_user;
    SET NEW.audit_user_id = audit_user;
END//
CREATE TRIGGER audit_field_update_emergency_contact
BEFORE UPDATE ON emergency_contact
FOR EACH ROW
BEGIN
    DECLARE audit_user VARCHAR(50);
    SET @user_id = CURRENT_USER();
    SELECT SUBSTRING_INDEX(@user_id, '@', 1) INTO audit_user;
    SET NEW.audit_user_id = audit_user;
END//
DELIMITER ;
DELIMITER //
CREATE TRIGGER audit_field_insert_faculty
BEFORE INSERT ON Faculty
FOR EACH ROW
BEGIN
    DECLARE audit_user VARCHAR(50);
    SET @user_id = CURRENT_USER();
    SELECT SUBSTRING_INDEX(@user_id, '@', 1) INTO audit_user;
    SET NEW.audit_user_id = audit_user;
END//
CREATE TRIGGER audit_field_update_faculty
BEFORE UPDATE ON Faculty
FOR EACH ROW
BEGIN
    DECLARE audit_user VARCHAR(50);
    SET @user_id = CURRENT_USER();
    SELECT SUBSTRING_INDEX(@user_id, '@', 1) INTO audit_user;
    SET NEW.audit_user_id = audit_user;
END//
DELIMITER ;
DELIMITER //
CREATE TRIGGER audit_field_insert_room
BEFORE INSERT ON Room
FOR EACH ROW
BEGIN
    DECLARE audit_user VARCHAR(50);
    SET @user_id = CURRENT_USER();
    SELECT SUBSTRING_INDEX(@user_id, '@', 1) INTO audit_user;
    SET NEW.audit_user_id = audit_user;
END//
CREATE TRIGGER audit_field_update_room
BEFORE UPDATE ON Room
FOR EACH ROW
BEGIN
    DECLARE audit_user VARCHAR(50);
    SET @user_id = CURRENT_USER();
    SELECT SUBSTRING_INDEX(@user_id, '@', 1) INTO audit_user;
    SET NEW.audit_user_id = audit_user;
END//
DELIMITER ;
DELIMITER //
CREATE TRIGGER audit_field_insert_room_schedule
BEFORE INSERT ON Room_Schedule
FOR EACH ROW
BEGIN
    DECLARE audit_user VARCHAR(50);
    SET @user_id = CURRENT_USER();
    SELECT SUBSTRING_INDEX(@user_id, '@', 1) INTO audit_user;
    SET NEW.audit_user_id = audit_user;
END//
CREATE TRIGGER audit_field_update_room_schedule
BEFORE UPDATE ON Room_Schedule
FOR EACH ROW
BEGIN
    DECLARE audit_user VARCHAR(50);
    SET @user_id = CURRENT_USER();
    SELECT SUBSTRING_INDEX(@user_id, '@', 1) INTO audit_user;
    SET NEW.audit_user_id = audit_user;
END//
DELIMITER ;
DELIMITER //
CREATE TRIGGER audit_field_insert_semester
BEFORE INSERT ON Semester
FOR EACH ROW
BEGIN
    DECLARE audit_user VARCHAR(50);
    SET @user_id = CURRENT_USER();
    SELECT SUBSTRING_INDEX(@user_id, '@', 1) INTO audit_user;
    SET NEW.audit_user_id = audit_user;
END//
CREATE TRIGGER audit_field_update_semester
BEFORE UPDATE ON Semester
FOR EACH ROW
BEGIN
    DECLARE audit_user VARCHAR(50);
    SET @user_id = CURRENT_USER();
    SELECT SUBSTRING_INDEX(@user_id, '@', 1) INTO audit_user;
    SET NEW.audit_user_id = audit_user;
END//
DELIMITER ;
DELIMITER //
CREATE TRIGGER audit_field_insert_students
BEFORE INSERT ON Students
FOR EACH ROW
BEGIN
    DECLARE audit_user VARCHAR(50);
    SET @user_id = CURRENT_USER();
    SELECT SUBSTRING_INDEX(@user_id, '@', 1) INTO audit_user;
    SET NEW.audit_user_id = audit_user;
END//
CREATE TRIGGER audit_field_update_students
BEFORE UPDATE ON Students
FOR EACH ROW
BEGIN
    DECLARE audit_user VARCHAR(50);
    SET @user_id = CURRENT_USER();
    SELECT SUBSTRING_INDEX(@user_id, '@', 1) INTO audit_user;
    SET NEW.audit_user_id = audit_user;
END//
DELIMITER ;
