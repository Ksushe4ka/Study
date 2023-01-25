use K_MyBase
select Products_Name, Price from Products
where Price >= all (select Price from Products
where Products_Name like '%c%')

select Products_Name, Price from Products
where Price >any (select Price from Products
where Products_Name like '%c%')