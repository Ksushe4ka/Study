--Задание 4
create function FCTEACHER 
(
@p varchar(20)
)
returns int
as
begin
declare @rc int = (select count(*) from TEACHER
where PULPIT = isnull (@p , PULPIT));
return @rc
end
go
select PULPIT, dbo.FCTEACHER(PULPIT) from PULPIT

select dbo.FCTEACHER(NULL)


--Задание 5
Create function COUNT_GROUPS(@faculty varchar(20))returns int
as
begin
declare @rc int = 0;
set @rc = (SELECT count(IDGROUP) from GROUPS where FACULTY = @faculty);
return @rc;
end;


Create function COUNT_PROFESSIONS(@faculty varchar(20))returns int
as
begin
declare @rc int = 0;
set @rc = (SELECT count(PROFESSION) from PROFESSION where FACULTY = @faculty);
return @rc;
end;

Create function COUNT_PULPITS(@faculty varchar(20))returns int
as
begin
declare @rc int = 0;
set @rc = (SELECT count(PULPIT) from PULPIT where FACULTY = @faculty);
return @rc;
end;


Create function COUNT_STUDENTSX(@faculty varchar(20))
returns int as begin declare @rc int = 0;
set @rc = (SELECT count(STUDENT.IDSTUDENT) from FACULTY inner join GROUPS on FACULTY.FACULTY = GROUPS.FACULTY inner join STUDENT on GROUPS.IDGROUP = STUDENT.IDGROUP where FACULTY.FACULTY = @faculty);
return @rc;
end;