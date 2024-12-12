-- Creating database
create database School;
use School;
-- Creating Table
create table Student(
Roll_no  int auto_increment primary key,
First_Name varchar(50) not null,
Last_Name varchar(50) not null,
Marks float,
Grade char(1) not null);


-- Step 3: Insert data into the Student table
insert into Student (First_Name,Last_Name,Marks,Grade)values
('Alice','Christy', 85.5, 'A'),
('Bob','Manuel', 76.0, 'B'),
('Charlie','Chapin',90.0, 'A'),
('Diana','Vargheese', 65.5, 'C');

-- Step 4: Use the SELECT command to display the Student table
select * from Student;
-- Step 5: Add a column named Contact to the Student table
alter table Student
add Contact varchar(15);

-- Step 6: Remove the Grade column from the STUDENT table
alter table student
drop column Grade;

-- Step 7: Rename the STUDENT table to CLASSTEN
ALTER TABLE STUDENT
RENAME TO CLASSTEN;

-- Step 8: Delete all rows from the CLASSTEN table
TRUNCATE TABLE CLASSTEN;

-- Step 9: Remove the CLASSTEN table from the database
DROP TABLE CLASSTEN;

desc Student;