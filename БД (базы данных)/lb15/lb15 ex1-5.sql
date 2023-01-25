go
--1
select * from TEACHER where PULPIT = '����'
for xml path
go
--2
select AUDITORIUM.AUDITORIUM[������������_���������], AUDITORIUM_TYPE.AUDITORIUM_TYPE[���], AUDITORIUM_CAPACITY
from AUDITORIUM inner join AUDITORIUM_TYPE
on AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE
where AUDITORIUM.AUDITORIUM_TYPE = '��'
for xml auto
--3
declare @h int = 0,
	@x varchar(2000) = '<?xml version="1.0" encoding="windows-1251" ?>
						<����������>
							<���������� ���="��" ��������="������������ �������" �������="����" /> 
							<���������� ���="���" ��������="������ ����� ����������" �������="����" />  
							<���������� ���="���" ��������="������� ������� �����" �������="����" /> 
						</����������>';

exec sp_xml_preparedocument @h output, @x;

insert SUBJECT select [���], [��������], [�������] 
	from openxml(@h, '/����������/����������', 0) 
	with([���] char(10), [��������] varchar(100), [�������] char(20)); 
go
--4
insert into STUDENT(IDGROUP, NAME, BDAY, INFO)
	values (1,'������ ����','05.05.1998',
		'<�������>
			<������� ����� = "BC" ����� = "2135496"/>
			<�����>
				<������>��������</������>
				<�����>�����</�����>
				<���>16</���>	
			</�����>
		</�������>');
select * from STUDENT where NAME = '������ ����'

update STUDENT set INFO =
			'<�������>
			<������� ����� = "BC" ����� = "2135496"/>
			<�������>+375 29 594 24 66</�������>
			<�����>
				<������>��������</������>
				<�����>�����</�����>
				<���>16</���>	
			</�����>
		</�������>'
	where Name = '������ ����'

select NAME[���], INFO.value('(���������/�������/@�����)[1]', 'char(2)')[����� ��������], 
	INFO.value('(���������/�������/@�����)[1]', 'varchar(20)')[����� ��������], INFO.query('/���������/�����')[�����] 
	from  STUDENT; 
go
--5
create xml schema collection Student1 as 
N'<?xml version="1.0" encoding="utf-16" ?>
<xs:schema attributeFormDefault="unqualified" 
   elementFormDefault="qualified"
   xmlns:xs="http://www.w3.org/2001/XMLSchema">
<xs:element name="�������">
<xs:complexType><xs:sequence>
<xs:element name="�������" maxOccurs="1" minOccurs="1">
  <xs:complexType>
    <xs:attribute name="�����" type="xs:string" use="required" />
    <xs:attribute name="�����" type="xs:unsignedInt" use="required"/>
  </xs:complexType>
</xs:element>
<xs:element maxOccurs="3" name="�������" type="xs:unsignedInt"/>
<xs:element name="�����">   <xs:complexType><xs:sequence>
   <xs:element name="������" type="xs:string" />
   <xs:element name="�����" type="xs:string" />
   <xs:element name="���" type="xs:string" />
   </xs:sequence></xs:complexType>  </xs:element>
</xs:sequence></xs:complexType>
</xs:element></xs:schema>';

go
alter table STUDENT alter column INFO xml(Student1); -- �������������� ������� XML-����