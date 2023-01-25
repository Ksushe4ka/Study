	/*4. Разработать два сценария A и B на примере базы данных X_UNIVER. 
Сценарий A представляет собой явную транзакцию с уровнем изолированности READ UNCOMMITED, 
сценарий B – явную транзакцию с уровнем изолированности READ COMMITED (по умолчанию). 
Сценарий A должен демонстрировать, что уровень READ UNCOMMITED допускает неподтвержденное,
неповторяющееся(Неподтвержденное чтение)и фантомное чтение. 
*/

GO
-----A------

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
SELECT @@SPID
BEGIN TRANSACTION
-- Грязное чтение (изоляция)
------------------ T1 ------------------
SELECT * FROM SUBJECT WHERE SUBJECT = 'GEST';
ROLLBACK TRAN;

--COMMIT TRAN;
-------t2---------


/*5. Разработать два сценария A и B на примере базы данных X_UNIVER. (Неповторяющееся чтение)
Сценарии A и В  представля-ют собой явные транзакции с уровнем изолированности READ COMMITED. 
Сценарий A должен демон-стрировать, что уровень READ COMMITED не допускает не-подтвержденного 
чтения, но при этом возможно неповторя-ющееся и фантомное чтение. 
*/

GO
-- A ---
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
BEGIN TRANSACTION
SELECT * FROM SUBJECT WHERE SUBJECT = 'БД';
-------------------------- T1 ------------------
-------------------------- T2 -----------------
SELECT * FROM SUBJECT WHERE SUBJECT = 'БД';
COMMIT TRAN;

rollback

/*6. Разработать два сценария A и B на примере базы данных X_UNIVER. ((фантомное чтение))
Сценарий A представляет собой явную транзакцию с уровнем изолированности REPEATABLE READ. 
Сценарий B – явную транзакцию с уровнем изолированности READ COMMITED. 
Сценарий A должен демонстрировать, что уровень REAPETABLE READ не допускает неподтвержденного
чтения и неповторяющегося чтения, но при этом возможно фантомное чтение. 
*/

GO
-- A ---
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRANSACTION
SELECT COUNT(*) FROM SUBJECT WHERE SUBJECT = 'TEST';
-------------------------- T1 ------------------
-------------------------- T2 -----------------
SELECT COUNT(*) FROM SUBJECT WHERE SUBJECT = 'TEST';
COMMIT TRAN;
rollback




/*7. Разработать два сценария A и B на примере базы данных X_UNIVER. 
Сценарий A представляет собой явную транзакцию с уровнем изолированности SERIALIZABLE. 
Сценарий B – явную транзакцию с уровнем изолированности READ COMMITED.
Сценарий A должен демонстрировать отсутствие фантомного, неподтвержденного и неповторяющегося
чтения. (проблемы изолированности решены)
*/
USE UNIVER;
GO
-- A ---
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
BEGIN TRANSACTION
SELECT * FROM SUBJECT;
-------------------------- T1 -----------------
-------------------------- T2 ------------------
SELECT * FROM SUBJECT;
COMMIT TRAN;
rollback


rollback

