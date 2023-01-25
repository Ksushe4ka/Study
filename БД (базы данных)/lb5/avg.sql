use K_MyBase
select top 1
(select avg(Sale_Price) from Orders
where ProductsID like '3' ) [lupine],
(select avg(Sale_Price) from Orders
where ProductsID like '5' ) [lavender]
from Orders