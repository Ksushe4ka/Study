use K_MyBase
SELECT *
From Orders Inner Join Products
On Orders.ProductsID=Products.ProductsID Inner Join Customer
On Orders.CustumerID=Customer.CustomerID
Where (Customer_Name Like '%i%')
