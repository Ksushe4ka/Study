use Univer

select AUDITORIUM_CAPACITY, AUDITORIUM_NAME from AUDITORIUM a
	where a.AUDITORIUM_NAME = (select top(1) AUDITORIUM_NAME from AUDITORIUM aa
			where a.AUDITORIUM_NAME = aa.AUDITORIUM_NAME ) order by AUDITORIUM_CAPACITY desc

select FACULTY.FACULTY_NAME from FACULTY where exists (select * from PULPIT where PULPIT.FACULTY = FACULTY.FACULTY);