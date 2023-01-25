go
drop table TR_AUDIT
drop trigger TR_TEACHER_INS
drop trigger TR_TEACHER_DEL
drop trigger TR_TEACHER_UPD
drop trigger TR_TEACHER
go
--1
CREATE TABLE TR_AUDIT (
	ID int identity,
	STMT varchar(20)
	check (STMT in ('INS', 'DEL', 'UPD')),
	TRNAME varchar(50),
	CC varchar(300))

go

CREATE TRIGGER TR_TEACHER_INS ON TEACHER AFTER INSERT
AS
	declare @a1 char(10), @a2 varchar(100), @a3 char(1), @a4 char(20), @in varchar(300);
	print 'Операция вставки :';
	set @a1 = (select TEACHER from INSERTED);
	set @a2= (select TEACHER_NAME from INSERTED);
	set @a3= (select GENDER from INSERTED);
	set @a4 = (select PULPIT from INSERTED);
	set @in = @a1+' '+ @a2 +' '+ @a3+ ' ' +@a4;

	insert into TR_AUDIT (STMT,trname, cc)
		values ('INS', 'TR_TEACHER_INS', @in)
return

go	
		
insert into teacher 
	values ('КAK','Ксения Корело Александровна','Ж','ИСиТ')
select * from TR_AUDIT
go

--2
CREATE TRIGGER TR_TEACHER_DEL ON TEACHER AFTER DELETE
as
	declare @a1 char(10), @a2 varchar(100), @a3 char(1), @a4 char(20), @in varchar(300);
	print 'Операция удаления : ';
	set @a1 = (select TEACHER from INSERTED);
	set @a2= (select TEACHER_NAME from INSERTED);
	set @a3= (select GENDER from INSERTED);
	set @a4 = (select PULPIT from INSERTED);
	set @in = @a1+' '+ @a2 +' '+ @a3+ ' ' +@a4;

	insert into TR_AUDIT (STMT,trname, cc)
		values ('DEL', 'TR_TEACHER_DEL', @in)
return

delete TEACHER where TEACHER='КAK'
select * from TR_AUDIT
go	


--3
CREATE TRIGGER TR_TEACHER_UPD ON TEACHER AFTER UPDATE
as
	declare @a1 char(10), @a2 varchar(100), @a3 char(1), @a4 char(20), @in varchar(300);
	
	print 'Операция обновления :';
	set @a1 = (select TEACHER from INSERTED);
	set @a2= (select TEACHER_NAME from INSERTED);
	set @a3= (select GENDER from INSERTED);
	set @a4 = (select PULPIT from INSERTED);
	set @in = @a1+' '+ @a2 +' '+ @a3+ ' ' +@a4;
	set @a1 = (select TEACHER from deleted);
	set @a2= (select TEACHER_NAME from DELETED);
	set @a3= (select GENDER from DELETED);
	set @a4 = (select PULPIT from DELETED);
	set @in =@in + '' + @a1+' '+ @a2 +' '+ @a3+ ' ' +@a4;
	insert into TR_AUDIT(STMT, TRNAME, CC)  
						values('UPD', 'TR_TEACHER_UPD', @in);	         
return;
update TEACHER set TEACHER.PULPIT = 'ИСиТ' where TEACHER.TEACHER = 'ФЫВ'
 
 SELECT * from TR_AUDIT
go

--4
 CREATE TRIGGER TR_TEACHER ON TEACHER AFTER INSERT, DELETE, UPDATE
AS 
	declare @a1 char(10), @a2 varchar(100), @a3 char(1), @a4 char(20), @in varchar(300);
	declare @ins int = (select count(*) from inserted),
	@del int = (select count(*) from deleted); 

	if  @ins > 0 and  @del = 0 
	begin 
		print 'Событие: INSERT';
		set @a1 = (select TEACHER from INSERTED);
		set @a2= (select TEACHER_NAME from INSERTED);
		set @a3= (select GENDER from INSERTED);
		set @a4 = (select PULPIT from INSERTED);
		set @in = @a1+' '+ @a2 +' '+ @a3+ ' ' +@a4;
		insert into TR_AUDIT(STMT, TRNAME, CC)  
		values('INS', 'TR_TEACHER_INS', @in);	
	end; 
	else if @ins = 0 and  @del > 0  
	begin 
		print 'Событие: DELETE';
		set @a1 = (select TEACHER from DELETED);
		set @a2= (select TEACHER_NAME from DELETED);
		set @a3= (select GENDER from DELETED);
		set @a4 = (select PULPIT from DELETED);
		set @in = @a1+' '+ @a2 +' '+ @a3+ ' ' +@a4;
		insert into TR_AUDIT(STMT, TRNAME, CC)  
		values('DEL', 'TR_TEACHER_DEL', @in);
	end; 
	else if @ins > 0 and  @del > 0  
	begin 
		print 'Событие: UPDATE'; 
		set @a1 = (select TEACHER from INSERTED);
		set @a2= (select TEACHER_NAME from INSERTED);
		set @a3= (select GENDER from INSERTED);
		set @a4 = (select PULPIT from INSERTED);
		set @in = @a1+' '+ @a2 +' '+ @a3+ ' ' +@a4;
		set @a1 = (select TEACHER from deleted);
		set @a2= (select TEACHER_NAME from DELETED);
		set @a3= (select GENDER from DELETED);
		set @a4 = (select PULPIT from DELETED);
		set @in =@in + '' + @a1+' '+ @a2 +' '+ @a3+ ' ' +@a4;
		insert into TR_AUDIT(STMT, TRNAME, CC)  
		values('UPD', 'TR_TEACHER_UPD', @in); 
	end;  
return;  

--drop  table TR_AUDIT
--drop trigger TR_TEACHER
--drop trigger TR_TEACHER_DEL
--drop trigger TR_TEACHER_INS
--drop trigger TR_TEACHER_UPD

delete TEACHER where TEACHER='ККА'
insert into  TEACHER
 	values ('AKK','Ксения Корело Александровна','Ж','ИСиТ')
update TEACHER set GENDER = ' ' where TEACHER='ККА'
select * from TR_AUDIT


--5 ограничение целостности
update TEACHER set GENDER = 'К' where TEACHER='КАИ'
select * from TR_AUDIT
go

--6 
drop trigger TR_TEACHER_DEL1
drop trigger TR_TEACHER_DEL2
drop trigger TR_TEACHER_DEL3
 go
create trigger TR_TEACHER_DEL1 on TEACHER after DELETE
as print 'TEACHERS_AFTER_DELETE1';
return;
go
create trigger TR_TEACHER_DEL2 on TEACHER after DELETE
as print 'TEACHERS_AFTER_DELETE2';
return;
go
create trigger TR_TEACHER_DEL3 on TEACHER after DELETE
as print 'TEACHERS_AFTER_DELETE3';
return;

select t.name,e.type_desc from sys.triggers t join sys.trigger_events e
on t.object_id = e.object_id
where OBJECT_NAME(t.parent_id) = 'TEACHER' and e.type_desc = 'DELETE'

exec SP_SETTRIGGERORDER @triggername = 'TR_TEACHER_DEL3',@order = 'First',@stmttype = 'DELETE';

exec SP_SETTRIGGERORDER @triggername = 'TR_TEACHER_DEL2',@order = 'Last',@stmttype = 'DELETE';

delete TEACHER where TEACHER='КАK'
select * from TR_AUDIT
go


--7
DROP trigger AUDITORIUM_TRAN
go
create trigger AUDITORIUM_TRAN on AUDITORIUM after INSERT,DELETE,UPDATE
as declare @c int = (SELECT sum(AUDITORIUM.AUDITORIUM_CAPACITY) from AUDITORIUM)
if(@c > 350)
	begin 
		raiserror('Общая вместимость аудиторий не может быть больше 350',10,1);	
		rollback;
end 
return

UPDATE AUDITORIUM set AUDITORIUM_CAPACITY = 15 where AUDITORIUM = '216-1'
go
--8
CREATE TRIGGER TR_Faculty_instead_of on faculty instead of delete
as
	raiserror (N'Удаление запрещено', 11, 1);
return

go

delete FACULTY where FACULTY = 'ИДиП'
--
drop trigger TR_TEACHER_INS
drop trigger TR_TEACHER_DEL
drop trigger TR_TEACHER_UPD
drop trigger TR_TEACHER_DEL1
drop trigger TR_TEACHER_DEL2
drop trigger TR_TEACHER_DEL3
drop trigger TR_TEACHER
drop trigger TR_Pulpit_Tran
drop trigger TR_Faculty_instead_of 
go

--9
drop trigger DDL_TEACHER
go
create trigger DDL_TEACHER on database for DDL_DATABASE_LEVEL_EVENTS
as 
declare @t varchar(50) = EVENTDATA().value('(/EVENT_INSTANCE/EventType)[1]', 'varchar(50)');
declare @t1 varchar(50) = EVENTDATA().value('(/EVENT_INSTANCE/ObjectName)[1]', 'varchar(50)');
declare @t2 varchar(50) = EVENTDATA().value('(/EVENT_INSTANCE/ObjectType)[1]', 'varchar(50)');
if @t1 = 'TEACHER'
begin
	print 'Тип события: ' + @t;
	print 'Имя объекта: ' + @t1;
	print 'Тип объекта: ' + @t2;
	raiserror ('Операции с таблицей TEACHER запрещены',16,1);
	rollback;
end;

alter table TEACHER Drop column TEACHER_NAME;