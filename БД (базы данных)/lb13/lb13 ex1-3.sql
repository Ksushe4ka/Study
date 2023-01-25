--Задание 1
go
create function COUNT_STUDENTS (
@faculty varchar(20)
)
returns int

as begin
declare @rc int
set @rc = (select count(FACULTY.FACULTY)
from FACULTY
inner join GROUPS on GROUPS.FACULTY = FACULTY.FACULTY
inner join STUDENT on STUDENT.IDGROUP = GROUPS.IDGROUP
where FACULTY.FACULTY = @faculty)

return @rc;
end

--DROP FUNCTION COUNT_STUDENTS;
go
select dbo.COUNT_STUDENTS('ХТиТ')

------Alter------
go
alter function COUNT_STUDENTS (
@faculty varchar(20),
@prof nvarchar(20)
)
returns int

as begin
declare @rc int
set @rc = (select count(STUDENT.IDSTUDENT)
from FACULTY
inner join GROUPS on GROUPS.FACULTY = FACULTY.FACULTY
inner join STUDENT on STUDENT.IDGROUP = GROUPS.IDGROUP
where FACULTY.FACULTY = @faculty and GROUPS.PROFESSION = @prof)
return @rc;
end
go
select dbo.COUNT_STUDENTS('ХТиТ', 'Конструирование и производство изделий из композиционных материалов')

--Задание 2 

go
create function FSUBJECTS (
@p varchar(20)
)
returns char (300)
as 
begin
declare @tv char(20);
declare @t varchar(300) = 'Код кафедры'
declare cur cursor for select SUBJECT from SUBJECT 
where SUBJECT.PULPIT = @p
open cur
fetch cur into @tv
while @@FETCH_STATUS = 0
begin
set @t = @t +',' +RTRIM(@tv)
FETCH cur INTO @tv
end
return @t
end
go
drop function FSUBJECTS

select PULPIT, dbo.FSUBJECTS(PULPIT) from PULPIT


--Задание 3
go
CREATE FUNCTION FFACPUL(
@Facult VARCHAR(10),
@PUL VARCHAR(10)) 
RETURNS TABLE
    AS RETURN
    SELECT FACULTY.FACULTY, PULPIT.PULPIT
    FROM FACULTY LEFT OUTER JOIN PULPIT
    ON FACULTY.FACULTY = PULPIT.FACULTY
WHERE FACULTY.FACULTY=ISNULL(@Facult, FACULTY.FACULTY) AND PULPIT.PULPIT=ISNULL(@PUL, PULPIT.PULPIT);
GO

drop function FFACPUL

SELECT * FROM DBO.FFACPUL(NULL,NULL);

SELECT * FROM DBO.FFACPUL('ИЭФ',NULL);

SELECT * FROM DBO.FFACPUL(NULL,'ИСИТ');

SELECT * FROM DBO.FFACPUL('ТТЛП','ЛМИЛЗ');

SELECT * FROM DBO.FFACPUL('NO','NO');
