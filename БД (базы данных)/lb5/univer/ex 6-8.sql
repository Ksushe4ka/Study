use Univer

SELECT top(1)
(select avg(NOTE) from PROGRESS where PROGRESS.SUBJECT like '����')[����],
(select avg(NOTE) from PROGRESS where PROGRESS.SUBJECT like '��')[��],
(select avg(NOTE) from PROGRESS where PROGRESS.SUBJECT like '����')[����]
FROM PROGRESS;


SELECT * from PROGRESS
SELECT PROGRESS.NOTE from PROGRESS where NOTE >=all(SELECT NOTE from PROGRESS where SUBJECT like '��') and PROGRESS.SUBJECT not like '��';
SELECT PROGRESS.NOTE from PROGRESS where NOTE >=any(SELECT NOTE from PROGRESS where SUBJECT like '��') and PROGRESS.SUBJECT not like '��';