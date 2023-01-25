--гЮДЮМХЕ 4
GO
INSERT INTO STUDENT(IDGROUP, NAME, BDAY, INFO)
VALUES(4, 'йнпекн й.ю.', '2003-06-13',
'<ярсдемр>
<оюяонпр яепхъ="цп" мнлеп="4245033" дюрю="2014-11-19" />
<рекетнм>+375296048008</рекетнм>
<юдпея>
<ярпюмю>аекюпсяэ</ярпюмю>
<цнпнд>лхмяй</цнпнд>
<скхжю>аекнпсяяйюъ</скхжю>
<днл>33</днл>
<йбюпрхпю>11</йбюпрхпю>
</юдпея>
</ярсдемр>');
GO
SELECT * FROM STUDENT WHERE NAME = 'йнпекн й.ю.'
GO
UPDATE STUDENT SET INFO =
'<ярсдемр>
<оюяонпр яепхъ="цп" мнлеп="41332033" дюрю="19.04.2013" />
<рекетнм>+375296048008</рекетнм>
<юдпея>
<ярпюмю>аекюпсяэ</ярпюмю>
<цнпнд>лхмяй</цнпнд>
<скхжю>аекнпсяяйюъ</скхжю>
<днл>4</днл>
<йбюпрхпю>5</йбюпрхпю>
</юдпея>
</ярсдемр>' WHERE NAME='йнпекн й.ю.';
GO

SELECT NAME[тхн], INFO.value('(ярсдемр/оюяонпр/@яепхъ)[1]', 'CHAR(2)')[яепхъ оюяонпрю],
INFO.value('(ярсдемр/оюяонпр/@мнлеп)[1]', 'VARCHAR(20)')[мнлеп оюяонпрю],
INFO.query('/ярсдемр/юдпея')[юдпея]
FROM STUDENT
WHERE NAME = 'йнпекн й.ю.';


--гЮДЮМХЕ 5
GO
create xml schema collection Student as
N'<?xml version="1.0" encoding="utf-16" ?>
<xs:schema attributeFormDefault="unqualified"
elementFormDefault="qualified"
xmlns:xs="http://www.w3.org/2001/XMLSchema">
<xs:element name="ЯРСДЕМР">
<xs:complexType><xs:sequence>
<xs:element name="ОЮЯОНПР" maxOccurs="1" minOccurs="1">
<xs:complexType>
<xs:attribute name="ЯЕПХЪ" type="xs:string" use="required" />
<xs:attribute name="МНЛЕП" type="xs:unsignedLong" use="required"/>
<xs:attribute name="ДЮРЮ" use="required">
<xs:simpleType> <xs:restriction base ="xs:string">
<xs:pattern value="[0-9]{2}.[0-9]{2}.[0-9]{4}"/>
</xs:restriction> </xs:simpleType>
</xs:attribute>
</xs:complexType>
</xs:element>
<xs:element maxOccurs="3" name="РЕКЕТНМ" type="xs:unsignedLong"/>
<xs:element name="ЮДПЕЯ"> <xs:complexType><xs:sequence>
<xs:element name="ЯРПЮМЮ" type="xs:string" />
<xs:element name="ЦНПНД" type="xs:string" />
<xs:element name="СКХЖЮ" type="xs:string" />
<xs:element name="ДНЛ" type="xs:string" />
<xs:element name="ЙБЮПРХПЮ" type="xs:string" />
</xs:sequence></xs:complexType> </xs:element>
</xs:sequence></xs:complexType>
</xs:element></xs:schema>';


--DROP XML SCHEMA COLLECTION STUDENT;

SELECT NAME, INFO FROM STUDENT WHERE NAME='йнпекн й.ю.';
GO
ALTER TABLE STUDENT ALTER COLUMN INFO XML;