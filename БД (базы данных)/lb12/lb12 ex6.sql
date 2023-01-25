--������� 6
go
CREATE PROCEDURE PAUDITORIUM_INSERTX @tn varchar(50), @a char(20),@c int = 0,  @n varchar(50),@t  char(10)
as declare @rc int = 0;
begin try
	set transaction isolation level SERIALIZABLE;
	begin tran 
	insert into AUDITORIUM_TYPE(AUDITORIUM_TYPE,  AUDITORIUM_TYPENAME)
	values (@t,@tn);
	exec @rc = PAUDITORIUM_INSERT @a,@n,@c,@t;
	commit tran;
	return @rc;
	end try
	begin catch
	print '����� ������: ' + cast(error_number() as varchar(6));
	print '���������: ' + error_message();
	print '�������: ' + cast(error_severity() as varchar(6));
	print '�����: ' + cast(error_state() as varchar(8));
	print '����� ������: ' + cast(error_line() as varchar(8));
	if error_procedure() is not null
		print '��� ���������: ' + error_procedure();
		if @@TRANCOUNT > 0 rollback tran;
		return -1;
	end catch;
	go
	declare @rc int;
	exec @rc = PAUDITORIUM_INSERTX @a = '��-f', @n = '����������',@c = 15, @t = '��-ma' ,@tn = '������������ �����';
	print '��� ������= ' + cast(@rc as varchar(3))

	
	select * from AUDITORIUM_TYPE

