use K_MyBase
SELECT *
From Orders o
Where OrderID = (select top (1) OrderID from Orders oo
where oo.OrderID=o.OrderID
order by Sale_Price desc)