-- creating a database
create database Sales;
use Sales;
-- creating a table
create table Orders(
Order_Id int auto_increment primary key,
Customer_Name varchar(50) not null,
Product_Category varchar(50) not null,
Ordered_Item varchar(50) not null,
Contact_No varchar(15) unique);

-- adding a new column to the table
alter table Orders
add Order_Quantity int;

-- Renaming Orders Table
rename table Orders to Sales_Orders;
desc Sales_Orders;

-- Inserting values to table
insert into Sales_Orders (Customer_Name,Product_Category,Ordered_Item,Contact_No,Order_Quantity)values
('Aby','Electronics','Television','9123456789',1),
('Sonia','Cosmetics','FaceKit','87756321456',2),
('Rahul','Electronics','Smart Phone','5412369545',1),
('Tom','Electronics','Headphone','7458612345',1),
('Geetha','Electronics','Refrigerator','45213648845',1),
('Bob','Clothing','T-Shirt','652481233469',3),
('Alka','Electronics','Laptop','123468653',1),
('Charlie','Furniture','Chair','95487562331',2),
('Thomas','Books','Fiction Novel','884455221365',1),
('Diana','Clothing','Jacket','99543216055',1);

select * from Sales_Orders;

-- Retrieve Customer_Name and Ordered_Item from table

Select Customer_Name,Ordered_Item from Sales_Orders; 

-- Updating Product Name of a row

update Sales_Orders
set Ordered_Item='Story book'
where Order_Id=9;

-- Deleting table from database

Drop table Sales_Orders;

