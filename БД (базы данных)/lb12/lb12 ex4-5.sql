--������� 4 
go
create procedure PAUDITORIUM_INSERT 
@a char(20), @n varchar(50), @c int = 0, @t char(10)
as declare @rc int = 1;

begin try
	insert into AUDITORIUM(AUDITORIUM,AUDITORIUM_NAME,AUDITORIUM_CAPACITY,AUDITORIUM_TYPE)
	values (@a,@n,@c,@t)
	return @rc;
end try
begin catch
	print '����� ������ :' + cast(error_number() as varchar(6));
	print '���������: ' + error_message();
	print '�������: ' + cast(error_severity() as varchar(6));
	print '�����: ' + cast(error_state() as varchar(8));
	print '����� ������: ' + cast(error_line() as varchar(8));
	if ERROR_PROCEDURE() is not null
		print '��� ���������: ' + error_procedure();
		return -1;
end catch
go
declare @rc int;
exec @rc = PAUDITORIUM_INSERT @a = '315-1',@n =  '415-1', @c =15, @t =  '��-�';
print '��� ������: ' + cast(@rc as varchar(5)) 


--������� 5
go

CREATE PROCEDURE SUBJECT_REPORT @p char(10) as declare @rd int = 0;
begin try 
	declare @sb char(20), @t char(300) = '';
	declare SbOnPl cursor for 
	select SUBJECT.SUBJECT from SUBJECT where SUBJECT.PULPIT = @p;
	if not exists(Select SUBJECT.SUBJECT from SUBJECT where SUBJECT.PULPIT = @p)
		raiserror('������',11,1);
		else
			open SbOnPl
			fetch SbOnPl into @sb;
			print '��������� ����������: ';
			while @@FETCH_STATUS = 0
			begin
			set @t = rtrim(@sb) + ',' + @t;
			set @rd += 1;
			fetch SbOnPl into @sb;
			end;
			print @t;
			close SbOnPl
			return @rd;
		end try 
		begin  catch
			print '������ � ����������'
			if ERROR_PROCEDURE() is null
				print '��� ���������: ' + error_procedure();
			return @rd;
			end catch;

			go
			declare @rd int;
			exec @rd = SUBJECT_REPORT @p = '����';
			print '���-�� ���������: ' + cast(@rd as nvarchar(5))

			Drop procedure SUBJECT_REPORT