-- Creating a database
create database OfficeManagers;
use OfficeManagers;
-- Creating table
create table Managers(
Manager_Id int auto_increment primary key,
First_Name varchar(50) not null,
Last_Name varchar(50) not null,
DOB date not null,
Age int check(Age>20),
Last_Update timestamp default current_timestamp,
Gender char(1) check(Gender in ('M','F')),
Department varchar(50) not null,
Salary decimal(10,2) not null
);

-- Inserting values to table
insert into Managers(First_Name,Last_Name,DOB,Age,Gender,Department,Salary)values
('Sunil','Bhaskar','1975-06-15',49,'M','Finance',200000),
('Kiran','Chand','1985-11-12',39,'M','IT',50000),
('Sarah','Connor','1978-04-17',46,'F','HR',50000),
('Michael','Smith','1990-07-25',34,'M','Operations',45000),
('Priya','Sharma','1988-01-15',36,'F','IT',75000),
('Robert','Brown','1982-03-18',42,'M','Marketing',100000),
('Sophia','Wilson','1995-09-12',29,'F','Finance',40000),
('David','Clark','1980-06-30',44,'M','Operations',30000),
('Emily','Taylor','1987-08-05',37,'F','HR',25000),
('Aaliya','Khan','1992-09-21',32,'F','Finance',28000);

-- Retrieve Manager Name aand DOB with Manager_Id=1
select First_Name,Last_Name,DOB
from Managers
where Manager_Id=1;

-- Annual income of all Managers
select Manager_Id,First_Name,Last_Name,Salary*12 as Annual_Income
from Managers;

-- Display all Managers except Aaliya
select * from Managers
where First_Name <> 'Aaliya';

-- Display details of Managers in IT department of salary greater than 25000
select * from Managers
where Department='IT' and Salary>25000;

-- Display details of Managers whose salary is between 35000 and 100000
select * from Managers
where Salary between 35000 and 100000;