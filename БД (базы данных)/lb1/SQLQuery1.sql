SELECT ����_��������, ������������_������
FROM     Orders
WHERE  (����_�������� > CONVERT(DATETIME, '2022-08-22', 102))SELECT ����_�������
FROM     Orders
WHERE  (����_������� > 5 AND ����_������� <= 7)
SELECT ������������_������, ��������
FROM     Orders
WHERE  (������������_������ = '����� 1')
SELECT Custum.������������_�����, Orders.������������_������, Orders.����_��������
FROM     Custum INNER JOIN
                  Orders ON Custum.������������_����� = Orders.��������
WHERE  (Custum.������������_����� = 'Unchitel')
ORDER BY Orders.����_��������