--Задание 8 
SELECT ProductsID, sum(Sale_Price) TotalSum
FROM Orders WHERE ProductsID=3
Group BY ProductsID
INTERSECT
SELECT ProductsID, sum(Sale_Price) TotalSum
FROM Orders WHERE ProductsID=5
Group BY ProductsID

--Задание 9
SELECT ProductsID, sum(Sale_Price) TotalSum
FROM Orders WHERE ProductsID=3
Group BY ProductsID
EXCEPT
SELECT ProductsID, sum(Sale_Price) TotalSum
FROM Orders WHERE ProductsID=5
Group BY ProductsID

--Задание 10
SELECT p1.ProductsID, p1.Sale_Price,
(select COUNT(*) from Orders p2
WHERE p2.ProductsID = p1.ProductsID
and p2.Sale_Price = p1.Sale_Price) [Количество]
FROM Orders p1
GROUP BY p1.ProductsID, p1.Sale_Price
HAVING Sale_Price <25 or Sale_Price >30