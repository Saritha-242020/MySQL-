-- Creating a database
create database trig;
use trig;

#1. Create a table named teachers with fields id, name, subject, experience and salary and insert 8 rows.
-- Creating tables
create table Teachers(
Teachher_ID int auto_increment primary key,
Name varchar(50),
Subject varchar(50),
Experience int,
Salary decimal(10,2)
);

insert into Teachers(Name, Subject, Experience, Salary)values
('Alice Johnson', 'Mathematics', 12, 55000),
('Bob Smith', 'English', 8, 48000),
('Carol Lee', 'Science', 5, 52000),
('David Brown', 'History', 15, 60000),
('Emily White', 'Geography', 3, 43000),
('Frank Black', 'Physics', 11, 58000),
('Grace Green', 'Chemistry', 7, 50000),
('Henry Adams', 'Biology', 2, 39000);

select * from Teachers;

#2. Create a before insert trigger named before_insert_teacher

delimiter $$
create trigger before_insert_teacher
before insert on Teachers
for each row
begin
if new.salary < 0 then
set message_text = 'Salary cannot be negative';
end if;
end;
delimiter ;

#3. Create an after insert trigger named after_insert_teacher
CREATE TABLE teacher_log (
    teacher_id INT,
    action TEXT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
delimiter $$
CREATE function log_teacher_insert()
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (NEW.id, 'INSERT', CURRENT_TIMESTAMP);
    RETURN NEW;
END;


CREATE TRIGGER after_insert_teacher
AFTER INSERT ON teachers
FOR EACH ROW
EXECUTE FUNCTION log_teacher_insert();
delimiter ;

#4. Create a before delete trigger 
CREATE TABLE teacher_log1 (
    teacher_id INT,
    action TEXT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE FUNCTION prevent_delete_experienced()
delimiter $$
BEGIN
    IF OLD.experience > 10 THEN
        RAISE EXCEPTION 'Cannot delete a teacher with more than 10 years of experience';
    END IF;
delimiter ;
delimiter $$
CREATE TRIGGER before_delete_teacher
BEFORE DELETE ON Teachers
FOR EACH ROW
EXECUTE FUNCTION prevent_delete_experienced();
delimiter ;

#5. Create an after delete trigger
CREATE TABLE teacher_log2 (
    teacher_id INT,
    action TEXT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE  FUNCTION log_teacher_delete()
delimiter $$
BEGIN
    INSERT INTO teacher_log2 (teacher_id, action, timestamp)
    VALUES (OLD.id, 'DELETE', CURRENT_TIMESTAMP);
    RETURN OLD;
END;

CREATE TRIGGER after_delete_teacher
AFTER DELETE ON teachers
FOR EACH ROW
EXECUTE FUNCTION log_teacher_delete();
delimiter ;
