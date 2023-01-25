GO
--1
drop function COUNT_STUDENTS
go
CREATE FUNCTION COUNT_STUDENTS (@faculty VARCHAR(20)) returns int
as begin
	declare @ret int
	set @ret = (select count(student.idstudent) from student 
		join GROUPS on student.idgroup = groups.idgroup
		join faculty on faculty.faculty = groups.faculty
		where faculty.faculty = @faculty)
	return @ret
end

GO

declare @ex1 int = dbo.COUNT_STUDENTS('ТОВ');
select @ex1 [Кол-во студентов на фак.]

GO

alter function COUNT_STUDENTS (	@faculty varchar(20) = null, @profession varchar(20) = null) returns int
as begin  
	return	(		
		select count(IDSTUDENT) 
		from FACULTY 
			join PROFESSION  on FACULTY.FACULTY=PROFESSION.FACULTY
			join  GROUPS on PROFESSION.PROFESSION=GROUPS.PROFESSION
			join STUDENT on GROUPS.IDGROUP =STUDENT.IDGROUP
				where FACULTY.FACULTY = isnull (@faculty,FACULTY.FACULTY) and 
				PROFESSION.PROFESSION = isnull(@profession, PROFESSION.PROFESSION)
	) 	 
end;   
GO
--2
CREATE FUNCTION FSUBJECTS (@p varchar(20)) returns varchar(300)
as begin  
	declare @str varchar(300) = 'Дисциплины: '
	declare @retCurs	varchar (20)
	declare pulpitCusor cursor local for 
		select SUBJECT from SUBJECT where PULPIT = @p

	open pulpitCusor
	fetch pulpitCusor into @retCurs

	while @@FETCH_STATUS = 0
	begin
		set @str = @str + rtrim(@retCurs) + ', ';  
		fetch pulpitCusor into @retCurs
	end 
	return substring(@str, 1, len(@str)-1);
end;   

GO

select PULPIT, dbo.FSUBJECTS(PULPIT) from PULPIT

GO

--3
CREATE FUNCTION FFACPUL (@f varchar(10), @p varchar(10)) returns table
as return
	select faculty.faculty, pulpit.PULPIT
	from FACULTY left outer join Pulpit
	on faculty.FACULTY = PULPIT.FACULTY
	where FACULTY.FACULTY = isnull(@f, FACULTY.FACULTY)
	and PULPIT.PULPIT = isnull (@p, PULPIT.PULPIT)

GO

select * from dbo.FFACPUL(NULL, NULL)
select * from dbo.FFACPUL('ИДиП', NULL)
select * from dbo.FFACPUL(NULL, 'ИСиТ')
select * from dbo.FFACPUL('ИДиП', 'ИСиТ')

GO
--4
create function FCTEACHER (@p varchar(10))returns int
as begin
	declare @rc int = (select count(*) from TEACHER
		where TEACHER.PULPIT = isnull(@p,TEACHER.PULPIT))
	return @rc
end

GO

select PULPIT, dbo.FCTEACHER(PULPIT) [Кол-во преп.] from PULPIT
select dbo.FCTEACHER(null) [Всего преп.]


--Задание 5
go
Create function COUNT_GROUPS(@faculty varchar(20))returns int
as
begin
declare @rc int = 0;
set @rc = (SELECT count(IDGROUP) from GROUPS where FACULTY = @faculty);
return @rc;
end;

go
Create function COUNT_PROFESSIONS(@faculty varchar(20))returns int
as
begin
declare @rc int = 0;
set @rc = (SELECT count(PROFESSION) from PROFESSION where FACULTY = @faculty);
return @rc;
end;

go
Create function COUNT_PULPITS(@faculty varchar(20))returns int
as
begin
declare @rc int = 0;
set @rc = (SELECT count(PULPIT) from PULPIT where FACULTY = @faculty);
return @rc;
end;

go
Create function COUNT_STUDENTSX(@faculty varchar(20))
returns int as begin declare @rc int = 0;
set @rc = (SELECT count(STUDENT.IDSTUDENT) from FACULTY inner join GROUPS on FACULTY.FACULTY = GROUPS.FACULTY inner join STUDENT on GROUPS.IDGROUP = STUDENT.IDGROUP where FACULTY.FACULTY = @faculty);
return @rc;
end;