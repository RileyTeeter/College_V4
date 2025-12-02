/*
================================================
CREATE TABLE: creates empty audit table that 
triggers will store data in.
================================================
*/
/*
CREATE TABLE IF NOT EXISTS Courses_Audit (
    audit_id        INT AUTO_INCREMENT PRIMARY KEY,
    course_id       INT,
    course_name     VARCHAR(255),
    course_description MEDIUMTEXT,
    audit_action    VARCHAR(20) NOT NULL,   -- INSERT, UPDATE, DELETE
    audit_user      VARCHAR(100) NOT NULL,
    audit_timestamp TIMESTAMP NOT NULL 
                    DEFAULT CURRENT_TIMESTAMP
);
*/
/*
================================================
TRIGGER 1 - After Insert on Courses
Captures the NEW row values and inserts a record 
into Courses_Audit documenting the insert.
================================================
*/

DELIMITER //

CREATE OR REPLACE TRIGGER trg_courses_insert_audit
AFTER INSERT ON Courses
FOR EACH ROW
BEGIN
	
    DECLARE v_user VARCHAR(100); -- Stores the username
    
    SET v_user = SUBSTRING_INDEX(CURRENT_USER(), '@', 1); -- Gets userid before @
    
    -- Insert a new audit entrty for this INSERT action
    INSERT INTO Courses_Audit (
		course_id,
        course_name,
        course_description,
        audit_action,     -- What happened (INSERT)
        audit_user        -- Who performed the action
    )
    
    VALUES (
		NEW.course_id,        
        NEW.course_name,
        NEW.course_description,
        'INSERT',             -- Action type
        v_user                -- Database user who did it
    );
END //

/*
================================================
TRIGGER 2 - After Update on Courses
Captures the OLD row values BEFORE any updates.
Logs the change inside Courses_Audit
================================================
*/

CREATE OR REPLACE TRIGGER trg_courses_update_audit
AFTER UPDATE ON Courses
FOR EACH ROW
BEGIN
	DECLARE v_user VARCHAR(100);
    
    SET v_user = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);
    
    INSERT INTO Courses_Audit (
		course_id,
        course_name,
        course_description,
        audit_action,
        audit_user
    )
    VALUES (
        OLD.course_id,         
        OLD.course_name,
        OLD.course_description,
        'UPDATE',              -- Record that an update occurred
        v_user
    );
END //

/*
=====================================================
TRIGGER 3 - After Delete on Courses
Captures the OLD row (the row that is being removed).
Saves the deleted data in Courses_audit.
=====================================================
*/

CREATE OR REPLACE TRIGGER trg_courses_delete_audit
AFTER DELETE ON Courses
FOR EACH ROW
BEGIN
	DECLARE v_user VARCHAR(100);
    
    -- Get user who executed the Delete
    SET v_user = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);

	-- Insert the OLD values (the row being deleted)
    INSERT INTO Courses_Audit (
        course_id,
        course_name,
        course_description,
        audit_action,
        audit_user
    )
    VALUES (
        OLD.course_id,
        OLD.course_name,
        OLD.course_description,
        'DELETE',            -- Record that a delete happened
        v_user
    );
END //

/*
================================================
EVENT 1 -
Clears Course_Audit table once a month
================================================
*/
SET GLOBAL event_scheduler = ON;

CREATE EVENT IF NOT EXISTS ev_courses_audit_monthly_truncate
	ON SCHEDULE EVERY 1 MONTH
    STARTS CURRENT_TIMESTAMP + INTERVAL 1 MONTH
DO 
BEGIN
	TRUNCATE TABLE Courses_Audit;
END //

DELIMITER ;





