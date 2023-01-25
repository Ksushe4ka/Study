use K10_MyBase;
SELECT distinct Номер_чека, Дата, Потраченная_сумма FROM Заказы 
Where Дата Between '2022-08-20' And '2022-10-02';

SELECT Название_отдела FROM Заказчик
Where Название_отдела Like 'f%'

SELECT Номер_чека, Дата, Потраченная_сумма FROM Заказы 
Where Потраченная_сумма In (90,120)