--Задание 1
select TEACHER.PULPIT[Кафедра],TEACHER.TEACHER_NAME[Преподаватель]
from TEACHER where TEACHER.PULPIT = 'ИСиТ'
for xml PATH('PULPIT'),root('Список_преподавателей_кафедры_ИСиТ'),elements;

select AUDITORIUM_TYPE from AUDITORIUM
where AUDITORIUM.AUDITORIUM_CAPACITY = 90
for xml PATH ('AUDITORUIN_TYPE'),
root ('Аудитории'),
elements;


--Задание 2
SELECT AUDITORIUM.AUDITORIUM[Наименование_аудитории],AUDITORIUM.AUDITORIUM_TYPE[Наименование_типа_аудитории],AUDITORIUM.AUDITORIUM_CAPACITY[Вместимость_аудитории]
From AUDITORIUM inner join AUDITORIUM_TYPE on AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE
WHERE AUDITORIUM_TYPENAME like '%Лекционная%'
order by AUDITORIUM for xml auto,
root ('Список_лекционных_аудиторий'),elements;


--Задание 3
declare @h int = 0,
@x varchar(2000) = '<?xml version= "1.0" encoding = "windows-1251" ?>
<ROOT>
<subj SUBJECT = "ОИБ" SUBJECT_NAME = "Основы информационной безопасности" PULPIT = "ИСиТ"/>
<subj SUBJECT = "ТВ" SUBJECT_NAME = "Теория вероятности" PULPIT = "ИСиТ"/>
<subj SUBJECT = "ПВС" SUBJECT_NAME = "Программирование встроенных систем" PULPIT = "ИСиТ"/>
</ROOT>';
exec sp_xml_preparedocument @h output,@x;
insert SUBJECT select [SUBJECT],[SUBJECT_NAME],[PULPIT]
from openxml(@h,'/ROOT/subj',0)
with([SUBJECT] nvarchar(10),[SUBJECT_NAME] nvarchar(200),[PULPIT] nvarchar(10))

exec sp_xml_removedocument @h;

select * from SUBJECT

-----Отдельная таблица 
go
declare @h int = 0,
@x varchar(2000) = '<?xml version= "1.0" encoding = "windows-1251" ?>
<ROOT>
<subj SUBJECT = "ОИБ" SUBJECT_NAME = "Основы информационной безопасности" PULPIT = "ИСиТ"/>
<subj SUBJECT = "ТВ" SUBJECT_NAME = "Теория вероятности" PULPIT = "ИСиТ"/>
<subj SUBJECT = "ПВС" SUBJECT_NAME = "Программирование встроенных систем" PULPIT = "ИСиТ"/>
</ROOT>';
exec sp_xml_preparedocument @h output,@x;
select *
from openxml(@h,'/ROOT/subj',0)
with([SUBJECT] nvarchar(10),[SUBJECT_NAME] nvarchar(200),[PULPIT] nvarchar(10))