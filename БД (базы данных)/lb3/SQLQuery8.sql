use K10_MyBase;

SELECT Название_товара, Описcание From Товары;

SELECT count(*) From Товары;

SELECT Потраченная_сумма [Дорогие заказы] FROM Заказы
Where Потраченная_сумма > 40;

SELECT Distinct Top(4) Номер_чека, Номер_товара, Потраченная_сумма FROM Заказы Order by Потраченная_сумма desc;
