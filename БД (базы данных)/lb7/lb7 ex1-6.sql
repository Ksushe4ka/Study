--??????? 1
 CREATE VIEW [TEACHER_VIEW]
     AS SELECT TEACHER [COD], TEACHER_NAME [NAME], GENDER [GENDER], PULPIT [PULPIT] 
     FROM TEACHER 
 go
 SELECT * FROM TEACHER_VIEW  ORDER BY [NAME] DESC
DROP VIEW [TEACHER_VIEW]
 
--??????? 2
DROP VIEW [CNT_PULPIT]
go
 CREATE VIEW [CNT_PULPIT]
     AS SELECT F.FACULTY_NAME [FAC],(SELECT COUNT(*)FROM PULPIT P WHERE P.FACULTY = F.FACULTY) [CNT_PULPITS]
     FROM FACULTY F
 go
 ALTER VIEW [CNT_PULPIT]
     AS SELECT F.FACULTY_NAME [FAC], COUNT(P.PULPIT_NAME) [CNT_PULPITS]
     FROM FACULTY F JOIN PULPIT P ON P.FACULTY = F.FACULTY 
     GROUP BY F.FACULTY_NAME
 go
 SELECT * FROM PULPIT ORDER BY FACULTY
 SELECT * FROM [CNT_PULPIT] ORDER BY CNT_PULPITS DESC


--??????? 3
DROP VIEW [AUDSS]
go
 CREATE VIEW [AUDSS](AU_COD,TYPE,NAME) 
     AS SELECT AUDITORIUM ,AUDITORIUM_TYPE ,AUDITORIUM_NAME 
     FROM AUDITORIUM 
     WHERE AUDITORIUM_TYPE LIKE '??'
 go
 SELECT * FROM AUDITORIUM
 SELECT * FROM [AUDSS]
     INSERT [AUDSS] VALUES('114-1','??', '114-1');
     INSERT [AUDSS] VALUES('138-2','??', '138-2');
	 INSERT [AUDSS] VALUES('124-1','??', '124-1');
	 DELETE AUDITORIUM WHERE AUDITORIUM.AUDITORIUM LIKE '138-2%' OR AUDITORIUM LIKE '137-1%' OR AUDITORIUM LIKE '136-1%';
     UPDATE AUDSS SET AU_COD = '666-06', TYPE= '??', NAME = '666-06' WHERE AU_COD = '313-1';
 SELECT * FROM AUDSS;

--??????? 4
DROP VIEW LECTURES_AUDS
go
 CREATE VIEW LECTURES_AUDS(TYPE, AU_COD,NAME) 
     AS SELECT A.AUDITORIUM_TYPE, A.AUDITORIUM ,A.AUDITORIUM_NAME 
     FROM AUDITORIUM A
     WHERE A.AUDITORIUM_TYPE LIKE '??'
go
     SELECT * FROM [LECTURES_AUDS]
go
 ALTER VIEW LECTURES_AUDS(TYPE,AU_COD,NAME) 
     AS SELECT A.AUDITORIUM_TYPE ,A.AUDITORIUM ,A.AUDITORIUM_NAME 
     FROM AUDITORIUM A
     WHERE A.AUDITORIUM_TYPE LIKE '??' WITH CHECK OPTION
go
 SELECT * FROM [LECTURES_AUDS]
 INSERT LECTURES_AUDS VALUES('??','102-3A', '102-3A');
 INSERT LECTURES_AUDS VALUES('??','135-1', '135-1');
 DELETE LECTURES_AUDS WHERE [AU_COD] = '102-1%';
 UPDATE LECTURES_AUDS SET AU_COD = '100' WHERE AU_COD = '102-3A';
 SELECT * FROM LECTURES_AUDS;


--??????? 5
DROP VIEW SUBJS
go
 CREATE VIEW SUBJS(COD,SUBJSNAME,PULPITCOD)
   AS SELECT TOP 10 S.SUBJECT,S.SUBJECT_NAME,S.PULPIT FROM SUBJECT S
   ORDER BY SUBJECT_NAME
go
 ALTER VIEW SUBJS(COD,SUBJSNAME,PULPITCOD)
   AS SELECT TOP 12 S.SUBJECT,S.SUBJECT_NAME,S.PULPIT FROM SUBJECT S
   ORDER BY SUBJECT_NAME
go
 SELECT * FROM SUBJS


--??????? 6
go
ALTER VIEW [CNT_PULPIT] WITH SCHEMABINDING
    AS SELECT F.FACULTY_NAME [FAC], COUNT(P.PULPIT_NAME) [CNT_PULPITS]
    FROM dbo.FACULTY F JOIN dbo.PULPIT P ON P.FACULTY = F.FACULTY 
    GROUP BY F.FACULTY_NAME
go
SELECT * FROM [CNT_PULPIT]

