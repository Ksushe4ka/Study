use Univer
SELECT AUDITORIUM, AUDITORIUM_TYPENAME 
FROM AUDITORIUM Inner Join AUDITORIUM_TYPE
ON AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE and AUDITORIUM_TYPE.AUDITORIUM_TYPENAME Like '%?????????%'

select AUDITORIUM, AUDITORIUM_TYPENAME 
from AUDITORIUM, AUDITORIUM_TYPE 
Where AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE and AUDITORIUM_TYPE.AUDITORIUM_TYPENAME Like '%?????????%'