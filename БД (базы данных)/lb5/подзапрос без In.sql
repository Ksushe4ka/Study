use K_MyBase
SELECT *
From Orders, Products
Where Orders.ProductsID=Products.ProductsID
 and CustumerID In 
(Select NumberOfEmployees From Customer Where (Customer_Name Like '%i%'))