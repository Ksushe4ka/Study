--Задание 5-6
SELECT ProductsID, Sale_Price, SUM(Sale_Price)
TotalSum
FROM Orders
WHERE ProductsID IN (3, 5)
GROUP BY ProductsID, Sale_Price;

SELECT ProductsID, Sale_Price, SUM(Sale_Price)
TotalSum
FROM Orders
WHERE ProductsID IN (3, 5)
GROUP BY ROLLUP (ProductsID, Sale_Price)

SELECT ProductsID, Sale_Price, SUM(Sale_Price)
TotalSum
FROM Orders
WHERE ProductsID IN (3, 5)
GROUP BY CUBE (ProductsID, Sale_Price)

--Задание 7
SELECT ProductsID, sum(Sale_Price) TotalSum
FROM Orders WHERE ProductsID=3
Group BY ProductsID
UNION
SELECT ProductsID, sum(Sale_Price) TotalSum
FROM Orders WHERE ProductsID=5
Group BY ProductsID

SELECT ProductsID, sum(Sale_Price) TotalSum
FROM Orders WHERE ProductsID=3
Group BY ProductsID
UNION ALL
SELECT ProductsID, sum(Sale_Price) TotalSum
FROM Orders WHERE ProductsID=5
Group BY ProductsID