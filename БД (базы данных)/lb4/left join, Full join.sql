use K_MyBase;

SELECT isnull (Orders.ProductsID, '1111')[товар], Products.Price
FROM Products Left Outer Join Orders
ON Orders.[ProductsID]=Products.ProductsID 

SELECT isnull (Orders.ProductsID, '1111')[товар], Products.Price
FROM Orders Right Outer Join Products
ON Orders.[ProductsID]=Products.ProductsID 

SELECT * FROM Products at FULL Outer Join Orders aa
ON aa.ProductsID=at.ProductsID
ORDER BY aa.ProductsID, at.ProductsID

SELECT COUNT (*) FROM Products at FULL Outer Join Orders aa
ON aa.ProductsID=at.ProductsID
where OrderID is null