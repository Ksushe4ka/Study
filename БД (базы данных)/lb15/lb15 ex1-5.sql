go
--1
select * from TEACHER where PULPIT = 'ИСиТ'
for xml path
go
--2
select AUDITORIUM.AUDITORIUM[Наименование_аудитории], AUDITORIUM_TYPE.AUDITORIUM_TYPE[Тип], AUDITORIUM_CAPACITY
from AUDITORIUM inner join AUDITORIUM_TYPE
on AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE
where AUDITORIUM.AUDITORIUM_TYPE = 'ЛК'
for xml auto
--3
declare @h int = 0,
	@x varchar(2000) = '<?xml version="1.0" encoding="windows-1251" ?>
						<дисциплины>
							<дисциплина код="МС" название="Компьютерная графика" кафедра="ИСиТ" /> 
							<дисциплина код="ООИ" название="Основы основ информации" кафедра="ИСиТ" />  
							<дисциплина код="КЗС" название="Красный зеленый синий" кафедра="ИСиТ" /> 
						</дисциплины>';

exec sp_xml_preparedocument @h output, @x;

insert SUBJECT select [код], [название], [кафедра] 
	from openxml(@h, '/дисциплины/дисциплина', 0) 
	with([код] char(10), [название] varchar(100), [кафедра] char(20)); 
go
--4
insert into STUDENT(IDGROUP, NAME, BDAY, INFO)
	values (1,'Елисей Шпак','05.05.1998',
		'<студент>
			<паспорт серия = "BC" номер = "2135496"/>
			<адрес>
				<страна>Беларусь</страна>
				<город>Минск</город>
				<дом>16</дом>	
			</адрес>
		</студент>');
select * from STUDENT where NAME = 'Елисей Шпак'

update STUDENT set INFO =
			'<студент>
			<паспорт серия = "BC" номер = "2135496"/>
			<телефон>+375 29 594 24 66</телефон>
			<адрес>
				<страна>Беларусь</страна>
				<город>Минск</город>
				<дом>16</дом>	
			</адрес>
		</студент>'
	where Name = 'Елисей Шпак'

select NAME[ФИО], INFO.value('(студентка/паспорт/@серия)[1]', 'char(2)')[Серия паспорта], 
	INFO.value('(студентка/паспорт/@номер)[1]', 'varchar(20)')[Номер паспорта], INFO.query('/студентка/адрес')[Адрес] 
	from  STUDENT; 
go
--5
create xml schema collection Student1 as 
N'<?xml version="1.0" encoding="utf-16" ?>
<xs:schema attributeFormDefault="unqualified" 
   elementFormDefault="qualified"
   xmlns:xs="http://www.w3.org/2001/XMLSchema">
<xs:element name="студент">
<xs:complexType><xs:sequence>
<xs:element name="паспорт" maxOccurs="1" minOccurs="1">
  <xs:complexType>
    <xs:attribute name="серия" type="xs:string" use="required" />
    <xs:attribute name="номер" type="xs:unsignedInt" use="required"/>
  </xs:complexType>
</xs:element>
<xs:element maxOccurs="3" name="телефон" type="xs:unsignedInt"/>
<xs:element name="адрес">   <xs:complexType><xs:sequence>
   <xs:element name="страна" type="xs:string" />
   <xs:element name="город" type="xs:string" />
   <xs:element name="дом" type="xs:string" />
   </xs:sequence></xs:complexType>  </xs:element>
</xs:sequence></xs:complexType>
</xs:element></xs:schema>';

go
alter table STUDENT alter column INFO xml(Student1); -- типизированный столбец XML-типа