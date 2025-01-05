-- Creating database
create database aggregatefunctionsdb;
use aggregatefunctionsdb;

-- Creating tables

# Table Country
create table Country(
ID int primary key,
Country_Name varchar(100),
Population int,
Area float
);

# Table Persons
create table Persons(
Id int primary key,
Fname varchar(50),
Lname varchar(50),
Population int,
Rating float,
Country_Id int,
Country_Name varchar(100),
foreign key (Country_Id)references Country(ID)
);

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
INSERT INTO Persons VALUES (10, 'Daniel', 'Harris', 50000, 3.7, 7, NULL);

#1.  Print the first three characters of Country_name from the Country table
select left(Country_Name,3) as Shortname from Country;

#2. Concatenate first name and last name from Persons table
select concat(Fname,' ',Lname) as Name from Persons;

#3. Count the number of unique country names from Persons table
select count(distinct Country_Name) as Countof_UniqueCountries from Persons;

#4. Print the maximum population from the Country table
select max(Population) as Maximum_Population from Country;

#5. Print the minimum population from the Persons table
select min(Population) as Minimum_Population from Persons;

#6. Insert 2 new rows with NULL Lname into the Persons table
insert into Persons values (11, 'Mark', NULL, 70000, 4.3, 8, 'Brazil');
insert into Persons values (12, 'Anna', NULL, 55000, 4.6, 9, 'Japan');
select count(Lname) as Countof_Lastname from Persons;

#7. Find the number of rows in the Persons table
select count(*) as Total_Rows from Persons;

#8. Show the population of the Country table for the first 3 rows
select Population from Country limit 3;

#9. Print 3 random rows of countries
select * from Country order by rand() limit 3;

#10. List all persons ordered by their rating in descending order
select * from Persons order by Rating desc;

#11. Find the total population for each country in the Persons table
select Country_Name,sum(Population) as Total_Population from Persons group by Country_Name;

#12.  Find countries in the Persons table with a total population greater than 50,000
select Country_Name from Persons group by Country_Name having sum(Population)>50000;

#13. List the total number of persons and average rating for each country (more than 2 persons)
select Country_name, COUNT(*) as Total_Persons, avg(Rating) as Avg_Rating 
from Persons 
group by Country_name 
having COUNT(*) > 2
order by Avg_Rating asc;