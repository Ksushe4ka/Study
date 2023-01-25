use K_MyBase

SELECT Products.Products_Name, Products.Price, Orders.Sale_Price
FROM Orders Inner Join Products
ON Orders.[ProductsID]= Products.ProductsID

SELECT Products.Products_Name, Products.Price, Orders.Sale_Price
FROM Orders, Products
Where Orders.[ProductsID]= Products.ProductsID

SELECT Products.ProductsID,Products.Products_Name, Products.Price,Orders.ProductsID, Orders.Sale_Price
FROM Orders Inner Join Products
ON Orders.[ProductsID]= Products.ProductsID and
Products.Products_Name Like '%n%'

SELECT Products.ProductsID,Products.Products_Name, Products.Price,Orders.ProductsID, Orders.Sale_Price
FROM Orders, Products
Where Orders.[ProductsID]= Products.ProductsID and
Products.Products_Name Like '%n%'