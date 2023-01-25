use K10_MyBase;
UPDATE Заказы set Потраченная_сумма = Потраченная_сумма+15 Where Номер_чека = 9876;
UPDATE Заказчик set Название_отдела = 'ficus' Where Номер_отдела = 1;

SELECT * From Заказы;
SELECT * From Заказчик;
