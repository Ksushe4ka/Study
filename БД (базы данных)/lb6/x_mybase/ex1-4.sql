--Задание 1
select min(Price) [мин.цена], max(Price) [макс.цена], count(*) [кол.товаров], sum(Price) [общ.сумма товаров]
from Products

--Задание 2
select Products_Name, min(Price) [мин.цена], max(Price) [макс.цена], count(*) [кол.заказ.товаров], sum(Price) [общ.сумма товаров]
from Products inner join Orders on Products.ProductsID=Orders.ProductsID 
group by Products_Name

--Задание 3
select * 
from (select case when Price between 1 and 30 then 'price <= 30'
	when Price between 30 and 40 then 'price from 30 to 40'
	else 'price more than 40'
	end [price limits], count(*) [count]
from Products Group by Case
	when Price between 1 and 30 then 'price <= 30'
	when Price between 30 and 40 then 'price from 30 to 40'
	else 'price more than 40' 
	end)  as T
order by case [price limits]
	when 'price <= 30' then 3
	when 'price from 30 to 40' then 2
	when 'price more than 40' then 1
	else 0
end

--Задание 4
select Products.ProductsID, Orders.CustumerID, Products.Price, round(avg(cast(Orders.Sale_Price as float(4))),2) [average price]
from Products inner join Orders on Products.ProductsID = Orders.ProductsID inner join Customer on Orders.CustumerID = Customer.CustomerID
where Products.Price > 32
group by Products.ProductsID, Orders.CustumerID, Products.Price
