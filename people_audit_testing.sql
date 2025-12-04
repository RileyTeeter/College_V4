INSERT INTO People (
    first_name,
    last_name,
    phone_number,
    address
) VALUES (
    'John',
    'Smith',
    '555-555-1234',
    '123 College Ave, Wayne, NE'
);

SELECT * from people_audit_table;


UPDATE People
SET first_name = 'a'
WHERE people_id = 1;


SELECT * from people_audit_table;

DELETE FROM People -- fails as the people table is the primary key for a lot of things but the trigger should in theory work if i could actually delete a person
WHERE first_name = 'Andrew';


SELECT * from people_audit_table;
