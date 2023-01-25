SELECT Дата_поставки, Наименование_товара
FROM     Orders
WHERE  (Дата_поставки > CONVERT(DATETIME, '2022-08-22', 102))SELECT Цена_продажи
FROM     Orders
WHERE  (Цена_продажи > 5 AND Цена_продажи <= 7)
SELECT Наименование_товара, Заказчик
FROM     Orders
WHERE  (Наименование_товара = 'книга 1')
SELECT Custum.Наименование_фирмы, Orders.Наименование_товара, Orders.Дата_поставки
FROM     Custum INNER JOIN
                  Orders ON Custum.Наименование_фирмы = Orders.Заказчик
WHERE  (Custum.Наименование_фирмы = 'Unchitel')
ORDER BY Orders.Дата_поставки