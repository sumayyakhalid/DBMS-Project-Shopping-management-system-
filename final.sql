create database final

	--1 Categories
	CREATE TABLE [Categories](
	Cat_id INT NOT NULL identity(1,1) PRIMARY KEY,
	Cat_name VARCHAR(100) NOT NULL,
	Cat_Desc ntext null,
	);	
	--2 Customer
	CREATE TABLE Customer
	(
	Cust_id int NOT NULL identity(1,1) PRIMARY KEY,
	Cust_Name varchar(255),
	Address varchar(255),
	Phone varchar(255),
	 [Password] varchar(255),
	city varchar(255),
	gender varchar (50),
    member_ship int DEFAULT '0',
	);

	ALTER TABLE Customer
    drop column empid


	--3 ADMIN
	Create Table Admin
	(
	Admin_id int Not null identity(1,1) PRIMARY KEY,
	username varchar(225),
	Password varchar(225)
	)
		--4 Supplier
	CREATE TABLE [Suppliers](
	SupplierID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	SupplierName nvarchar(40) NOT NULL,
	Address nvarchar(60) NULL,
	Phone nvarchar(24) NULL,
	City varchar(225),
	Country varchar(225),
	);
		--5Shipping
	CREATE TABLE [Shipping](
	ShipperID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	cust_id int,
	city nvarchar(40) NOT NULL, 
	Phone nvarchar(24) NULL,
	FOREIGN KEY (cust_id) REFERENCES Customer(cust_id),
	);
		--6[Order]
	CREATE TABLE [Order]
	(
	Order_id int NOT NULL identity(1,1) primary key,
	Order_Desc varchar(255),
	Cust_Name varchar(255),
	Cust_id int not null,
	ShipperID int  not null,
	Product_id int,
	date varchar(255),
	FOREIGN KEY (Product_id) REFERENCES Products(Product_id),
	  FOREIGN KEY (ShipperID) REFERENCES [Shipping](ShipperID),
	  FOREIGN KEY (Cust_id) REFERENCES Customer(Cust_id),
	 -- FOREIGN KEY (Product_id) REFERENCES Products(Product_id),
	);
	
		--7product
	CREATE TABLE Products(
	Product_id INT NOT NULL identity(1,1) PRIMARY KEY,
	Cat_id INT NOT NULL,
	Cat_name varchar(225),
	Pr_name VARCHAR(150) NOT NULL,
	Pr_description TEXT NOT NULL,
	Price Int NOT NULL,
	Supplier_id Int NOT NULL,
	Stock int not null,
	FOREIGN KEY (Cat_id) REFERENCES [Categories](Cat_id),
	FOREIGN KEY (Supplier_id) REFERENCES [Suppliers](SupplierID),
	);
	
	
	
	--8 Order Details]
	CREATE TABLE [Order Details]
	(
	[OrderID] int,
	[ProductID] int NOT NULL,
	[UnitPrice] money NOT NULL,
	[Quantity] smallint NOT NULL	
	FOREIGN KEY ([OrderID]) REFERENCES [Order](Order_id),
	);

	--9 Employees
	CREATE TABLE [Employees](
	EmployeeID int IDENTITY(1,1) NOT NULL PRIMARY KEY ,
	Name nvarchar(10) NOT NULL,
	Job_Status nvarchar(30) NULL,
	HireDate nvarchar(50) NULL,
	Address nvarchar(60) NULL,
	Contact nvarchar(15) NULL,
	
	);
	-- 10 Salary
	CREATE TABLE Salary(
	Sal_Id int not null identity(1,1) primary key,
	Amount int NOT NULL, 
	Employee_Name  varchar NOT NULL, 
	EmployeeID int not null,
	FOREIGN KEY (EmployeeID) REFERENCES [Employees](EmployeeID),
	);
	--11 Attendance
	Create Table Attendance
	(
	 Attendance_Id int  not null identity(1,1) primary key,
	 Absent int DEFAULT '0',
	 Month varchar(225),
	 Reason varchar(225),
	 Absent_Date nvarchar(30) not  null,
	 EmployeeID int not null,
	 FOREIGN KEY (EmployeeID) REFERENCES [Employees](EmployeeID),
	);

	--12 Investment
	Create Table Investment
	(
	  Invester_id int  not null identity(1,1) primary key,
	  Invester_name varchar(225),
	  Invest_amount int not null,
	  Product_name varchar(225) not null,
	  Product_id int not null,
	  FOREIGN KEY (Product_id) REFERENCES Products(Product_id),

	);

	--13 Expenses
	Create Table Expenses
	(
	  Electricity_bill int not null,
	  Rant int not null,
	  Maintainance int not null,
	  Date  nvarchar(30)  not null,
	  Expenses_id int not null  identity(1,1) primary key,
	  Admin_id INT NOT NULL,
	  FOREIGN KEY (Admin_id) REFERENCES Admin(Admin_id),
	);
	--14 Discount
	Create Table Discount
	(
	Discount_id int not null identity(1,1) primary key,
	Customer_id int not null,
	FOREIGN KEY (Customer_id) REFERENCES Customer(Cust_id ),
	Discount_percent int,
	);

	CREATE PROCEDURE selectall
	AS
	SELECT * FROM Employees
	GO;
	exec selectall

	CREATE PROCEDURE [insert]  
	@Name nvarchar(10),@Job_Status nvarchar(30),
	@HireDate nvarchar(50),@Address nvarchar(60),@Contact nvarchar(15)
	AS
	Insert into  Employees(Name, Job_Status, HireDate,Address,Contact) 
	values(@Name,@Job_Status,@HireDate,@Address,@Contact)
	GO
	exec [insert] 'adil','ad','Saturday, June 26, 2021','123','13123'