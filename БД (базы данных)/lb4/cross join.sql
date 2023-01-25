use K_MyBase;
SELECT Products.Products_Name, Products.Price, Orders.Sale_Price
FROM Orders Cross Join Products
Where Orders.[ProductsID]=Products.ProductsID 