--Задание 6
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
	print 'Номер ошибки: ' + cast(error_number() as varchar(6));
	print 'сообщение: ' + error_message();
	print 'уровень: ' + cast(error_severity() as varchar(6));
	print 'метка: ' + cast(error_state() as varchar(8));
	print 'номер строки: ' + cast(error_line() as varchar(8));
	if error_procedure() is not null
		print 'имя процедуры: ' + error_procedure();
		if @@TRANCOUNT > 0 rollback tran;
		return -1;
	end catch;
	go
	declare @rc int;
	exec @rc = PAUDITORIUM_INSERTX @a = 'ЛК-f', @n = 'Лекционная',@c = 15, @t = 'ЛБ-ma' ,@tn = 'Компьютерный класс';
	print 'код ошибки= ' + cast(@rc as varchar(3))

	
	select * from AUDITORIUM_TYPE

