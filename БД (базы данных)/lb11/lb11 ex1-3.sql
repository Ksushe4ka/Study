--1
DROP table X;
DECLARE @c int, @flag char = 'c';
SET IMPLICIT_TRANSACTIONS ON
CREATE table X(K int);
INSERT X values (1),(2),(3);
set @c = (select count(*) from X);
print '���������� ����� � ������� X: ' + cast( @c as varchar(2));
if @flag = 'c' commit
else rollback
SET IMPLICIT_TRANSACTIONS OFF

--2
BEGIN TRY
BEGIN TRAN
--insert AUDITORIUM values ('198-3', '��-�', 15, '198-3');
COMMIT TRAN;
END TRY
BEGIN CATCH
print ':'+ case
when error_number() = 0
then '����������� ��������� ����� 0!'
else '����������� ������: '+ cast(error_number()  as varchar(5))+ error_message()
end;
if @@trancount > 0 rollback tran; -- ���������� ����� ���������� BEGIN TRANSACTION, ����������� � ������� ����������.
end catch;
select * from AUDITORIUM


--3
DELETE AUDITORIUM where AUDITORIUM.AUDITORIUM='240-1';
DELETE AUDITORIUM where AUDITORIUM.AUDITORIUM='200-3a';
DELETE AUDITORIUM where AUDITORIUM.AUDITORIUM='245-4';
declare @point varchar(32);
BEGIN TRY
BEGIN TRAN
insert AUDITORIUM values('240-1','��', 60, '240-1');
set @point='p1'; SAVE TRAN  @point; --����������� �����
insert AUDITORIUM values('200-3a','��', 90, '200-3a');
set @point='p2'; SAVE TRAN  @point; --����������� �����
insert AUDITORIUM values('245-4','��-�', 15, '245-4');
COMMIT TRAN;
END TRY
BEGIN CATCH
print ':'+ case
when error_number() = 0
then '����������� ��������� ����� 0!'
else '����������� ������: '+ cast(error_number()  as varchar(5))+ error_message()
end;
if @@trancount > 0 rollback tran; -- ���������� ����� ���������� BEGIN TRANSACTION, ����������� � ������� ����������.
begin
print '����������� �����: '+@point;
rollback tran @point; --����� � ����������� �����
COMMIT TRAN --�������� ���������, ���������� �� ���������� �����
end;
end catch;
select * from AUDITORIUM


--4
-- A ---
	set transaction isolation level READ UNCOMMITTED 
	begin transaction 
	-------------------------- t1 ------------------
	select @@SPID, 'insert AUDITORIUM' '���������', * from AUDITORIUM 
	                                                                where AUDITORIUM.AUDITORIUM_TYPE = '��-�';
	select @@SPID, 'update AUDITORIUM'  '���������',  AUDITORIUM_CAPACITY from AUDITORIUM   where AUDITORIUM_CAPACITY = '50';
	commit; 
	-------------------------- t2 -----------------
	--- B --	
	begin transaction 
	select @@SPID
	insert AUDITORIUM values ('104-3a','��-�', 60, '104-3�'); 
	update AUDITORIUM set AUDITORIUM_CAPACITY  =  '5' 
                           where  AUDITORIUM_CAPACITY = '1' 
	-------------------------- t1 --------------------
	-------------------------- t2 --------------------
	rollback;
	--����� ��������� ������� @@SPID ���������� ��������� ������������� ��������, ����������� �������� �������� �����������.


--5
-- A ---
	set transaction isolation level READ COMMITTED 
	begin transaction 
	-------------------------- t1 ------------------
	select @@SPID, 'insert AUDITORIUM' '���������', * from AUDITORIUM 
	                                                                where AUDITORIUM.AUDITORIUM_TYPE = '��-�';
	select @@SPID, 'update AUDITORIUM'  '���������',  AUDITORIUM_CAPACITY from AUDITORIUM   where AUDITORIUM_CAPACITY = '50';
	commit; 
	-------------------------- t2 -----------------
	--- B --	
	begin transaction 
	select @@SPID
	insert AUDITORIUM values ('101-3a','��-�', 60, '101-3�'); 
	update AUDITORIUM set AUDITORIUM_CAPACITY  =  '5' 
                           where  AUDITORIUM_CAPACITY = '1' 
	-------------------------- t1 --------------------
	-------------------------- t2 --------------------
	rollback;
	--����� ��������� ������� @@SPID ���������� ��������� ������������� ��������, ����������� �������� �������� �����������.

--6
-- A ---
	set transaction isolation level REPEATABLE READ
	begin transaction 
	-------------------------- t1 ------------------
	select @@SPID, 'insert AUDITORIUM' '���������', * from AUDITORIUM 
	                                                                where AUDITORIUM.AUDITORIUM_TYPE = '��-�';
	select @@SPID, 'update AUDITORIUM'  '���������',  AUDITORIUM_CAPACITY from AUDITORIUM   where AUDITORIUM_CAPACITY = '50';
	commit; 
	-------------------------- t2 -----------------
	--- B --	
	begin transaction 
	select @@SPID
	insert AUDITORIUM values ('101-3a','��-�', 60, '101-3�'); 
	update AUDITORIUM set AUDITORIUM_CAPACITY  =  '5' 
                           where  AUDITORIUM_CAPACITY = '1' 
	-------------------------- t1 --------------------
	-------------------------- t2 --------------------
	rollback;
	--����� ��������� ������� @@SPID ���������� ��������� ������������� ��������, ����������� �������� �������� �����������.



--7
set transaction isolation level SERIALIZABLE 
	begin transaction 
	-------------------------- t1 ------------------
	select @@SPID, 'insert AUDITORIUM' '���������', * from AUDITORIUM 
	                                                                where AUDITORIUM.AUDITORIUM_TYPE = '��-�';
	select @@SPID, 'update AUDITORIUM'  '���������',  AUDITORIUM_CAPACITY from AUDITORIUM   where AUDITORIUM_CAPACITY = '50';
	commit; 
	-------------------------- t2 -----------------
	--- B --	
	begin transaction 
	select @@SPID
	insert AUDITORIUM values ('101-3a','��-�', 60, '101-3'); 
	update AUDITORIUM set AUDITORIUM_CAPACITY  =  '5'  where  AUDITORIUM_CAPACITY = '1' 
	-------------------------- t1 --------------------
	-------------------------- t2 --------------------
	rollback;

--8
BEGIN TRAN --������� ����������
insert AUDITORIUM values ('107-3a','��-�', 60, '107-3a'); 
BEGIN TRAN --���������� ����������
insert AUDITORIUM values ('109-3a','��-�', 15, '109-3a'); 
COMMIT; --����������
if @@trancount > 0 rollback; --�������
select
(select count(*) from AUDITORIUM where AUDITORIUM_TYPE = '��-�')
(select count(*) from AUDITORIUM where AUDITORIUM_TYPE = '��-�')       
