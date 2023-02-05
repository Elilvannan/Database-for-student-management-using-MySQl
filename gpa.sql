*************************GPA************************************
create view gpa_ict12 as
select s.st_id,s.St_first_name,
	case	
		when f.Gread = 'A+' then (4.0*2)
        when f.Gread = 'A' then (4.0*2)
	    when f.Gread = 'A-' then (3.7*2)
	    when f.Gread = 'B+' then (3.3*2)
	    when f.Gread = 'B' then  (3.0*2)
	    when f.Gread = 'B-' then (2.7*2)
	    when f.Gread = 'C+' then (2.3*2)
	    when f.Gread = 'C' then  (2.0*2)
	    when f.Gread = 'C-' then (1.7*2)
	    when f.Gread = 'D+' then (1.3*2)
	    when f.Gread = 'D' then  (1.0*2)
	    when f.Gread = 'D-' then (0.7*2)
        else
            (0.0*2)/2
END as gpa
from student s,final_ict12 f where s.st_id=f.st_id;
*******************************************************************

create view gpa_ict13 as
select s.st_id,s.St_first_name,
	case	
		when f.Gread = 'A+' then (4.0*3)
        when f.Gread = 'A' then (4.0*3)
	    when f.Gread = 'A-' then (3.7*3)
	    when f.Gread = 'B+' then (3.3*3)
	    when f.Gread = 'B' then  (3.0*3)
	    when f.Gread = 'B-' then (2.7*3)
	    when f.Gread = 'C+' then (2.3*3)
	    when f.Gread = 'C' then  (2.0*3)
	    when f.Gread = 'C-' then (1.7*3)
	    when f.Gread = 'D+' then (1.3*3)
	    when f.Gread = 'D' then  (1.0*3)
	    when f.Gread = 'D-' then (0.7*3)
        else
            (0.0*2)/2
END as gpa
from student s,final_ict13 f where s.st_id=f.st_id;
*******************************************************************

create view gpa_ict22 as
select s.st_id,s.St_first_name,
	case	
		when f.Gread = 'A+' then (4.0*2)
        when f.Gread = 'A' then (4.0*2)
	    when f.Gread = 'A-' then (3.7*2)
	    when f.Gread = 'B+' then (3.3*2)
	    when f.Gread = 'B' then  (3.0*2)
	    when f.Gread = 'B-' then (2.7*2)
	    when f.Gread = 'C+' then (2.3*2)
	    when f.Gread = 'C' then  (2.0*2)
	    when f.Gread = 'C-' then (1.7*2)
	    when f.Gread = 'D+' then (1.3*2)
	    when f.Gread = 'D' then  (1.0*2)
	    when f.Gread = 'D-' then (0.7*2)
        else
            (0.0*2)/2
END as gpa
from student s,final_ict22 f where s.st_id=f.st_id;
*******************************************************************

create view gpa_ict14 as
select s.st_id,s.St_first_name,
	case	
		when f.Gread = 'A+' then (4.0*4)
        when f.Gread = 'A' then (4.0*4)
	    when f.Gread = 'A-' then (3.7*4)
	    when f.Gread = 'B+' then (3.3*4)
	    when f.Gread = 'B' then  (3.0*4)
	    when f.Gread = 'B-' then (2.7*4)
	    when f.Gread = 'C+' then (2.3*4)
	    when f.Gread = 'C' then  (2.0*4)
	    when f.Gread = 'C-' then (1.7*4)
	    when f.Gread = 'D+' then (1.3*4)
	    when f.Gread = 'D' then  (1.0*4)
	    when f.Gread = 'D-' then (0.7*4)
        else
            (0.0*2)/2
END as gpa
from student s,final_ict14 f where s.st_id=f.st_id;
*******************************************************************

create view gpa_et11 as
select s.st_id,s.St_first_name,
	case	
		when f.Gread = 'A+' then (4.0*1)
        when f.Gread = 'A' then (4.0*1)
	    when f.Gread = 'A-' then (3.7*1)
	    when f.Gread = 'B+' then (3.3*1)
	    when f.Gread = 'B' then  (3.0*1)
	    when f.Gread = 'B-' then (2.7*1)
	    when f.Gread = 'C+' then (2.3*1)
	    when f.Gread = 'C' then  (2.0*1)
	    when f.Gread = 'C-' then (1.7*1)
	    when f.Gread = 'D+' then (1.3*1)
	    when f.Gread = 'D' then  (1.0*1)
	    when f.Gread = 'D-' then (0.7*1)
        else
            (0.0*2)/2
END as gpa
from student s,final_et11 f where s.st_id=f.st_id;

*******************************************************************

create view gpa_et12 as
select s.st_id,s.St_first_name,
	case	
		when f.Gread = 'A+' then (4.0*2)
        when f.Gread = 'A' then (4.0*2)
	    when f.Gread = 'A-' then (3.7*2)
	    when f.Gread = 'B+' then (3.3*2)
	    when f.Gread = 'B' then  (3.0*2)
	    when f.Gread = 'B-' then (2.7*2)
	    when f.Gread = 'C+' then (2.3*2)
	    when f.Gread = 'C' then  (2.0*2)
	    when f.Gread = 'C-' then (1.7*2)
	    when f.Gread = 'D+' then (1.3*2)
	    when f.Gread = 'D' then  (1.0*2)
	    when f.Gread = 'D-' then (0.7*2)
        else
            (0.0*2)/2
END as gpa
from student s,final_et12 f where s.st_id=f.st_id;

*******************************************************************
***************************final SGPA*******************************
create view sgpait as
select s.st_id,s.St_first_name,round((it12.gpa+it13.gpa+it14.gpa+it22.gpa)/11,2) as GPA
from  gpa_ict12 it12,gpa_ict13 it13,gpa_ict22 it22,gpa_ict14 it14,student s where s.st_id=it12.st_id AND s.st_id=it13.st_id AND
s.st_id=it14.st_id AND s.st_id=it22.st_id;

***********************************************************
create view sgpaet as
select s.st_id,s.St_first_name,round((et11.gpa+et12.gpa)/3,2) as GPA
from gpa_et12 et12,gpa_et11 et11,student s where s.st_id=et12.st_id AND s.st_id=et11.st_id;

*********************************************************************************************
*******************************Final CGPA****************************************************
(remove ict22)

create view cgpait as
select s.st_id,s.St_first_name,round((it12.gpa+it13.gpa+it14.gpa)/9,2) as GPA
from  gpa_ict12 it12,gpa_ict13 it13,gpa_ict14 it14,student s where s.st_id=it12.st_id AND s.st_id=it13.st_id AND
s.st_id=it14.st_id;

*********************************************************************************************
