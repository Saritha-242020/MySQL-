-- Creating database
create database JoinsandUnionsdb;
use JoinsandUnionsdb;

-- Creating tables
create table Country(
ID int primary key auto_increment,
Country_Name varchar(100),
Population int,
Area float
);

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

-- Insert data into Country table
INSERT INTO Country VALUES 
 (1, 'USA', 331000000, 9833517),
 (2, 'Canada', 38000000, 9984670),
 (3, 'UK', 68000000, 243610),
 (4, 'India', 1393409038, 3287263),
 (5, 'Australia', 25687041, 7692024),
 (6, 'France', 65273511, 551695),
 (7, 'Germany', 83783942, 357022),
 (8, 'Brazil', 212559417, 8515767),
 (9, 'Japan', 126476461, 377975),
 (10, 'South Africa', 59308690, 1219090);

select * from Country;
-- Insert data into Persons table
INSERT INTO Persons VALUES 
(1, 'John', 'Doe', 100000, 4.7, 1, 'USA'),
(2, 'Jane', 'Smith', 50000, 3.9, 2, 'Canada'),
(3, 'Alice', 'Brown', 75000, 4.5, 3, 'UK'),
(4, 'Bob', 'White', 200000, 4.8, 4, 'India'),
(5, 'Charlie', 'Green', 150000, 3.6, 5, 'Australia'),
(6, 'Emily', 'Clark', 120000, 4.2, 1, 'USA'),
(7, 'David', 'Taylor', 80000, 4.0, 3, 'UK'),
(8, 'Sophia', 'Lewis', 90000, 4.9, 2, 'Canada'),
(9, 'Michael', 'Walker', 60000, 4.1, 6, 'France'),
(10, 'Daniel', 'Harris', 50000, 3.7, 7,Null);

select * from Persons;

#1. Joins
-- Inner Join
select p.Id,p.First_Name,p.Last_Name,c.Country_Name,p.Rating
from Persons p
inner join Country c on p.Country_Id= c.ID;

-- Left Join
select p.Id,p.First_Name,p.Last_Name,c.Country_Name,p.Rating
from Persons p
left join Country c on p.Country_Id= c.ID;

-- Right Join
select p.Id,p.First_Name,p.Last_Name,c.Country_Name,p.Rating
from Persons p
right join Country c on p.Country_Id= c.ID;

#2. Distinct Country names from both tables
select distinct Country_Name from Country
union
select distinct c.Country_Name 
from Persons p
left join Country c on p.Country_ID=c.Id;

#3. All country names from both tables including duplicates
select Country_Name as Countries from Country
union all
select c.Country_Name as Countries from Persons p
left join Country c on p.Country_Id=c.Id;

#4. Rounding the ratings in the persons table
select *, Rating, round(Rating,0) as Approx_Rating 
from Persons;