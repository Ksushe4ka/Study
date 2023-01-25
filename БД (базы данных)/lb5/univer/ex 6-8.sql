use Univer

SELECT top(1)
(select avg(NOTE) from PROGRESS where PROGRESS.SUBJECT like 'нюХо')[нюхо],
(select avg(NOTE) from PROGRESS where PROGRESS.SUBJECT like 'ад')[ад],
(select avg(NOTE) from PROGRESS where PROGRESS.SUBJECT like 'ясад')[ясад]
FROM PROGRESS;


SELECT * from PROGRESS
SELECT PROGRESS.NOTE from PROGRESS where NOTE >=all(SELECT NOTE from PROGRESS where SUBJECT like 'йц') and PROGRESS.SUBJECT not like 'йц';
SELECT PROGRESS.NOTE from PROGRESS where NOTE >=any(SELECT NOTE from PROGRESS where SUBJECT like 'йц') and PROGRESS.SUBJECT not like 'йц';