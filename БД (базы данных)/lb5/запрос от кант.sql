select NOTE,SUBJECT from PROGRESS a
	where a.SUBJECT = (select top(1) SUBJECT from PROGRESS aa
			where SUBJECT like 'ясад' ) 