--Задание 1
exec sp_helpindex 'AUDITORIUM_TYPE'

CREATE TABLE #EXPLRE
(
TIND int,
TFIELD nvarchar (30)
);
set nocount on -- Не выводим сообщение
declare @i int = 0 
while @i < 100
begin 
insert #EXPLRE (TIND, TFIELD)
values (FLOOR(10000*RAND()), REPLICATE('String' , 3))   --FLOOR возвращает наибольшее целое значение
if (@i%100 = 0 )
print @i
set @i = @i + 1
end;

select * from #EXPLRE where TIND between 1500 and 2500 order by TIND
checkpoint; -- Фиксируем бд
DBCC DROPCLEANBUFFERS; --очистка буферного кэша
create clustered index #EXPLRE_CL on #EXPLRE(TIND ASC)
drop index #EXPLRE_CL on #EXPLRE


--Задание 2
CREATE table #Task_2
(    Key_Index int, 
     CC int identity(1, 1),
     Data_s varchar(100)
);
set nocount on;           
  declare @i2 int = 0;
  while   @i2 < 10000       -- добавление в таблицу 10000 строк
  begin
       INSERT #Task_2(Key_Index, Data_s) values(floor(20000*RAND()), replicate('строка ', 3));
        set @i2 = @i2 + 1; 
  end;

  select * from #Task_2
  checkpoint;
  DBCC DROPCLEANBUFFERS
  create index #Index on #Task_2 (Key_Index, CC)
  Select * from #Task_2 where Key_Index > 5500 and Key_Index = 9901
  drop index #Index on #Task_2


  --Задание 3
  CREATE table #Task_3
(    Key_Index int, 
     CC int identity(1, 1),
     Data_s varchar(100)
);
set nocount on;           
  declare @i3 int = 0;
  while   @i3 < 10000       -- добавление в таблицу 10000 строк
  begin
       INSERT #Task_3(Key_Index, Data_s) values(floor(20000*RAND()), replicate('строка ', 3));
        set @i3 = @i3 + 1; 
  end;

  select * from #Task_3
  checkpoint;
  DBCC DROPCLEANBUFFERS
  create index #Index on #Task_3 (Key_Index) INCLUDE (Data_s)
  Select Data_s from #Task_3 where Key_Index > 5500 
  drop index #Index on #Task_3


  --Задание 4
  CREATE table #Task_4
(    Key_Index int, 
     CC int identity(1, 1),
     Data_s varchar(100)
);
set nocount on;           
  declare @i4 int = 0;
  while   @i4 < 10000       -- добавление в таблицу 10000 строк
  begin
       INSERT #Task_4(Key_Index, Data_s) values(floor(20000*RAND()), replicate('строка ', 3));
        set @i4 = @i4 + 1; 
  end;

  select * from #Task_4
  checkpoint;
  DBCC DROPCLEANBUFFERS
  Select Key_Index from #Task_4 where Key_Index > 5000 and Key_Index < 6000
  create index Index_s on #Task_4 (Key_Index) where Key_Index > 5000 and Key_Index < 6000
  drop index Index_s on #Task_4


  --Задание 5
  CREATE TABLE #TASK5
(
INFO NVARCHAR (20),
ITERATOR INT IDENTITY(1,1),
INDEX_ INT
)
DECLARE @X INT =0;
WHILE @X <= 10000
BEGIN
INSERT INTO #TASK5(INFO,INDEX_)
VALUES ('СТРОКА' + CAST(@X AS NVARCHAR),FLOOR(20000*RAND()))   
SET @X +=1;
END

CHECKPOINT;
DBCC DROPCLEANBUFFERS
CREATE INDEX #TASK5_KEY ON #TASK5(INDEX_)

SELECT name [ИНДЕКС], avg_fragmentation_in_percent [ФРАГМЕНТАЦИЯ (%)]
FROM sys.dm_db_index_physical_stats(DB_ID(N'TEMPDB'),   -- Возвращает информацию о размере и фрагментации для данных и индексов указанной таблицы
OBJECT_ID(N'#TASK5'), NULL, NULL, NULL) ss
JOIN sys.indexes ii ON ss.object_id = ii.object_id AND ss.index_id = ii.index_id WHERE name is not null;
--Содержит строку на индекс или кучу табличного объекта, такого как таблица, представление или функция, возвращающая табличное значение.

INSERT TOP(10000) #TASK5(INDEX_ ,INFO) SELECT INDEX_, INFO FROM #TASK5
DROP INDEX #TASK5_KEY ON #TASK5 
ALTER INDEX #TASK5_KEY ON #TASK5 REORGANIZE -- Реорганиазция
ALTER INDEX #TASK5_KEY ON #TASK5 REBUILD WITH (ONLINE = OFF) -- Перестройка


--Задание 6
CREATE TABLE #TASK6
(
INFO NVARCHAR (20),
ITERATOR INT IDENTITY(1,1),
INDEX_ INT
)
DECLARE @X1 INT =0;
WHILE @X1 <= 10000
BEGIN
INSERT INTO #TASK6(INFO,INDEX_)
VALUES ('СТРОКА' + CAST(@X1 AS NVARCHAR),FLOOR(20000*RAND()))
SET @X1 +=1;
END

CREATE INDEX #TASK6_TKEY ON #TASK6(INDEX_) WITH FILLFACTOR = 65
INSERT TOP(50) PERCENT #TASK6(INDEX_, INFO)
SELECT INDEX_, INFO FROM #TASK6

SELECT NAME [Индекс], AVG_FRAGMENTATION_IN_PERCENT [Фрагментация (%)]
FROM SYS.DM_DB_INDEX_PHYSICAL_STATS(DB_ID(N'TEMPDB'),
OBJECT_ID(N'#TASK6'), NULL, NULL, NULL) SS
JOIN SYS.INDEXES II ON SS.OBJECT_ID = II.OBJECT_ID AND SS.INDEX_ID = II.INDEX_ID WHERE NAME IS NOT NULL;

DROP INDEX #TASK6_TKEY ON #TASK6
ALTER INDEX #TASK6_KEY ON #TASK6 REORGANIZE -- Реорганиазция
ALTER INDEX #TASK6_KEY ON #TASK6 REBUILD WITH (ONLINE = OFF) -- Перестройка	