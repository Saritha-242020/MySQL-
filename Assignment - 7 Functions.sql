-- Creating a database
create database census;
use census;

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

#1. A new column DOB is added
alter table Persons add DOB date ;

-- Inserting values
insert into Country (ID,Country_Name,Population,Area)values
 (1,'India',1393409038, 3287263),
 (2, 'USA', 331000000, 9833517),
 (3, 'Canada', 38000000, 9984670),
 (4, 'UK', 68000000, 243610),
 (5, 'Australia', 25687041, 7692024),
 (6, 'France', 65273511, 551695),
 (7, 'Germany', 83783942, 357022),
 (8, 'Brazil', 212559417, 8515767),
 (9, 'Japan', 126476461, 377975),
 (10, 'South Africa', 59308690, 1219090);
 
 insert into Persons(ID,First_Name,Last_Name,Population,Rating,Country_ID,Country_Name,DOB) values
 (1, 'Bob', 'Daniel', 200000, 4.8, 1, 'India','1965-05-12'),
 (2, 'John', 'Doe', 100000, 4.7, 2, 'USA','1970-08-07'),
 (3, 'Jane', 'Smith', 50000, 3.9, 3, 'Canada','1975-11-10'),
 (4, 'Alice', 'Brown', 75000, 4.5, 4, 'UK','1991-12-14'),
 (5, 'Charlie', 'Green', 150000, 3.6, 5, 'Australia','1982-10-20'),
 (6, 'Emily', 'Clark', 120000, 4.2, 2, 'USA','1985-07-18'),
 (7, 'David', 'Taylor', 80000, 4.0, 4, 'UK','1976-01-25'),
 (8, 'Sophia', 'Lewis', 90000, 4.9, 3, 'Canada','1986-02-27'),
 (9, 'Michael', 'Walker', 60000, 4.1, 6, 'France','1958-03-30'),
 (10, 'Daniel', 'Harris', 50000, 3.7, 7,'Germany','1961-04-18');

select * from Persons;

#2. a user defined function to calculate age
DELIMITER $$
create function AgeofPeople(DOB date)
returns int
deterministic
no sql
begin
    declare age int;
    set age = year(current_date())- year(DOB);
    RETURN (age);
    end $$
    DELIMITER ;
    
select * from Persons;

#3. Find age of all persons
select First_Name, Last_Name, AgeofPeople(DOB) as Age from Persons;

#4. length of each country_name from the table Country
select Country_Name,length(Country_Name) as Length_of_Country_Name from Country;

#5. Extract first three characters of countryname from the table country
select left(Country_Name,3) as Short_Name from Country;

#6. All Countryname to uppercase and lowercase from the table country
-- Uppercase
select Country_Name, ucase(Country_Name) from Country; 

-- Lowercase
select Country_Name, lcase(Country_Name) from Country; 