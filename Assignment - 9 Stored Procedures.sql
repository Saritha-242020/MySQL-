-- creating a database
create database store;
use store;

-- creating tables
CREATE TABLE worker (
    worker_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary DECIMAL(10,2),
    joining_date DATE,
    department VARCHAR(50)
);

#1. Create a stored procedure that takes in IN parameters for all the columns
    in the Worker table and adds a new record to the table and then invokes the procedure call.
    
DELIMITER $$

CREATE PROCEDURE AddWorker (
    IN p_worker_id INT,
    IN p_first_name VARCHAR(50),
    IN p_last_name VARCHAR(50),
    IN p_salary DECIMAL(10,2),
    IN p_joining_date DATE,
    IN p_department VARCHAR(50)
)
BEGIN
    INSERT INTO worker (
        worker_id,
        first_name,
        last_name,
        salary,
        joining_date,
        department
    ) VALUES (
        p_worker_id,
        p_first_name,
        p_last_name,
        p_salary,
        p_joining_date,
        p_department
    );
END$$

DELIMITER ;
CALL AddWorker(
    101,'John','Doe', 55000.00,'2025-04-21','IT');

select * from worker;

#2. Write stored procedure takes in an IN parameter for WORKER_ID and an OUT parameter for SALARY. 
DELIMITER $$

CREATE PROCEDURE GetWorkerSalary (
    IN p_worker_id INT,
    OUT p_salary DECIMAL(10,2)
)
BEGIN
    SELECT salary INTO p_salary
    FROM worker
    WHERE worker_id = p_worker_id;
END$$

DELIMITER ;
-- Declare a variable to hold the output
SET @salary_output = 0;

-- Call the procedure
CALL GetWorkerSalary(101, @salary_output);

select @salary_output as Salary;

#3. Create a stored procedure that takes in IN parameters for WORKER_ID and DEPARTMENT. 

DELIMITER $$

CREATE PROCEDURE UpdateWorkerDepartment (
    IN p_worker_id INT,
    IN p_department VARCHAR(50)
)
BEGIN
    UPDATE worker
    SET department = p_department
    WHERE worker_id = p_worker_id;
END$$

DELIMITER ;
CALL UpdateWorkerDepartment(101, 'HR');

#4.  Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_workerCount. 

insert into worker values
( 102,'Bob','Samuel', 65000.00,'2025-04-10','Finance'),
( 103,'David','John', 70000.00,'2024-04-01','IT');
select * from worker;
DELIMITER $$

CREATE PROCEDURE GetWorkerCountByDepartment (
    IN p_department VARCHAR(50),
    OUT p_workerCount INT
)
BEGIN
    SELECT COUNT(*) INTO p_workerCount
    FROM worker
    WHERE department = p_department;
END$$

DELIMITER ;
-- Declare the output variable
SET @worker_count = 0;

-- Call the procedure
CALL GetWorkerCountByDepartment('IT', @worker_count);

-- Check the result
SELECT @worker_count AS WorkerCount;

#5. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_avgSalary. 
DELIMITER //

CREATE PROCEDURE GetAverageSalaryByDepartment (
    IN p_department VARCHAR(100),
    OUT p_avg_salary DECIMAL(10,2)
)
BEGIN
    SELECT AVG(salary)
    INTO p_avg_salary
    FROM worker
    WHERE department = p_department;
END //

DELIMITER ;

-- Declare a variable to store the result
SET @avg_salary = 0;

-- Call the procedure with a department name
CALL GetAverageSalaryByDepartment('Finance', @avg_salary);

SELECT @avg_salary AS average_salary;
