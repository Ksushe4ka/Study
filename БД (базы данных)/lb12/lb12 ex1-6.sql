--1
DROP PROCEDURE PSUBJECT
GO
CREATE PROCEDURE PSUBJECT
as
begin
	select SUBJECT[���], SUBJECT_NAME[������������ ��������], PULPIT [�������] from SUBJECT;
	declare @count1 int = @@rowcount
	return @count1
end

go
declare @countA1 int
exec @countA1 =PSUBJECT
Select @countA1 [���-�� �����]
GO
--2
alter procedure PSUBJECT @p varchar(20), @c int output
as begin
	select SUBJECT[���], SUBJECT_NAME[������������ ��������], PULPIT [�������] from SUBJECT where SUBJECT = @p
	set @c = @@ROWCOUNT
	declare @count1 int = (select count(*) from SUBJECT)
	return @count1
end
go

declare @count2 int, @c2 int
exec @count2 = PSUBJECT @p = '��', @c = @c2 output
Select @count2 [����� �����], @c2 [�������]
go
--3
DROP table #SUBJECT
CREATE table #SUBJECT
	(���_�������� varchar(20),
	��������_�������� varchar(100),
	������� varchar(20))
go
alter procedure PSUBJECT @p varchar(20)
as begin
	select * from SUBJECT where SUBJECT = @p
end
go
insert #SUBJECT exec PSUBJECT @p = '��'
insert #SUBJECT exec PSUBJECT @p = '����'
Select * from #SUBJECT
go
--4
DROP PROCEDURE PAUDITORIUM_INSERT
GO
CREATE PROCEDURE PAUDITORIUM_INSERT @a char(20), @n varchar(50), @c int = 0, @t char(10)
as begin
	begin try
		insert into AUDITORIUM (AUDITORIUM,AUDITORIUM_NAME,AUDITORIUM_CAPACITY,AUDITORIUM_TYPE)
			values (@a,@n,@c,@t)
		return 1
end try
begin catch              -- ��������� ������ 
		print '����� ������  : ' + cast(error_number() as varchar(6));
		print '���������     : ' + error_message();
		print '�������       : ' + cast(error_severity()  as varchar(6));
		print '�����         : ' + cast(error_state()     as varchar(8));
		print '����� ������  : ' + cast(error_line()      as varchar(8));
		if error_procedure() is not  null   
			print '��� ��������� : ' + error_procedure();
		return -1;
   end  catch; 
	declare @rc int;
	exec @rc = PAUDITORIUM_INSERT @a = '315-1',@n =  '415-1', @c =15, @t =  '��-�';
	print '��� ������: ' + cast(@rc as varchar(5))
end
go
--5
CREATE PROCEDURE SUBJECT_REPORT @p char(20)
as begin
	declare @sabjSave char (20), @sabjFull varchar(100) = '' , @count int = 0
	begin try
		declare SubjDouble cursor for
			select SUBJECT from SUBJECT where PULPIT = @p
		if not exists (select SUBJECT from SUBJECT where PULPIT = @p)
			raiserror('������',11,1);
		else open SubjDouble
		fetch SubjDouble into @sabjSave
		while @@FETCH_STATUS = 0
		begin
			set @sabjFull = rtrim(@sabjSave)+ ',' + @sabjFull 
			set @count = @count + 1
			fetch SubjDouble into @sabjSave
		end
		print @sabjFull
		close SubjDouble
		return @count
	end try
	begin catch
		print '������ � ����������' 
		if error_procedure() is not null   
			print '��� ��������� : ' + error_procedure();
		return @count
	end catch
end

go

declare @count int;  
exec @count = SUBJECT_REPORT @p ='����';
print @count
go
--6
DROP PROCEDURE PAUDITORIUM_INSERTX
GO
CREATE PROCEDURE PAUDITORIUM_INSERTX @a char(20), @n varchar(50), @c int = 0, @t char(10),  @tn varchar(50)
as begin 
	declare @rc int = 1;
	begin try
		set transaction isolation level serializable;          
		begin tran
		insert into AUDITORIUM_TYPE(AUDITORIUM_TYPE, AUDITORIUM_TYPENAME) values(@n, @tn);
		exec @rc = PAUDITORIUM_INSERT @a, @n, @c, @t;
		commit tran;
		return @rc;
	end try
	begin catch
		print '����� ������: ' + cast(error_number() as varchar(6));
		print '���������: ' + error_message();
		print '�������: ' + cast(error_severity() as varchar(6));
		print '�����: ' + cast(error_state() as varchar(8));
		print '����� ������: ' + cast(error_line() as varchar(8));
		if error_procedure() is not  null   
		print '��� ���������: ' + error_procedure(); 
		if @@trancount > 0 rollback tran ; 
		return -1;
	end catch;
end;
go

declare @k3 int;  
exec @k3 = PAUDITORIUM_INSERTX '622-3', @n = '��', @c = 85, @t = '622-3', @tn = '����. �����'; 
print '��� ������: ' + cast(@k3 as varchar(3));  

