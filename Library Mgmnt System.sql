-- CREATING A DATABASE
create database Library;
use Library;
-- CREATING TABLES
create table Branch(
Branch_no int auto_increment primary key,
Manager_Id int,
Branch_address varchar(30),
Contact_no varchar(30)
);

create table Employee(
Emp_Id int auto_increment primary key,
Emp_name varchar(50),
Position varchar(50),
Salary decimal(10,2),
Branch_no int,
foreign key(Branch_no) references Branch(Branch_no)
);

create table Books(
Books_ISBN varchar(20) primary key,
Book_Title varchar(50),
Category varchar(50),
Rental_Price decimal(10, 2),
Status varchar(3), -- 'Yes' or 'No'
Author varchar(100),
Publisher varchar(100)
);

create table Customer(
Customer_Id int auto_increment primary key,
Customer_name varchar(30),
Customer_Address varchar(50),
Reg_date date
);

create table IssueStatus (
    Issue_Id int primary key,
    Issued_cust int,
    Issued_book_name varchar(255),
    Issue_date date,
    Isbn_book varchar(20),
    foreign key (Issued_cust) references Customer(Customer_Id),
    foreign key (Isbn_book) references Books(Books_ISBN)
);

create table ReturnStatus(
Return_Id int primary key,
Return_cust int,
Return_book_name varchar(30),
Return_date date,
Isbn_book2 varchar(20),
foreign key (Isbn_book2) references Books(Books_Isbn)
);

-- Displaying all the tables
-- Branch
insert into Branch (Branch_no, Manager_Id, Branch_address, Contact_no)
values
(1, 101, 'Connaught Place, Delhi', '9876543210'),
(2, 102, 'Park Street, Kolkata', '9831122334'),
(3, 103, 'Anna Nagar, Chennai', '9123456789'),
(4, 104, 'MG Road, Bangalore', '9900112233'),
(5, 105, 'Sector 17, Chandigarh', '9810011223');

select * from Branch;
-- Employee
insert into Employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
values
(101, 'Ravi Kumar', 'Manager', 65000, 1),
(102, 'Sita Sharma', 'Assistant', 40000, 1),
(103, 'Amit Roy', 'Manager', 70000, 2),
(104, 'Meena Jain', 'Clerk', 35000, 2),
(105, 'Rahul Das', 'Manager', 55000, 3),
(106, 'Priya Iyer', 'Manager', 60000, 4);

select * from Employee;
-- Books
insert into Books (Books_Isbn, Book_title, Category, Rental_Price, Status, Author, Publisher)
values
('ISBN001', 'History of India', 'History', 30.00, 'Yes', 'Bipin Chandra', 'Penguin'),
('ISBN002', 'Modern Physics', 'Science', 40.00, 'No', 'Resnick Halliday', 'Wiley'),
('ISBN003', 'The Great Gatsby', 'Fiction', 25.00, 'Yes', 'F. Scott Fitzgerald', 'Scribner'),
('ISBN004', 'Data Structures', 'Technology', 35.00, 'Yes', 'Seymour Lipschutz', 'McGraw-Hill'),
('ISBN005', 'World History', 'History', 28.00, 'No', 'Norman Lowe', 'Macmillan');

select * from Books;

-- Customer
insert into Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
values
(1, 'Anjali Mehta', 'Delhi', '2021-11-15'),
(2, 'Mohit Verma', 'Kolkata', '2022-03-10'),
(3, 'Kiran Rao', 'Chennai', '2020-12-20'),
(4, 'Nisha Patel', 'Mumbai', '2023-06-05'),
(5, 'Arjun Kapoor', 'Delhi', '2023-06-15');

select * from Customer;

-- IssueStatus
insert into IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
values
(1, 1, 'History of India', '2023-06-10', 'ISBN001'),
(2, 2, 'Data Structures', '2023-06-25', 'ISBN004'),
(3, 3, 'Modern Physics', '2023-06-01', 'ISBN002'),
(4, 4, 'The Great Gatsby', '2023-06-20', 'ISBN003'),
(5, 5, 'World History', '2023-06-28', 'ISBN005');

select * from IssueStatus;

-- ReturnStatus
insert into ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
values
(1, 1, 'History of India', '2023-07-01', 'ISBN001'),
(2, 2, 'Data Structures', '2023-07-10', 'ISBN004'),
(3, 3, 'Modern Physics', '2023-07-12', 'ISBN002'),
(4, 4, 'The Great Gatsby', '2023-07-20', 'ISBN003'),
(5, 5, 'World History', '2023-07-25', 'ISBN005');

select * from ReturnStatus;

#1. Retrieve the book title, category, and rental price of all available books.
select Book_title, Category, Rental_Price
from Books
where Status = 'Yes';

#2. List the employee names and their respective salaries in descending order of salary. 
select Emp_name, Salary
from Employee
order by Salary desc;

#3. Retrieve the book titles and the corresponding customers who have issued those books. 
select I.Issued_book_name, C.Customer_name
from IssueStatus I
join Customer C on I.Issued_cust = C.Customer_Id;

#4. Display the total count of books in each category.
select Category, count(*) as Total_Books
from Books
group by Category;

# 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
select Emp_name,Position from Employee
where Salary>50000;

#6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
select Customer_name
from Customer
where Reg_date < '2022-01-01'
and Customer_Id not in (select Issued_cust from IssueStatus);

#7. Display the branch numbers and the total count of employees in each branch.
select Branch_no, count(*) as Employee_Count
from Employee
group by Branch_no;

#8. Display the names of customers who have issued books in the month of June 2023. 
select distinct C.Customer_name
from Customer C
join IssueStatus I on C.Customer_Id = I.Issued_cust
where month(I.Issue_date) = 6 and year(I.Issue_date) = 2023;

#9. Retrieve book_title from book table containing history.
select Book_title
from Books
where Book_title like '%history%';

#10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees 
select Branch_no, count(*) as Employee_Count
from Employee
group by Branch_no
having count(*) > 5;

#11. Retrieve the names of employees who manage branches and their respective branch addresses.
select E.Emp_name, B.Branch_address
from Employee E
join Branch B on E.Emp_Id = B.Manager_Id;

#12. Display the names of customers who have issued books with a rental price higher than Rs. 25. 
select distinct C.Customer_name
from Customer C
join IssueStatus I on C.Customer_Id = I.Issued_cust
join Books B on I.Isbn_book = B.Books_ISBN
where B.Rental_Price > 25;









