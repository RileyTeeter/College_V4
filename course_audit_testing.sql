-- TEST INSERT TRIGGER
INSERT INTO Courses (course_name, course_description)
VALUES ('Test Course', 'This is a test insert.');

SELECT *
FROM Courses_Audit
WHERE course_name = 'Test Course'
  AND audit_action = 'INSERT';

-- TEST UPDATE TRIGGER
UPDATE Courses
SET course_description = 'Updated description.'
WHERE course_name = 'Test Course';

SELECT *
FROM Courses_Audit
WHERE course_name = 'Test Course'
  AND audit_action = 'UPDATE';
  
-- TEST DELETE TRIGGER
DELETE FROM Courses
WHERE course_name = 'Test Course';

SELECT *
FROM Courses_Audit
WHERE course_name = 'Test Course'
  AND audit_action = 'DELETE';

-- VIEW EVERYTHING LOGGED
SELECT *
FROM Courses_Audit
ORDER BY audit_id DESC;


