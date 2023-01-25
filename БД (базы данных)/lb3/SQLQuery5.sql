use K_MyBase;
CREATE table Customer ( 
CustomerID int primary key not null, 
Customer_Name nvarchar(50) not null, 
NumberOfEmployees int not null );

CREATE table Products ( 
ProductsID int primary key not null,
Products_Name nvarchar(50) not null,
Price real not null);

CREATE table Order_ (
OrderID int primary key not null,
CustomerID int foreign key references Customer(CustomerID),
ProductsID int foreign key references Products(ProductsID),
Delivery_Date date,
Sale_Price real not null );
