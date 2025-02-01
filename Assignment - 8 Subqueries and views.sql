-- Creating a database
create database subqandview;
use subqandview;

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
(10, 'Daniel', 'Harris', 50000, 3.7, 7,'Germany');
select * from Persons;

#1. Number of persons in each Country
select Country_Name,count(First_Name) as Numberof_People from Persons
group by Country_Name;

#2. Number of persons in each Country from high to low
select Country_Name,count(First_Name) as Numberof_People from Persons
group by Country_Name
order by count(First_Name)
desc;

#3. average rating for Persons in respective countries if the average is greater than 3.0
select Country_Id, avg(Rating) as Avg_Rating from Persons
group by Country_ID
having avg(Rating) >3.0;

#4. Countries with the same rating as U.S.A
select count(Id) as Numberof_Countries from Country c
where id in(
select Country_id from Persons p
where c.id = p.Country_id
having avg(Rating)=(
select avg(Rating) from Persons where Country_Id=
(select ID from Country where Country_Name='USA')
)
);

#5. Countries with population greater than average population of all nations
select Country_Name,Population from Persons p
where population >(select avg(Population) from Persons);

-- Creating aa new database
create database Product;
use Product;

-- Creating a new table Customer
create table Customer(
Customer_Id int primary key,
First_Name varchar(15),
Last_Name varchar(15),
Email varchar(50),
Phone_no varchar(20),
Address varchar(50),
City varchar(50),
State varchar(50),
Zip_Code varchar(10),
Country varchar(50)
);

insert into Customer values
(1, 'John', 'Doe', 'john.doe@example.com', '123-456-7890', '123 Elm Street', 'New York', 'NY', '10001', 'USA'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '234-567-8901', '456 Oak Avenue', 'Los Angeles', 'CA', '90001', 'USA'),
(3, 'Michael', 'Johnson', 'michael.johnson@example.com', '345-678-9012', '789 Pine Road', 'Chicago', 'IL', '60601', 'USA'),
(4, 'Emily', 'Davis', 'emily.davis@example.com', '456-789-0123', '321 Maple Lane', 'Houston', 'TX', '77001', 'USA'),
(5, 'David', 'Brown', 'david.brown@example.com', '567-890-1234', '654 Cedar Drive', 'Miami', 'FL', '33101', 'USA');

#1. Creating a customer info view
create view Customer_info as
select concat(First_Name,' ',Last_Name) as Full_Name,Email from Customer;
select * from Customer_info;

#2. Creating a US customer view
create view US_Customer as
select * from Customer where Country='USA';
select * from US_Customer;

#3. Creating customer details view
create view Customer_Details as 
select concat(First_Name,' ',Last_Name) as Full_Name,Email,Phone_no,State from Customer;
select * from Customer_Details;

#4. update phone number of customers who lives in california
update Customer_Details
set Phone_no='695-487-1089'
where State='CA';
select * from Customer Details;

insert into Customer values
(6, 'Sarah', 'Wilson', 'sarah.wilson@example.com', '678-901-2345', '789 Redwood Blvd', 'San Francisco', 'CA', '94101', 'USA'),
(7, 'Olivia', 'Martinez', 'olivia.martinez@example.com', '789-012-3456', '852 Birch Street', 'San Diego', 'CA', '92101', 'USA'),
(8, 'James', 'Taylor', 'james.taylor@example.com', '890-123-4567', '963 Walnut Avenue', 'Dallas', 'TX', '75201', 'USA'),
(9, 'Sophia', 'Anderson', 'sophia.anderson@example.com', '901-234-5678', '147 Chestnut Lane', 'CA', 'WA', '98101', 'USA'),
(10, 'Liam', 'Thomas', 'liam.thomas@example.com', '012-345-6789', '258 Aspen Road', 'Boston', 'CA', '02101', 'USA'),
(11, 'Emma', 'White', 'emma.white@example.com', '123-456-7891', '369 Sycamore Drive', 'Denver', 'CA', '80201', 'USA');

#5. states with more than 5 customers
select State,count(*) as Customer_Count from Customer 
group by State
having Customer_Count>=5;

#6. Number of customers in each state
select State,count(*) as Number_of_Customers from Customer_Details
group by State;

#7. Return all columns from customer details
select * from Customer_Details
order by State;