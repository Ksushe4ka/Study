--������� 4
GO
INSERT INTO STUDENT(IDGROUP, NAME, BDAY, INFO)
VALUES(4, '������ �.�.', '2003-06-13',
'<�������>
<������� �����="��" �����="4245033" ����="2014-11-19" />
<�������>+375296048008</�������>
<�����>
<������>��������</������>
<�����>�����</�����>
<�����>�����������</�����>
<���>33</���>
<��������>11</��������>
</�����>
</�������>');
GO
SELECT * FROM STUDENT WHERE NAME = '������ �.�.'
GO
UPDATE STUDENT SET INFO =
'<�������>
<������� �����="��" �����="41332033" ����="19.04.2013" />
<�������>+375296048008</�������>
<�����>
<������>��������</������>
<�����>�����</�����>
<�����>�����������</�����>
<���>4</���>
<��������>5</��������>
</�����>
</�������>' WHERE NAME='������ �.�.';
GO

SELECT NAME[���], INFO.value('(�������/�������/@�����)[1]', 'CHAR(2)')[����� ��������],
INFO.value('(�������/�������/@�����)[1]', 'VARCHAR(20)')[����� ��������],
INFO.query('/�������/�����')[�����]
FROM STUDENT
WHERE NAME = '������ �.�.';


--������� 5
GO
create xml schema collection Student as
N'<?xml version="1.0" encoding="utf-16" ?>
<xs:schema attributeFormDefault="unqualified"
elementFormDefault="qualified"
xmlns:xs="http://www.w3.org/2001/XMLSchema">
<xs:element name="�������">
<xs:complexType><xs:sequence>
<xs:element name="�������" maxOccurs="1" minOccurs="1">
<xs:complexType>
<xs:attribute name="�����" type="xs:string" use="required" />
<xs:attribute name="�����" type="xs:unsignedLong" use="required"/>
<xs:attribute name="����" use="required">
<xs:simpleType> <xs:restriction base ="xs:string">
<xs:pattern value="[0-9]{2}.[0-9]{2}.[0-9]{4}"/>
</xs:restriction> </xs:simpleType>
</xs:attribute>
</xs:complexType>
</xs:element>
<xs:element maxOccurs="3" name="�������" type="xs:unsignedLong"/>
<xs:element name="�����"> <xs:complexType><xs:sequence>
<xs:element name="������" type="xs:string" />
<xs:element name="�����" type="xs:string" />
<xs:element name="�����" type="xs:string" />
<xs:element name="���" type="xs:string" />
<xs:element name="��������" type="xs:string" />
</xs:sequence></xs:complexType> </xs:element>
</xs:sequence></xs:complexType>
</xs:element></xs:schema>';


--DROP XML SCHEMA COLLECTION STUDENT;

SELECT NAME, INFO FROM STUDENT WHERE NAME='������ �.�.';
GO
ALTER TABLE STUDENT ALTER COLUMN INFO XML;