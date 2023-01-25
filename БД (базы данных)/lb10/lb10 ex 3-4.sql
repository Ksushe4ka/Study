--Задание 3
DECLARE @tid nvarchar(20), @tnm nvarchar(50), @tgn nvarchar(10);
DECLARE Audit CURSOR LOCAL STATIC
for select AUDITORIUM.AUDITORIUM,AUDITORIUM.AUDITORIUM_NAME,AUDITORIUM.AUDITORIUM_CAPACITY
FROM AUDITORIUM;
OPEN Audit;
print 'Количество строк: ' + cast(@@CURSOR_ROWS as nvarchar(5));
UPDATE AUDITORIUM set AUDITORIUM_CAPACITY = 20 where AUDITORIUM = '206-1';
DELETE AUDITORIUM where AUDITORIUM = '301-1';
INSERT AUDITORIUM(AUDITORIUM, AUDITORIUM_NAME,AUDITORIUM_TYPE, AUDITORIUM_CAPACITY)
values ('215-3', '215-3','ЛК-К', 30);
FETCH Audit into @tid,@tnm,@tgn;
WHILE @@FETCH_STATUS = 0
begin 
print @tid + '' + @tnm + ' ' + @tgn;
fetch Audit into @tid,@tnm,@tgn;
end;
CLOSE Audit;
delete AUDITORIUM where AUDITORIUM = '215-3'
SELECT * FROM AUDITORIUM

DECLARE @tidd nvarchar(20), @tnmm nvarchar(50), @tgnn nvarchar(10);
DECLARE Audit CURSOR LOCAL DYNAMIC
for select AUDITORIUM.AUDITORIUM,AUDITORIUM.AUDITORIUM_NAME,AUDITORIUM.AUDITORIUM_CAPACITY
FROM AUDITORIUM where AUDITORIUM.AUDITORIUM_CAPACITY = 15;
OPEN Audit;
print 'Количество строк: ' + cast(@@CURSOR_ROWS as nvarchar(5));
UPDATE AUDITORIUM set AUDITORIUM_CAPACITY = 40 where AUDITORIUM = '206-1';
DELETE AUDITORIUM where AUDITORIUM = '301-1';
INSERT AUDITORIUM(AUDITORIUM, AUDITORIUM_NAME,AUDITORIUM_TYPE, AUDITORIUM_CAPACITY)
values ('205-3', '205-3','ЛК-К', 30);
FETCH Audit into @tidd,@tnmm,@tgnn;
WHILE @@FETCH_STATUS = 0
begin 
print @tidd + '' + @tnmm + ' ' + @tgnn;
fetch Audit into @tidd,@tnmm,@tgnn;
end;
CLOSE Audit;


--Задание 4
DECLARE @tc nvarchar(20),@cp int ;
DECLARE AUDITOR cursor local dynamic scroll
for select row_number() over (order by AUDITORIUM_NAME),AUDITORIUM.AUDITORIUM_CAPACITY FROM AUDITORIUM   --row_number озвращает порядковый номер строки в разделе результирующего набора, начиная с 1 для первой строки в каждом разделе.
OPEN AUDITOR;
FETCH LAST from AUDITOR into @tc,@cp;
print 'последняя строка: ' + cast(@cp as nvarchar(20))+ '   ' + rtrim (@tc);
FETCH first from AUDITOR into @tc,@cp;
print 'первая строка: ' + cast(@cp as nvarchar(20))+ '   ' + rtrim (@tc);
FETCH absolute 4 from AUDITOR into @tc,@cp;
FETCH NEXT from AUDITOR into @tc,@cp;
print 'Следующая строка: ' + cast(@cp as nvarchar(20))+ '   ' + rtrim (@tc);
FETCH absolute 4 from AUDITOR into @tc,@cp;
print '4 строка от начала: ' + cast(@cp as nvarchar(20))+ '   ' + rtrim (@tc);
CLOSE AUDITOR;
