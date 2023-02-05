*****************************************************************************

create view f_mark_ict12 as
select   s.st_id,s.St_first_name,round(
	case
		when q.Q1 < q.Q2 AND q.Q1 < q.Q3 then (((q.Q2+q.Q3)/200)*10)
		when q.Q2 < q.Q3  then ((q.Q1+q.Q3)/200)*10
		else ((q.Q2+q.Q1)/200)*10
	END +
	case
		when a.A1 < a.A2 AND a.A1 < a.A3 then ((a.A2+a.A3)/200)*20          
		when a.A2 < a.A3  then ((a.A1+a.A3)/200)*20
		else ((a.A2+a.A1)/200)*20
	END +((ft.f_mark*40)/100)+((fp.f_mark*30)/100)) as mark
from q_ict12 q,student s,a_ict12 a,final_t_ict12 ft,final_p_ict12 fp where s.st_id=q.st_id AND s.st_id=a.st_id AND s.st_id=ft.st_id AND s.st_id=fp.st_id;

************************************************************************************

create view f_mark_ict22 as 
select   s.st_id,s.St_first_name,round(
    case
		when q.Q1 < q.Q2 AND q.Q1 < q.Q3 AND q.Q1 < q.Q4 then (((q.Q2+q.Q3+q.Q4)/300)*10)
		when q.Q2 < q.Q3 AND q.Q2 < q.Q4 then ((q.Q1+q.Q3+q.Q4)/300)*10
		when q.Q3 < q.Q4 then ((q.Q1+q.Q2+q.Q4)/300)*10
		else ((q.Q2+q.Q1+q.Q4)/300)*10
	END +
	(((a.A1+a.A2)/200)*10)+((ft.f_mark*60)/100)+((m.m_mark+m.m_p_mark)/200)*20) as mark
from q_ict22 q,student s,a_ict22 a,final_t_ict22 ft,m_ict22 m where s.st_id=q.st_id AND s.st_id=a.st_id AND s.st_id=ft.st_id AND s.st_id=m.st_id;

**************************************************************

create view f_mark_ict13 as 
select   s.st_id,s.St_first_name,round(
	case
		when q.Q1 < q.Q2 AND q.Q1 < q.Q3 then (((q.Q2+q.Q3)/200)*10)
		when q.Q2 < q.Q3  then ((q.Q1+q.Q3)/200)*10
		else ((q.Q2+q.Q1)/200)*10
	END +
	case
		when a.A1 < a.A2 AND a.A1 < a.A3 then ((a.A2+a.A3)/200)*20          
		when a.A2 < a.A3  then ((a.A1+a.A3)/200)*20
		else ((a.A2+a.A1)/200)*20
	END +((ft.f_mark*40)/100)+((fp.f_mark*30)/100)) as mark
from q_ict13 q,student s,a_ict13 a,final_t_ict13 ft,final_p_ict13 fp where s.st_id=q.st_id AND s.st_id=a.st_id AND s.st_id=ft.st_id AND s.st_id=fp.st_id;

**************************************************************

create view f_mark_ict14 as 
select   s.st_id,s.St_first_name,round(
	case
		when q.Q1 < q.Q2 AND q.Q1 < q.Q3 then (((q.Q2+q.Q3)/200)*10)
		when q.Q2 < q.Q3  then ((q.Q1+q.Q3)/200)*10
		else ((q.Q2+q.Q1)/200)*10
	END +
    ((ft.f_mark*40)/100)+((fp.f_mark*30)/100)+((m.m_mark+m.m_p_mark)/200)*20)  as mark
from q_ict13 q,student s,final_t_ict13 ft,final_p_ict13 fp,m_ict14 m where s.st_id=q.st_id AND s.st_id=ft.st_id AND s.st_id=fp.st_id AND s.st_id=m.st_id;

**************************************************************

create view f_mark_et11 as 
select   s.st_id,s.St_first_name,round(
	case
		when q.Q1 < q.Q2 AND q.Q1 < q.Q3 then (((q.Q2+q.Q3)/200)*10)
		when q.Q2 < q.Q3  then ((q.Q1+q.Q3)/200)*10
		else ((q.Q2+q.Q1)/200)*10
	END +
    case
		when a.A1 < a.A2 AND a.A1 < a.A3 then ((a.A2+a.A3)/200)*20          
		when a.A2 < a.A3  then ((a.A1+a.A3)/200)*20
		else ((a.A2+a.A1)/200)*20
	END +
    ((ft.f_mark*30)/100)+((fp.f_mark*40)/100)) as mark
from q_et11 q,student s,final_t_et11 ft,final_p_et11 fp,a_et11 a where s.st_id=q.st_id AND s.st_id=ft.st_id AND s.st_id=fp.st_id  AND s.st_id=a.st_id;

*************************************************************

create view f_mark_et12 as 
select   s.st_id,s.St_first_name,round(
	case
		when q.Q1 < q.Q2 AND q.Q1 < q.Q3 then (((q.Q2+q.Q3)/200)*10)
		when q.Q2 < q.Q3  then ((q.Q1+q.Q3)/200)*10
		else ((q.Q2+q.Q1)/200)*10
	END +
    ((ft.f_mark*40)/100)+((fp.f_mark*30)/100)+((m.m_mark*20)/100)) as mark
from q_et12 q,student s,final_t_et12 ft,final_p_et12 fp,m_et12 m where s.st_id=q.st_id AND s.st_id=ft.st_id AND s.st_id=fp.st_id AND s.st_id=m.st_id;

*******************************************************************


*******************************************************************

***************************************************************************************************
							All student mark
select s.st_id,it12.Gread as it12,it13.Gread as it13,it14.Gread as it14,it22.Gread as it14 from student s,final_ict12 it12,final_ict13 it13,final_ict14 it14,final_ict22 it22 where s.st_id=it12.st_id AND s.st_id=it13.st_id AND s.st_id=it14.st_id AND s.st_id=it22.st_id;


