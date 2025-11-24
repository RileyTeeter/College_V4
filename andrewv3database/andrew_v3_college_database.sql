-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema af25andrb1_CollegeDBV1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema af25andrb1_CollegeDBV1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `af25andrb1_CollegeDBV1` DEFAULT CHARACTER SET utf8mb4 ;
USE `af25andrb1_CollegeDBV1` ;

-- -----------------------------------------------------
-- Table `af25andrb1_CollegeDBV1`.`People`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `af25andrb1_CollegeDBV1`.`People` (
  `people_id` INT(11) NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(255) NOT NULL,
  `last_name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `phone_number` VARCHAR(255) NULL DEFAULT NULL,
  `address` VARCHAR(255) NULL DEFAULT NULL,
  `audit_user_id` INT(11) NOT NULL,
  `audit_timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  PRIMARY KEY (`people_id`),
  INDEX `person_first_name` (`first_name` ASC) VISIBLE,
  INDEX `person_last_name` (`last_name` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 201
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `af25andrb1_CollegeDBV1`.`Admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `af25andrb1_CollegeDBV1`.`Admin` (
  `admin_id` INT(11) NOT NULL AUTO_INCREMENT,
  `people_id` INT(11) NOT NULL,
  `audit_user_id` INT(11) NOT NULL,
  `audit_timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  PRIMARY KEY (`admin_id`),
  UNIQUE INDEX `people_id_UNIQUE` (`people_id` ASC) VISIBLE,
  CONSTRAINT `fk_Admin_People1`
    FOREIGN KEY (`people_id`)
    REFERENCES `af25andrb1_CollegeDBV1`.`People` (`people_id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `af25andrb1_CollegeDBV1`.`Building`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `af25andrb1_CollegeDBV1`.`Building` (
  `building_id` INT(11) NOT NULL AUTO_INCREMENT,
  `building_name` VARCHAR(255) NULL DEFAULT NULL,
  `building_abreviation` CHAR(3) NULL DEFAULT NULL,
  `audit_user_id` INT(11) NOT NULL,
  `audit_timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  PRIMARY KEY (`building_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `af25andrb1_CollegeDBV1`.`Courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `af25andrb1_CollegeDBV1`.`Courses` (
  `course_id` INT(11) NOT NULL AUTO_INCREMENT,
  `course_name` VARCHAR(255) NOT NULL,
  `course_description` MEDIUMTEXT NOT NULL,
  `audit_user_id` INT(11) NOT NULL,
  `audit_timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  PRIMARY KEY (`course_id`),
  INDEX `course_name` (`course_name` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `af25andrb1_CollegeDBV1`.`Semester`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `af25andrb1_CollegeDBV1`.`Semester` (
  `semester_id` INT(11) NOT NULL AUTO_INCREMENT,
  `semester_type` VARCHAR(255) NOT NULL,
  `semester_year` YEAR(4) NOT NULL,
  `audit_user_id` INT(11) NOT NULL,
  `audit_timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  PRIMARY KEY (`semester_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `af25andrb1_CollegeDBV1`.`Room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `af25andrb1_CollegeDBV1`.`Room` (
  `room_number` INT(11) NOT NULL AUTO_INCREMENT,
  `building_id` INT(11) NOT NULL,
  `occupancy_limit` INT(11) NOT NULL,
  `audit_user_id` INT(11) NOT NULL,
  `audit_timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  PRIMARY KEY (`room_number`),
  INDEX `fk_Room_Buidling1_idx` (`building_id` ASC) VISIBLE,
  CONSTRAINT `fk_Room_Buidling1`
    FOREIGN KEY (`building_id`)
    REFERENCES `af25andrb1_CollegeDBV1`.`Building` (`building_id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 101
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `af25andrb1_CollegeDBV1`.`Faculty`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `af25andrb1_CollegeDBV1`.`Faculty` (
  `faculty_id` INT(11) NOT NULL AUTO_INCREMENT,
  `people_id` INT(11) NOT NULL,
  `office_number` INT(11) NOT NULL,
  `department` VARCHAR(255) NOT NULL,
  `audit_user_id` INT(11) NOT NULL,
  `audit_timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  PRIMARY KEY (`faculty_id`),
  UNIQUE INDEX `people_id_UNIQUE` (`people_id` ASC) VISIBLE,
  INDEX `fk_Faculty_Room1_idx` (`office_number` ASC) VISIBLE,
  CONSTRAINT `fk_Facuilty_People1`
    FOREIGN KEY (`people_id`)
    REFERENCES `af25andrb1_CollegeDBV1`.`People` (`people_id`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Faculty_Room1`
    FOREIGN KEY (`office_number`)
    REFERENCES `af25andrb1_CollegeDBV1`.`Room` (`room_number`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 51
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `af25andrb1_CollegeDBV1`.`Course_Section`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `af25andrb1_CollegeDBV1`.`Course_Section` (
  `section_id` INT(11) NOT NULL AUTO_INCREMENT,
  `course_id` INT(11) NOT NULL,
  `semester_id` INT(11) NOT NULL,
  `section_number` INT(11) NOT NULL,
  `faculty_id` INT(11) NULL DEFAULT NULL,
  `start_time` TIME NULL DEFAULT NULL,
  `end_time` TIME NULL DEFAULT NULL,
  `audit_user_id` INT(11) NOT NULL,
  `audit_timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  PRIMARY KEY (`section_id`),
  UNIQUE INDEX `section_number_UNIQUE` (`section_number` ASC) VISIBLE,
  INDEX `fk_Course Section_Courses1_idx` (`course_id` ASC) VISIBLE,
  INDEX `fk_Course Section_semester1_idx` (`semester_id` ASC) VISIBLE,
  INDEX `fk_Course_Section_Faculty1_idx` (`faculty_id` ASC) VISIBLE,
  CONSTRAINT `fk_Course Section_Courses1`
    FOREIGN KEY (`course_id`)
    REFERENCES `af25andrb1_CollegeDBV1`.`Courses` (`course_id`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Course Section_semester1`
    FOREIGN KEY (`semester_id`)
    REFERENCES `af25andrb1_CollegeDBV1`.`Semester` (`semester_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Course_Section_Faculty1`
    FOREIGN KEY (`faculty_id`)
    REFERENCES `af25andrb1_CollegeDBV1`.`Faculty` (`faculty_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 81
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `af25andrb1_CollegeDBV1`.`Dorm_room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `af25andrb1_CollegeDBV1`.`Dorm_room` (
  `dorm_room_id` INT(11) NOT NULL AUTO_INCREMENT,
  `dorm_number` INT(11) NOT NULL,
  `occupancy_limit` VARCHAR(45) NOT NULL,
  `occupied` TINYINT(4) NOT NULL,
  `buidling_id` INT(11) NOT NULL,
  `audit_user_id` INT(11) NOT NULL,
  `audit_timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  INDEX `fk_Dorm_room_Buidling1` (`dorm_room_id` ASC) VISIBLE,
  CONSTRAINT `fk_Dorm_room_Buidling1`
    FOREIGN KEY (`dorm_room_id`)
    REFERENCES `af25andrb1_CollegeDBV1`.`Building` (`building_id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `af25andrb1_CollegeDBV1`.`Students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `af25andrb1_CollegeDBV1`.`Students` (
  `student_id` INT(11) NOT NULL AUTO_INCREMENT,
  `people_id` INT(11) NOT NULL,
  `dorm_room` INT(11) NULL DEFAULT NULL,
  `admission_date` DATE NOT NULL,
  `graduation_date` DATE NULL DEFAULT NULL,
  `enrollment_status` VARCHAR(255) NOT NULL,
  `audit_user_id` INT(11) NOT NULL,
  `audit_timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  PRIMARY KEY (`student_id`),
  UNIQUE INDEX `person_id_UNIQUE` (`people_id` ASC) VISIBLE,
  UNIQUE INDEX `student_id_UNIQUE` (`student_id` ASC) VISIBLE,
  INDEX `fk_Students_Dorm_room1_idx` (`dorm_room` ASC) VISIBLE,
  CONSTRAINT `fk_Students_Dorm_room1`
    FOREIGN KEY (`dorm_room`)
    REFERENCES `af25andrb1_CollegeDBV1`.`Dorm_room` (`dorm_room_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Students_People`
    FOREIGN KEY (`people_id`)
    REFERENCES `af25andrb1_CollegeDBV1`.`People` (`people_id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 141
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `af25andrb1_CollegeDBV1`.`Enrollment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `af25andrb1_CollegeDBV1`.`Enrollment` (
  `enrollment_id` INT(11) NOT NULL AUTO_INCREMENT,
  `student_id` INT(11) NOT NULL,
  `section_id` INT(11) NOT NULL,
  `grade` CHAR(2) NULL DEFAULT NULL,
  `audit_user_id` INT(11) NOT NULL,
  `audit_timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  PRIMARY KEY (`enrollment_id`),
  INDEX `fk_Enrollment_Students1_idx` (`student_id` ASC) VISIBLE,
  INDEX `fk_Enrollment_Course_Section1_idx` (`section_id` ASC) VISIBLE,
  CONSTRAINT `fk_Enrollment_Course_Section1`
    FOREIGN KEY (`section_id`)
    REFERENCES `af25andrb1_CollegeDBV1`.`Course_Section` (`section_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Enrollment_Students1`
    FOREIGN KEY (`student_id`)
    REFERENCES `af25andrb1_CollegeDBV1`.`Students` (`student_id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 714
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `af25andrb1_CollegeDBV1`.`Room_Schedule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `af25andrb1_CollegeDBV1`.`Room_Schedule` (
  `schedule_id` INT(11) NOT NULL AUTO_INCREMENT,
  `room_number` INT(11) NOT NULL,
  `section_id` INT(11) NULL DEFAULT NULL,
  `audit_user_id` INT(11) NOT NULL,
  `audit_timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  PRIMARY KEY (`schedule_id`),
  INDEX `fk_Room_Schedule_Room1_idx` (`room_number` ASC) VISIBLE,
  INDEX `fk_Room_Schedule_Course_Section1_idx` (`section_id` ASC) VISIBLE,
  CONSTRAINT `fk_Room_Schedule_Course_Section1`
    FOREIGN KEY (`section_id`)
    REFERENCES `af25andrb1_CollegeDBV1`.`Course_Section` (`section_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Room_Schedule_Room1`
    FOREIGN KEY (`room_number`)
    REFERENCES `af25andrb1_CollegeDBV1`.`Room` (`room_number`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 81
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `af25andrb1_CollegeDBV1`.`emergency_contact`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `af25andrb1_CollegeDBV1`.`emergency_contact` (
  `emergency_contact_id` INT(11) NOT NULL AUTO_INCREMENT,
  `people_id` INT(11) NOT NULL,
  `contact_name` VARCHAR(255) NOT NULL,
  `contact_phone_number` VARCHAR(255) NOT NULL,
  `contact_address` VARCHAR(255) NOT NULL,
  `audit_user_id` INT(11) NOT NULL,
  `audit_TIMESTAMP` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  PRIMARY KEY (`emergency_contact_id`),
  INDEX `fk_emergency contact_People1_idx` (`people_id` ASC) VISIBLE,
  CONSTRAINT `fk_emergency contact_People1`
    FOREIGN KEY (`people_id`)
    REFERENCES `af25andrb1_CollegeDBV1`.`People` (`people_id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 151
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `af25andrb1_CollegeDBV1`.`Bill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `af25andrb1_CollegeDBV1`.`Bill` (
  `bill_id` INT NOT NULL AUTO_INCREMENT,
  `student_id` INT NOT NULL,
  `semester_id` INT(11) NULL,
  `amount_due` DECIMAL(19,4) NOT NULL,
  `audit_user_id` INT(11) NOT NULL,
  `audit_TIMESTAMP` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`bill_id`),
  UNIQUE INDEX `bill_id_UNIQUE` (`bill_id` ASC) VISIBLE,
  INDEX `fk_Bill_Students1_idx` (`student_id` ASC) VISIBLE,
  INDEX `fk_Bill_Semester1_idx` (`semester_id` ASC) VISIBLE,
  CONSTRAINT `fk_Bill_Students1`
    FOREIGN KEY (`student_id`)
    REFERENCES `af25andrb1_CollegeDBV1`.`Students` (`student_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Bill_Semester1`
    FOREIGN KEY (`semester_id`)
    REFERENCES `af25andrb1_CollegeDBV1`.`Semester` (`semester_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `af25andrb1_CollegeDBV1` ;

-- -----------------------------------------------------
-- Placeholder table for view `af25andrb1_CollegeDBV1`.`course_catalog`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `af25andrb1_CollegeDBV1`.`course_catalog` (`instructor name` INT, `semester_type` INT, `semester_year` INT, `section_number` INT, `course_name` INT, `course_description` INT, `room_number` INT, `building_name` INT);

-- -----------------------------------------------------
-- Placeholder table for view `af25andrb1_CollegeDBV1`.`current_student_emergency_contacts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `af25andrb1_CollegeDBV1`.`current_student_emergency_contacts` (`student_name` INT, `home_address` INT, `contact_name` INT, `contact_phone_number` INT, `contact_address` INT);

-- -----------------------------------------------------
-- Placeholder table for view `af25andrb1_CollegeDBV1`.`faculty_offices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `af25andrb1_CollegeDBV1`.`faculty_offices` (`faculty_name` INT, `office_number` INT, `building_name` INT);

-- -----------------------------------------------------
-- Placeholder table for view `af25andrb1_CollegeDBV1`.`grade_book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `af25andrb1_CollegeDBV1`.`grade_book` (`student_name` INT, `course_name` INT, `section_number` INT, `grade` INT);

-- -----------------------------------------------------
-- View `af25andrb1_CollegeDBV1`.`course_catalog`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `af25andrb1_CollegeDBV1`.`course_catalog`;
USE `af25andrb1_CollegeDBV1`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`af25andrb1`@`localhost` SQL SECURITY DEFINER VIEW `af25andrb1_CollegeDBV1`.`course_catalog` AS select concat(`p`.`first_name`,' ',`p`.`last_name`) AS `instructor name`,`se`.`semester_type` AS `semester_type`,`se`.`semester_year` AS `semester_year`,`cs`.`section_number` AS `section_number`,`c`.`course_name` AS `course_name`,`c`.`course_description` AS `course_description`,`r`.`room_number` AS `room_number`,`b`.`building_name` AS `building_name` from (((((((`af25andrb1_CollegeDBV1`.`People` `p` join `af25andrb1_CollegeDBV1`.`Faculty` `f` on(`p`.`people_id` = `f`.`people_id`)) join `af25andrb1_CollegeDBV1`.`Course_Section` `cs` on(`cs`.`faculty_id` = `f`.`faculty_id`)) join `af25andrb1_CollegeDBV1`.`Courses` `c` on(`cs`.`course_id` = `c`.`course_id`)) join `af25andrb1_CollegeDBV1`.`Room_Schedule` `rs` on(`rs`.`section_id` = `cs`.`section_id`)) join `af25andrb1_CollegeDBV1`.`Room` `r` on(`r`.`room_number` = `rs`.`room_number`)) join `af25andrb1_CollegeDBV1`.`Building` `b` on(`b`.`building_id` = `r`.`building_id`)) join `af25andrb1_CollegeDBV1`.`Semester` `se` on(`se`.`semester_id` = `cs`.`semester_id`));

-- -----------------------------------------------------
-- View `af25andrb1_CollegeDBV1`.`current_student_emergency_contacts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `af25andrb1_CollegeDBV1`.`current_student_emergency_contacts`;
USE `af25andrb1_CollegeDBV1`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`af25andrb1`@`localhost` SQL SECURITY DEFINER VIEW `af25andrb1_CollegeDBV1`.`current_student_emergency_contacts` AS select concat(`p`.`first_name`,' ',`p`.`last_name`) AS `student_name`,`p`.`address` AS `home_address`,`ec`.`contact_name` AS `contact_name`,`ec`.`contact_phone_number` AS `contact_phone_number`,`ec`.`contact_address` AS `contact_address` from ((`af25andrb1_CollegeDBV1`.`People` `p` join `af25andrb1_CollegeDBV1`.`Students` `s` on(`s`.`people_id` = `p`.`people_id`)) join `af25andrb1_CollegeDBV1`.`emergency_contact` `ec` on(`ec`.`people_id` = `p`.`people_id`)) where `s`.`enrollment_status` = 'enrolled';

-- -----------------------------------------------------
-- View `af25andrb1_CollegeDBV1`.`faculty_offices`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `af25andrb1_CollegeDBV1`.`faculty_offices`;
USE `af25andrb1_CollegeDBV1`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`af25andrb1`@`localhost` SQL SECURITY DEFINER VIEW `af25andrb1_CollegeDBV1`.`faculty_offices` AS select concat(`p`.`first_name`,' ',`p`.`last_name`) AS `faculty_name`,`f`.`office_number` AS `office_number`,`b`.`building_name` AS `building_name` from (((`af25andrb1_CollegeDBV1`.`People` `p` join `af25andrb1_CollegeDBV1`.`Faculty` `f` on(`p`.`people_id` = `f`.`people_id`)) join `af25andrb1_CollegeDBV1`.`Room` `r` on(`r`.`room_number` = `f`.`office_number`)) join `af25andrb1_CollegeDBV1`.`Building` `b` on(`b`.`building_id` = `r`.`building_id`));

-- -----------------------------------------------------
-- View `af25andrb1_CollegeDBV1`.`grade_book`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `af25andrb1_CollegeDBV1`.`grade_book`;
USE `af25andrb1_CollegeDBV1`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`af25andrb1`@`localhost` SQL SECURITY DEFINER VIEW `af25andrb1_CollegeDBV1`.`grade_book` AS select concat(`p`.`first_name`,' ',`p`.`last_name`) AS `student_name`,`c`.`course_name` AS `course_name`,`cs`.`section_number` AS `section_number`,`e`.`grade` AS `grade` from ((((`af25andrb1_CollegeDBV1`.`People` `p` join `af25andrb1_CollegeDBV1`.`Students` `s` on(`p`.`people_id` = `s`.`people_id`)) join `af25andrb1_CollegeDBV1`.`Enrollment` `e` on(`e`.`student_id` = `s`.`student_id`)) join `af25andrb1_CollegeDBV1`.`Course_Section` `cs` on(`cs`.`section_id` = `e`.`enrollment_id`)) join `af25andrb1_CollegeDBV1`.`Courses` `c` on(`c`.`course_id` = `cs`.`course_id`));

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
