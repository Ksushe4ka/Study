-- Задание 1
 declare @ch char = 't',
 		@vch varchar(4) = 'BSTU',
 		@date datetime,
 		@time time,
 		@int int,
 		@smallint smallint = 3,
 		@ti tinyint,
 		@dec numeric(10, 4);

 		set @date = GETDATE();

 		select @time = CAST('06:06:06' as time), @int = 123, @ti = 1, @dec =  0.6574;
 
 select @ch ch, @date date, @smallint smallint, @ti ti, @dec dec;

 print 'vch = ' + cast(@vch as varchar(10));
 print 'int = ' + cast(@int as varchar(10));
 print 'time = ' + cast(@time as varchar(10));
 

-- Задание 2 
 DECLARE @Y1 INT = (SELECT COUNT (*) AUDITORIUM FROM AUDITORIUM), @Y2 INT, @Y3 INT = (SELECT SUM( AUDITORIUM_CAPACITY) FROM AUDITORIUM), @Y4 FLOAT, @Y5 FLOAT(1)
 IF @Y3>200
 BEGIN
 SELECT @Y2 = (SELECT AVG(AUDITORIUM_CAPACITY) FROM AUDITORIUM)
 SELECT @Y2 Y2
 SELECT @Y4 = (SELECT COUNT(*)  FROM AUDITORIUM A WHERE A.AUDITORIUM_CAPACITY > @Y2)
 SELECT @Y5 = ROUND(@Y4/@Y1, 3) * 100
 SELECT @Y1 COUNT_OF_AUD, @Y2 AVG_CAPACITY, @Y4 COUNT_MIN_AUD, @Y5 PERCENTS
 END
 ELSE SELECT  @Y3 SUMMARY_CAPACITY
 
-- Задание 3 
 begin
 print N'@@ROWCOUNT     :'  + cast(@@rowcount as varchar(10)) --(число обработанных строк); 
 print N'@@VERSION      : ' + cast(@@version as varchar(52)) --(версия SQL Server);
 print N'@@SPID         : ' + cast(@@spid as varchar(10)) --(возвращает системный идентификатор процесса, назначенный сервером текущему подключению); 
 print N'@@ERROR        : ' + cast(@@error as varchar(10)) --(код последней ошибки
 print N'@@SERVERNAME   : ' + cast(@@servername as varchar(15))  --(имя сервера); 
 print N'@@TRANCOUNT    : ' + cast(@@trancount as varchar(10))  --(возвращает уровень вложенности транзакции); 
 print N'@@FETCH_STATUS : ' + cast(@@fetch_status as varchar(10)) --STATUS (проверка результата считывания строк результирующего набора); 
 print N'@@NESTLEVEL    : ' + CAST(@@nestlevel as varchar(10))  --(уровень вложенности текущей процедуры).
 end;

--  Задание 4
 DECLARE  @X FLOAT = 100, @T FLOAT = 3,  @Z FLOAT
 IF ( @T > @X)
 SET @Z = SIN(@T) * SIN(@T)
 ELSE IF (@T = @X)
 SET @Z = 1- EXP(@X-2)
 ELSE
 SET @Z = 4 * (@T + @X);
 PRINT 'Z = ' + CAST(@Z AS VARCHAR(10))
 GO
 
 
 DECLARE @NAME NVARCHAR(30) = 'KORELO KSENIA ALEKSANDROVNA', @NAME2 NVARCHAR(20), @LEN INT, @PR INT
 SET @LEN = LEN(@NAME)
 SET @PR = PATINDEX('% %', @NAME)  --определяет в строке позицию первого символа подстроки
 SELECT @PR PR
 SET @NAME2 = LEFT(@NAME, @PR + 1) + '.'
 SELECT @NAME2 Name2
 SET @NAME = RIGHT(@NAME, (@LEN - @PR)) --переопределяем
 SELECT @NAME Name
 SET @PR = PATINDEX('% %', @NAME)
 SET @LEN = LEN(@NAME)
 SET @NAME = RIGHT(@NAME, @LEN - @PR) --переопределяем
 SELECT @NAME Name
 SET @NAME2 = @NAME2 + LEFT(@NAME, 1) + '.'
 PRINT @NAME2
 GO
 
 DECLARE  @A1 INT = YEAR(GETDATE()), @A2 INT = MONTH(GETDATE()) + 1
 SELECT STUDENT.NAME, BDAY , @A1 - YEAR(BDAY) AS 'AGE'
 FROM 
 STUDENT
 WHERE MONTH(BDAY) = @A2
 Go

 SELECT DISTINCT
 CASE DATEPART(WEEKDAY,PROGRESS.PDATE)
     WHEN 1 THEN 'SUN' 
     WHEN 2 THEN 'MON' 
     WHEN 3 THEN 'TUE' 
     WHEN 4 THEN 'WEN' 
     WHEN 5 THEN 'THUR' 
     WHEN 6 THEN 'FRI' 
     WHEN 7 THEN 'SAT' 
 END AS 'DAY', PROGRESS.SUBJECT, PROGRESS.PDATE
 FROM PROGRESS INNER JOIN STUDENT ON PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
 
 --Задание 5
 DECLARE @III INT = (SELECT COUNT(*) FROM AUDITORIUM);
 IF (@III > 10)
 BEGIN
 PRINT 'COUNT > 10';
 PRINT 'COUNT = ' + CAST(@III AS VARCHAR(10))
 END
 ELSE
 BEGIN
 PRINT 'COUNT < 10'
 PRINT 'COUNT = ' + CAST(@III AS VARCHAR(10))
 END;

-- Задание 6
 SELECT CASE 
 WHEN PROGRESS.NOTE BETWEEN 8 AND 10 THEN 'HIGH'
 WHEN PROGRESS.NOTE BETWEEN 5 AND 7 THEN 'MID'
 ELSE 'LOW'
 END AS MARK, COUNT(*) [COUNT] 
 FROM  PROGRESS INNER JOIN STUDENT ON PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT 
 JOIN GROUPS G ON STUDENT.IDGROUP = G.IDGROUP 
 WHERE G.FACULTY = 'IT'
 GROUP BY CASE
 WHEN PROGRESS.NOTE BETWEEN 8 AND 10 THEN 'HIGH'
 WHEN PROGRESS.NOTE BETWEEN 5 AND 7 THEN 'MID'
 ELSE 'LOW'
 END
 ORDER BY COUNT DESC

-- Задание 7
 CREATE TABLE #TIMETABLE (  --временная лок.таблица
 INTNUMBER INT,
 FLOATNUMBER FLOAT,
 STRING NVARCHAR(15)
 );
 
 SET NOCOUNT ON;
 DECLARE @II INT = 0;
 WHILE @II < 10
 BEGIN 
 	INSERT #TIMETABLE(INTNUMBER, FLOATNUMBER, STRING) 
 	VALUES(FLOOR(10*RAND()), 0.3*RAND(),REPLICATE('I','2'))
 	IF (@II % 10 = 0)
 	PRINT @II;
 	SET @II = @II + 1;
 	END;
 
 SELECT * FROM #TIMETABLE;

-- Задание 8
 DECLARE @SMPL INT = 93
 PRINT @SMPL + 1
 PRINT @SMPL + 2
	 RETURN
 PRINT @SMPL + 10;

 --Задание 9
BEGIN TRY
UPDATE AUDITORIUM SET AUDITORIUM.AUDITORIUM = 4325678965879076587965432534657890756
WHERE AUDITORIUM_TYPE = 'ЛК'
END TRY 
BEGIN CATCH
PRINT ERROR_NUMBER()
PRINT ERROR_MESSAGE()
PRINT ERROR_LINE()
PRINT ERROR_PROCEDURE()
PRINT ERROR_SEVERITY()
PRINT ERROR_STATE()
END CATCH
