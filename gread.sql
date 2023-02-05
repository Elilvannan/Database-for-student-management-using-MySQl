************************Gread**************************************
create view final_ict12 as
select s.st_id,s.St_first_name,
case
	when f.mark > 85 then 'A+'
	when f.mark > 80 then 'A'
	when f.mark > 75 then 'A-'
	when f.mark > 70 then 'B+'
	when f.mark > 65 then 'B'
	when f.mark > 60 then 'B-'
	when f.mark > 55 then 'C+'
	when f.mark > 50 then 'C'
	when f.mark > 45 then 'C-'
	when f.mark > 40 then 'D+'
	when f.mark > 35 then 'D'
	when f.mark > 30 then 'D-'
	else 'F'
END as Gread
from student s,f_mark_ict12 f where s.st_id=f.st_id;

*******************************************************************

create view final_ict13 as
select s.st_id,s.St_first_name,
case
	when f.mark > 85 then 'A+'
	when f.mark > 80 then 'A'
	when f.mark > 75 then 'A-'
	when f.mark > 70 then 'B+'
	when f.mark > 65 then 'B'
	when f.mark > 60 then 'B-'
	when f.mark > 55 then 'C+'
	when f.mark > 50 then 'C'
	when f.mark > 45 then 'C-'
	when f.mark > 40 then 'D+'
	when f.mark > 35 then 'D'
	when f.mark > 30 then 'D-'
	else 'F'
END as Gread
from student s,f_mark_ict13 f where s.st_id=f.st_id;

*******************************************************************

create view final_ict14 as
select s.st_id,s.St_first_name,
case
	when f.mark > 85 then 'A+'
	when f.mark > 80 then 'A'
	when f.mark > 75 then 'A-'
	when f.mark > 70 then 'B+'
	when f.mark > 65 then 'B'
	when f.mark > 60 then 'B-'
	when f.mark > 55 then 'C+'
	when f.mark > 50 then 'C'
	when f.mark > 45 then 'C-'
	when f.mark > 40 then 'D+'
	when f.mark > 35 then 'D'
	when f.mark > 30 then 'D-'
	else 'F'
END as Gread
from student s,f_mark_ict14 f where s.st_id=f.st_id;

*******************************************************************

create view final_ict22 as
select s.st_id,s.St_first_name,
case
	when f.mark > 85 then 'A+'
	when f.mark > 80 then 'A'
	when f.mark > 75 then 'A-'
	when f.mark > 70 then 'B+'
	when f.mark > 65 then 'B'
	when f.mark > 60 then 'B-'
	when f.mark > 55 then 'C+'
	when f.mark > 50 then 'C'
	when f.mark > 45 then 'C-'
	when f.mark > 40 then 'D+'
	when f.mark > 35 then 'D'
	when f.mark > 30 then 'D-'
	else 'F'
END as Gread
from student s,f_mark_ict22 f where s.st_id=f.st_id;

*******************************************************************

create view final_et12 as
select s.st_id,s.St_first_name,
case
	when f.mark > 85 then 'A+'
	when f.mark > 80 then 'A'
	when f.mark > 75 then 'A-'
	when f.mark > 70 then 'B+'
	when f.mark > 65 then 'B'
	when f.mark > 60 then 'B-'
	when f.mark > 55 then 'C+'
	when f.mark > 50 then 'C'
	when f.mark > 45 then 'C-'
	when f.mark > 40 then 'D+'
	when f.mark > 35 then 'D'
	when f.mark > 30 then 'D-'
	else 'F'
END as Gread
from student s,f_mark_et12 f where s.st_id=f.st_id;

*******************************************************************

create view final_et11 as
select s.st_id,s.St_first_name,
case
	when f.mark > 85 then 'A+'
	when f.mark > 80 then 'A'
	when f.mark > 75 then 'A-'
	when f.mark > 70 then 'B+'
	when f.mark > 65 then 'B'
	when f.mark > 60 then 'B-'
	when f.mark > 55 then 'C+'
	when f.mark > 50 then 'C'
	when f.mark > 45 then 'C-'
	when f.mark > 40 then 'D+'
	when f.mark > 35 then 'D'
	when f.mark > 30 then 'D-'
	else 'F'
END as Gread
from student s,f_mark_et11 f where s.st_id=f.st_id;