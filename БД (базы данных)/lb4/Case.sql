use K_MyBase;
SELECT Products.Products_Name, Orders.Delivery_Date, 
Orders.Sale_Price,

Case
when (Orders.Sale_Price between 10 and 28) then 'цена < 28'
when (Orders.Sale_Price between 28 and 30) then 'цена от 28 до 30'
else 'цена > 30'
end [Пределы цен]

FROM Products Inner Join Orders
ON Orders.[ProductsID]=Products.ProductsID 

ORDER BY (Case
when (Orders.Sale_Price between 10 and 28) then 3
when (Orders.Sale_Price between 28 and 30) then 2
else 1
end)