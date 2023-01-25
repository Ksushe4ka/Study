use Univer
select isnull (TEACHER.TEACHER_NAME, '***')[преподаватель], PULPIT.PULPIT_NAME
from PULPIT left outer join TEACHER
on PULPIT.PULPIT=TEACHER.PULPIT

select isnull (TEACHER.TEACHER_NAME, '***')[преподаватель], PULPIT.PULPIT_NAME
from TEACHER right outer join PULPIT
on PULPIT.PULPIT=TEACHER.PULPIT