use K_MyBase
SELECT *
From Orders Inner Join Products
ON Orders.ProductsID=Products.ProductsID
Where CustumerID In 
(Select NumberOfEmployees From Customer Where (Customer_Name Like '%i%'))