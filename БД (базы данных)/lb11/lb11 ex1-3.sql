--1
DROP table X;
DECLARE @c int, @flag char = 'c';
SET IMPLICIT_TRANSACTIONS ON
CREATE table X(K int);
INSERT X values (1),(2),(3);
set @c = (select count(*) from X);
print 'количество строк в таблице X: ' + cast( @c as varchar(2));
if @flag = 'c' commit
else rollback
SET IMPLICIT_TRANSACTIONS OFF

--2
BEGIN TRY
BEGIN TRAN
--insert AUDITORIUM values ('198-3', 'ЛБ-К', 15, '198-3');
COMMIT TRAN;
END TRY
BEGIN CATCH
print ':'+ case
when error_number() = 0
then 'Вместимость аудитории равна 0!'
else 'Неизвестная ошибка: '+ cast(error_number()  as varchar(5))+ error_message()
end;
if @@trancount > 0 rollback tran; -- Возвращает число инструкций BEGIN TRANSACTION, выполненных в текущем соединении.
end catch;
select * from AUDITORIUM


--3
DELETE AUDITORIUM where AUDITORIUM.AUDITORIUM='240-1';
DELETE AUDITORIUM where AUDITORIUM.AUDITORIUM='200-3a';
DELETE AUDITORIUM where AUDITORIUM.AUDITORIUM='245-4';
declare @point varchar(32);
BEGIN TRY
BEGIN TRAN
insert AUDITORIUM values('240-1','ЛК', 60, '240-1');
set @point='p1'; SAVE TRAN  @point; --контрольная точка
insert AUDITORIUM values('200-3a','ЛК', 90, '200-3a');
set @point='p2'; SAVE TRAN  @point; --контрольная точка
insert AUDITORIUM values('245-4','ЛБ-К', 15, '245-4');
COMMIT TRAN;
END TRY
BEGIN CATCH
print ':'+ case
when error_number() = 0
then 'Вместимость аудитории равна 0!'
else 'Неизвестная ошибка: '+ cast(error_number()  as varchar(5))+ error_message()
end;
if @@trancount > 0 rollback tran; -- Возвращает число инструкций BEGIN TRANSACTION, выполненных в текущем соединении.
begin
print 'Контрольная точка: '+@point;
rollback tran @point; --откат к контрольной точке
COMMIT TRAN --фиксация изменений, выполненых до контрльной точки
end;
end catch;
select * from AUDITORIUM


--4
-- A ---
	set transaction isolation level READ UNCOMMITTED 
	begin transaction 
	-------------------------- t1 ------------------
	select @@SPID, 'insert AUDITORIUM' 'результат', * from AUDITORIUM 
	                                                                where AUDITORIUM.AUDITORIUM_TYPE = 'ЛК-К';
	select @@SPID, 'update AUDITORIUM'  'результат',  AUDITORIUM_CAPACITY from AUDITORIUM   where AUDITORIUM_CAPACITY = '50';
	commit; 
	-------------------------- t2 -----------------
	--- B --	
	begin transaction 
	select @@SPID
	insert AUDITORIUM values ('104-3a','ЛК-К', 60, '104-3ф'); 
	update AUDITORIUM set AUDITORIUM_CAPACITY  =  '5' 
                           where  AUDITORIUM_CAPACITY = '1' 
	-------------------------- t1 --------------------
	-------------------------- t2 --------------------
	rollback;
	--Здесь системная функция @@SPID возвращает системный идентификатор процесса, назначенный сервером текущему подключению.


--5
-- A ---
	set transaction isolation level READ COMMITTED 
	begin transaction 
	-------------------------- t1 ------------------
	select @@SPID, 'insert AUDITORIUM' 'результат', * from AUDITORIUM 
	                                                                where AUDITORIUM.AUDITORIUM_TYPE = 'ЛК-К';
	select @@SPID, 'update AUDITORIUM'  'результат',  AUDITORIUM_CAPACITY from AUDITORIUM   where AUDITORIUM_CAPACITY = '50';
	commit; 
	-------------------------- t2 -----------------
	--- B --	
	begin transaction 
	select @@SPID
	insert AUDITORIUM values ('101-3a','ЛК-К', 60, '101-3ф'); 
	update AUDITORIUM set AUDITORIUM_CAPACITY  =  '5' 
                           where  AUDITORIUM_CAPACITY = '1' 
	-------------------------- t1 --------------------
	-------------------------- t2 --------------------
	rollback;
	--Здесь системная функция @@SPID возвращает системный идентификатор процесса, назначенный сервером текущему подключению.

--6
-- A ---
	set transaction isolation level REPEATABLE READ
	begin transaction 
	-------------------------- t1 ------------------
	select @@SPID, 'insert AUDITORIUM' 'результат', * from AUDITORIUM 
	                                                                where AUDITORIUM.AUDITORIUM_TYPE = 'ЛК-К';
	select @@SPID, 'update AUDITORIUM'  'результат',  AUDITORIUM_CAPACITY from AUDITORIUM   where AUDITORIUM_CAPACITY = '50';
	commit; 
	-------------------------- t2 -----------------
	--- B --	
	begin transaction 
	select @@SPID
	insert AUDITORIUM values ('101-3a','ЛК-К', 60, '101-3ф'); 
	update AUDITORIUM set AUDITORIUM_CAPACITY  =  '5' 
                           where  AUDITORIUM_CAPACITY = '1' 
	-------------------------- t1 --------------------
	-------------------------- t2 --------------------
	rollback;
	--Здесь системная функция @@SPID возвращает системный идентификатор процесса, назначенный сервером текущему подключению.



--7
set transaction isolation level SERIALIZABLE 
	begin transaction 
	-------------------------- t1 ------------------
	select @@SPID, 'insert AUDITORIUM' 'результат', * from AUDITORIUM 
	                                                                where AUDITORIUM.AUDITORIUM_TYPE = 'ЛК-К';
	select @@SPID, 'update AUDITORIUM'  'результат',  AUDITORIUM_CAPACITY from AUDITORIUM   where AUDITORIUM_CAPACITY = '50';
	commit; 
	-------------------------- t2 -----------------
	--- B --	
	begin transaction 
	select @@SPID
	insert AUDITORIUM values ('101-3a','ЛК-К', 60, '101-3'); 
	update AUDITORIUM set AUDITORIUM_CAPACITY  =  '5'  where  AUDITORIUM_CAPACITY = '1' 
	-------------------------- t1 --------------------
	-------------------------- t2 --------------------
	rollback;

--8
BEGIN TRAN --внешняя транзакция
insert AUDITORIUM values ('107-3a','ЛК-К', 60, '107-3a'); 
BEGIN TRAN --внутренняя транзакция
insert AUDITORIUM values ('109-3a','ЛБ-К', 15, '109-3a'); 
COMMIT; --внутренняя
if @@trancount > 0 rollback; --внешняя
select
(select count(*) from AUDITORIUM where AUDITORIUM_TYPE = 'ЛК-К')
(select count(*) from AUDITORIUM where AUDITORIUM_TYPE = 'ЛБ-К')       
