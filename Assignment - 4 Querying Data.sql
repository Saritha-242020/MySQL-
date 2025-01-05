-- Creating database
create database Population;
use Population;

-- Creating tables
create table Country(
ID int primary key auto_increment,
Country_Name varchar(100),
Population int,
Area float
);
desc Country;

create table Persons(
ID int auto_increment primary key,
First_Name varchar(50),
Last_Name varchar(50),
Population int,
Rating float,
Country_ID int,
Country_Name varchar(100),
foreign key (Country_ID)references Country(ID)
);

Alter table Persons 
rename column First_Name to Fname;
Alter table Persons 
rename column Last_Name to Lname;

desc Persons;

-- Insert data into Country table
INSERT INTO Country VALUES (1, 'USA', 331000000, 9833517);
INSERT INTO Country VALUES (2, 'Canada', 38000000, 9984670);
INSERT INTO Country VALUES (3, 'UK', 68000000, 243610);
INSERT INTO Country VALUES (4, 'India', 1393409038, 3287263);
INSERT INTO Country VALUES (5, 'Australia', 25687041, 7692024);
INSERT INTO Country VALUES (6, 'France', 65273511, 551695);
INSERT INTO Country VALUES (7, 'Germany', 83783942, 357022);
INSERT INTO Country VALUES (8, 'Brazil', 212559417, 8515767);
INSERT INTO Country VALUES (9, 'Japan', 126476461, 377975);
INSERT INTO Country VALUES (10, 'South Africa', 59308690, 1219090);

select * from Country;
-- Insert data into Persons table
INSERT INTO Persons VALUES (1, 'John', 'Doe', 100000, 4.7, 1, 'USA');
INSERT INTO Persons VALUES (2, 'Jane', 'Smith', 50000, 3.9, 2, 'Canada');
INSERT INTO Persons VALUES (3, 'Alice', 'Brown', 75000, 4.5, 3, 'UK');
INSERT INTO Persons VALUES (4, 'Bob', 'White', 200000, 4.8, 4, 'India');
INSERT INTO Persons VALUES (5, 'Charlie', 'Green', 150000, 3.6, 5, 'Australia');
INSERT INTO Persons VALUES (6, 'Emily', 'Clark', 120000, 4.2, 1, 'USA');
INSERT INTO Persons VALUES (7, 'David', 'Taylor', 80000, 4.0, 3, 'UK');
INSERT INTO Persons VALUES (8, 'Sophia', 'Lewis', 90000, 4.9, 2, 'Canada');
INSERT INTO Persons VALUES (9, 'Michael', 'Walker', 60000, 4.1, 6, 'France');
INSERT INTO Persons VALUES (10, 'Daniel', 'Harris', 50000, 3.7, 7,Null);

select * from Persons;

-- 1. List the distinct country names from the Persons table
select distinct Country_Name from Persons;

-- 2. Select first name and last name from the Person table with Aliases
select Fname as First_Name ,Lname as Last_Name from Persons;

-- 3. Find all persons with a rating greater than 4.0
select * from Persons where Rating>4.0;

-- 4. Find countries with popualation greater than 10 lakhs
select Country_Name from Country where Population >1000000;
select * from Country where Population >1000000;

-- 5.Find persons from U.S.A or rating greater than 4.5
select * from Persons where Country_Name= 'USA' or Rating>4.5;

-- 6.Find persons where country name is null
select * from Persons where Country_Name is Null;

-- 7.Find all persons from the countries USA, Canada and UK
select * from Persons where Country_Name in('USA', 'Canada','UK');

-- 8.Find all persons not from the countries India and Australia
select * from Persons where Country_Name not in ('India','Australia');

-- 9. Find all the countries with population between 5lakhs and 20lakhs
select * from Country where Population between 500000 and 2000000; 

-- 10. Find all countries who do not start with 'C'
select * from Country where Country_Name not like 'C%';