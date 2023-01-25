--Задание 1
--DROP VIEW [PRODUCTS_VIEW]
--go
--CREATE VIEW [PRODUCTS_VIEW] 
--	AS SELECT ProductsID [ProductsID], Price [Price], Products_Name [Products_Name] FROM Products
--go
--	SELECT * FROM [PRODUCTS_VIEW] ORDER BY [Products_Name] asc


--Задание 2
--CREATE VIEW [PRICE_COMPARISON]
--	AS SELECT zk.ProductsID [Product], tv.Price [Original price], zk.Sale_Price [Sale Price] 
--	FROM Orders zk join Products tv ON zk.ProductsID = tv.ProductsID;
--go
--	SELECT * FROM [PRICE_COMPARISON] 


--Задание 3
--CREATE VIEW [EXPENSIVE_ITEMS] (ID, Product, Price, Description)
--	AS SELECT ProductsID, Products_Name, Price, Product_Description FROM Products
--	WHERE Price>32;
--go
--	SELECT * FROM [EXPENSIVE_ITEMS]
--	INSERT [EXPENSIVE_ITEMS] values (4, 'begonia', 22, 'white');
--	INSERT [EXPENSIVE_ITEMS] values (6, 'rush', 47, 'brown');
--	DELETE Products WHERE Products.Price LIKE '40%';
--	UPDATE EXPENSIVE_ITEMS SET ID= 8, Product= 'bluebell', Price= 38, Description='white' WHERE ID= 5;
--	SELECT * FROM [EXPENSIVE_ITEMS]


--Задание 4
--CREATE VIEW [EXPENSIVE_ITEMS] (ID, Product, Price, Description)
--	AS SELECT ProductsID, Products_Name, Price, Product_Description FROM Products
--	WHERE Price>32;
--go
--	SELECT * FROM [EXPENSIVE_ITEMS]
--go
--ALTER VIEW [EXPENSIVE_ITEMS] (ID, Product, Price, Description)
--	AS SELECT ProductsID, Products_Name, Price, Product_Description FROM Products
--	WHERE Price>32 WITH CHECK OPTION;
--go
--	SELECT * FROM [EXPENSIVE_ITEMS]
--	INSERT [EXPENSIVE_ITEMS] values (4, 'daisy', 22, 'violet');
--	INSERT [EXPENSIVE_ITEMS] values (9, 'mimosa', 49, 'brown');
--	DELETE Products WHERE Products.Price LIKE '40%';
--	UPDATE EXPENSIVE_ITEMS SET ID= 8, Product= 'bluebell', Price= 38, Description='white' WHERE ID=7;
--	SELECT * FROM [EXPENSIVE_ITEMS]


--Задание 5
--CREATE VIEW [EXPENSIVE_ITEMS] (ID, Product, Price, Description)
--	AS SELECT TOP 3 ProductsID, Products_Name, Price, Product_Description FROM Products
--go
--	SELECT * FROM [EXPENSIVE_ITEMS] ORDER BY Product asc


--Задание 6
--ALTER VIEW [PRICE_COMPARISON] WITH SCHEMABINDING
--	AS SELECT zk.ProductsID [Product], tv.Price [Original price], zk.Sale_Price [Sale Price] 
--	FROM dbo.Orders zk join dbo.Products tv ON zk.ProductsID = tv.ProductsID;
--go
--	SELECT * FROM [PRICE_COMPARISON] 