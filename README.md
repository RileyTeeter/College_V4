# 🎓 College Database Management System (CollegeDBV4)

## 📘 Description
The **College Database Management System (CollegeDBV3)** is a MySQL-based relational database designed to support a college’s academic and administrative operations.  
It stores and organizes information about students, faculty, administrators, courses, rooms, semesters, and enrollment data — allowing for efficient management of people, schedules, and academic records.

This schema supports:
- Student enrollment and dormitory management  
- Faculty and administrative staff tracking  
- Course and section scheduling  
- Room assignments and building organization  
- Secure auditing and data integrity

---

## 📑 Table of Contents
1. [Description](#description)  
2. [Database Overview](#database-overview)  
3. [Tables and Descriptions](#tables-and-descriptions)    
4. [Authors](#authors)

---

## 🧩 Database Overview
**Schema Name:** `af25andrb1_CollegeDBV1`  
**Created Using:** MySQL Workbench
**Entities:** 12 Tables  
**Purpose:** A centralized database of a college and everything one might contain.

---

## 🧱 Tables and Descriptions

| Table Name | Description |
|-------------|-------------|
| **People** | Core table storing personal details (name, email, phone, address) for all individuals in the system (students, faculty, and admin). |
| **Admin** | Represents administrative users, each linked to a person record for identity management. |
| **Faculty** | Stores details about teaching staff, including office location and department assignment. |
| **Students** | Contains student-specific information such as dorm assignment, admission and graduation dates, and enrollment status. |
| **Courses** | Holds catalog information about courses offered by the college, including names and descriptions. |
| **Semester** | Defines academic terms (e.g., Fall 2025, Spring 2026) with type and year attributes. |
| **Course_Section** | Links courses, semesters, and faculty to represent individual course offerings. |
| **Enrollment** | Tracks which students are enrolled in specific course sections and records their final grades. |
| **Room** | Represents physical classroom spaces, including capacity and associated building. |
| **Room_Schedule** | Assigns course sections to specific rooms for scheduling purposes. |
| **Building** | Contains data about campus buildings and their abbreviations. |
| **Dorm_room** | Tracks dormitory rooms, occupancy status, and links to building information. |
| **emergency contact** | Stores emergency contact details linked to people (students or staff). |

---

## 👀Views

| View Name | Description |
|-------------|-------------|
| **Course Catalog** | Shows the courses and the associated data with each section. |
| **Emergency Contacts** | Shows the currently enrolled students emergency contact information. |
| **Faculty Offices** | Shows the faculty name and office location. |
| **Grade Book** | Shows the current grades for students and which class that grade was given. |
| **Course Section Location** | Shows the courses and Location. |
| **Faculty Courses** | Shows the Course section with the faculties office information. |
| **Student Dorms** | Shows the students and where their dorm room is. |
| **Students Enrolled** | Shows the students and the courses they are enrolled in if they haven't graduated. |

---

## 🛠️Stored Procedures
| Procedure Name | Description |
|----------|----------------|
| **set_grad_status** | This procedure updates a student's enrollment status to 'Alumni' once graduated. It, additionally, changes their projected graduation date to the date their status was updated. |
| **assign_dorm_room** | This procedure assigns a dorm room to a student, only if they have no dorm room currently assigned to them. |
| **add_bill**| Adds a bill to a student by taking in the student name and bill amount and inserting a record into the bill table with the require information |
| **pay_bill**| Allows an user to pay the bill by inputing the student information and bill information and updating the associated record |
---

## ⚙️Functions
| Function Name | Description |
|----------|----------------|
| **is_alumni** | This function checks the enrollment status of a student in the databse see if they have graduated. It returns a TINYINT value (0 = still enrolled, 1 = alumni) and is used in the set_grad_status procedure. |
| **dorm_room_capacity** | This function checks the available capacity of a dorm room. It subtracts the number of enrolled students assigned to a dorm from the dorm's limit, and is used in the assign_dorm_room procedure. |
| **get_email**| Function designed to get the email address of a single user |
| **get_student_id**| Function designed to get the student id given a first and last name |
| **get_email_list**| Function designed to get the entire mailing list of a given person type (admin, faculty or student) returns a json object because mariadb doesn't allow functions to return tables see line two of the function for how to use in a select statement |
---

## Triggers
| Trigger Name | Description |
|----------|----------------|
| people_audit_table_insert | adds the record to the audit table for the people table when an insert occurs on the people table |
| people_audit_table_update | adds the record to the audit table for the people table when an update occurs on the people table |
| people_audit_table_delete | adds the record to the audit table for the people table when an delete occurs on the people table |
|  |  |
|  |  |
|  |  |
|  |  |
---

## Events
| Event Name | Description |
|----------|----------------|
| people_audit_monthy_truncate | truncates the audit table monthly |
| | |
---




