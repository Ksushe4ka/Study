--������� 1
select TEACHER.PULPIT[�������],TEACHER.TEACHER_NAME[�������������]
from TEACHER where TEACHER.PULPIT = '����'
for xml PATH('PULPIT'),root('������_��������������_�������_����'),elements;

select AUDITORIUM_TYPE from AUDITORIUM
where AUDITORIUM.AUDITORIUM_CAPACITY = 90
for xml PATH ('AUDITORUIN_TYPE'),
root ('���������'),
elements;


--������� 2
SELECT AUDITORIUM.AUDITORIUM[������������_���������],AUDITORIUM.AUDITORIUM_TYPE[������������_����_���������],AUDITORIUM.AUDITORIUM_CAPACITY[�����������_���������]
From AUDITORIUM inner join AUDITORIUM_TYPE on AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE
WHERE AUDITORIUM_TYPENAME like '%����������%'
order by AUDITORIUM for xml auto,
root ('������_����������_���������'),elements;


--������� 3
declare @h int = 0,
@x varchar(2000) = '<?xml version= "1.0" encoding = "windows-1251" ?>
<ROOT>
<subj SUBJECT = "���" SUBJECT_NAME = "������ �������������� ������������" PULPIT = "����"/>
<subj SUBJECT = "��" SUBJECT_NAME = "������ �����������" PULPIT = "����"/>
<subj SUBJECT = "���" SUBJECT_NAME = "���������������� ���������� ������" PULPIT = "����"/>
</ROOT>';
exec sp_xml_preparedocument @h output,@x;
insert SUBJECT select [SUBJECT],[SUBJECT_NAME],[PULPIT]
from openxml(@h,'/ROOT/subj',0)
with([SUBJECT] nvarchar(10),[SUBJECT_NAME] nvarchar(200),[PULPIT] nvarchar(10))

exec sp_xml_removedocument @h;

select * from SUBJECT

-----��������� ������� 
go
declare @h int = 0,
@x varchar(2000) = '<?xml version= "1.0" encoding = "windows-1251" ?>
<ROOT>
<subj SUBJECT = "���" SUBJECT_NAME = "������ �������������� ������������" PULPIT = "����"/>
<subj SUBJECT = "��" SUBJECT_NAME = "������ �����������" PULPIT = "����"/>
<subj SUBJECT = "���" SUBJECT_NAME = "���������������� ���������� ������" PULPIT = "����"/>
</ROOT>';
exec sp_xml_preparedocument @h output,@x;
select *
from openxml(@h,'/ROOT/subj',0)
with([SUBJECT] nvarchar(10),[SUBJECT_NAME] nvarchar(200),[PULPIT] nvarchar(10))