--Задание 1
declare @ANY nvarchar (20), @ALL nvarchar (300)='';
declare list cursor for select SUBJECT from SUBJECT where SUBJECT.PULPIT = 'ИСиТ';
  
open list 
fetch list into @ANY 
print 'Список дисциплин'
while @@FETCH_STATUS = 0
begin 
set @ALL = RTRIM(@ANY) + ',' + @ALL    
FETCH list into @ANY
end
print RTRIM(@ALL) + '- Исит'
CLOSE list


--Задание 2
go
declare linelocal cursor local for select SUBJECT from SUBJECT
declare @first nvarchar(10), @all nvarchar (200)= '';
open linelocal
fetch linelocal into @first
print ' ' + @first
go
declare @first nvarchar(10), @all nvarchar (200)= '';
fetch linelocal into @first
print '2 ' + @first
go
DECLARE globaly CURSOR GLOBAL FOR SELECT SUBJECT FROM SUBJECT
DECLARE @SUB1 NVARCHAR(20);
OPEN globaly;
FETCH globaly INTO @SUB1;
PRINT RTRIM(@SUB1);
GO
DECLARE @SUB2 NVARCHAR(20);
FETCH globaly INTO @SUB2;
PRINT RTRIM(@SUB2);
GO
DECLARE @SUB3 NVARCHAR(30);
FETCH globaly INTO @SUB3;
PRINT RTRIM(@SUB3);
CLOSE globaly;

DEALLOCATE GLOB; 
