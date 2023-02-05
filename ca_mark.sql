**************************************************************
*****CA(it shut be more than 40% (30*40/100))******************

create view CA_ict12 as
select   s.st_id,s.St_first_name,
	case
		when q.Q1 < q.Q2 AND q.Q1 < q.Q3 then (((q.Q2+q.Q3)/200)*10)
		when q.Q2 < q.Q3  then ((q.Q1+q.Q3)/200)*10
		else ((q.Q2+q.Q1)/200)*10
	END +
	case
		when a.A1 < a.A2 AND a.A1 < a.A3 then ((a.A2+a.A3)/200)*20          
		when a.A2 < a.A3  then ((a.A1+a.A3)/200)*20
		else ((a.A2+a.A1)/200)*20
	END as mark
	,if(
	case
		when q.Q1 < q.Q2 AND q.Q1 < q.Q3 then (((q.Q2+q.Q3)/200)*10)
		when q.Q2 < q.Q3  then ((q.Q1+q.Q3)/200)*10
		else ((q.Q2+q.Q1)/200)*10
	END +
	case
		when a.A1 < a.A2 AND a.A1 < a.A3 then ((a.A2+a.A3)/200)*20          
		when a.A2 < a.A3  then ((a.A1+a.A3)/200)*20
		else ((a.A2+a.A1)/200)*20
	END  >= (30*40)/100,'Pass','Fail' ) as status
from q_ict12 q,student s,a_ict12 a where s.st_id=q.st_id AND s.st_id=a.st_id;

**************************************************************
****************CA(it shut be morethan 40% (30*40/100))*******

create view CA_ict22 as 
select   s.st_id,s.St_first_name,
    case
		when q.Q1 < q.Q2 AND q.Q1 < q.Q3 AND q.Q1 < q.Q4 then (((q.Q2+q.Q3+q.Q4)/300)*10)
		when q.Q2 < q.Q3 AND q.Q2 < q.Q4 then ((q.Q1+q.Q3+q.Q4)/300)*10
		when q.Q3 < q.Q4 then ((q.Q1+q.Q2+q.Q4)/300)*10
		else ((q.Q2+q.Q1+q.Q4)/300)*10
	END +
	(((a.A1+a.A2)/200)*10)+((m.m_mark+m.m_p_mark)/200)*20 as mark,
	if(
	 case
		when q.Q1 < q.Q2 AND q.Q1 < q.Q3 AND q.Q1 < q.Q4 then (((q.Q2+q.Q3+q.Q4)/300)*10)
		when q.Q2 < q.Q3 AND q.Q2 < q.Q4 then ((q.Q1+q.Q3+q.Q4)/300)*10
		when q.Q3 < q.Q4 then ((q.Q1+q.Q2+q.Q4)/300)*10
		else ((q.Q2+q.Q1+q.Q4)/300)*10
	END +
	(((a.A1+a.A2)/200)*10)+((m.m_mark+m.m_p_mark)/200)*20 >(40*40)/100,'pass','fail')as status
from q_ict22 q,student s,a_ict22 a,final_t_ict22 ft,m_ict22 m where s.st_id=q.st_id AND s.st_id=a.st_id AND s.st_id=ft.st_id AND s.st_id=m.st_id;

**************************************************************
****************CA(it shut be morethan 40% (30*40/100))*******

create view CA_ict13 as 
select   s.st_id,s.St_first_name,
	case
		when q.Q1 < q.Q2 AND q.Q1 < q.Q3 then (((q.Q2+q.Q3)/200)*10)
		when q.Q2 < q.Q3  then ((q.Q1+q.Q3)/200)*10
		else ((q.Q2+q.Q1)/200)*10
	END +
	case
		when a.A1 < a.A2 AND a.A1 < a.A3 then ((a.A2+a.A3)/200)*20          
		when a.A2 < a.A3  then ((a.A1+a.A3)/200)*20
		else ((a.A2+a.A1)/200)*20
	END as mark,
	if(
	case
		when q.Q1 < q.Q2 AND q.Q1 < q.Q3 then (((q.Q2+q.Q3)/200)*10)
		when q.Q2 < q.Q3  then ((q.Q1+q.Q3)/200)*10
		else ((q.Q2+q.Q1)/200)*10
	END +
	case
		when a.A1 < a.A2 AND a.A1 < a.A3 then ((a.A2+a.A3)/200)*20          
		when a.A2 < a.A3  then ((a.A1+a.A3)/200)*20
		else ((a.A2+a.A1)/200)*20
	END > (30*40)/100,'pass','fail') as status
from q_ict13 q,student s,a_ict13 a,final_t_ict13 ft,final_p_ict13 fp where s.st_id=q.st_id AND s.st_id=a.st_id AND s.st_id=ft.st_id AND s.st_id=fp.st_id;

**************************************************************
************CA(it shut be morethan 40% (30*40/100))**********

create view CA_ict14 as 
select   s.st_id,s.St_first_name,
	case
		when q.Q1 < q.Q2 AND q.Q1 < q.Q3 then (((q.Q2+q.Q3)/200)*10)
		when q.Q2 < q.Q3  then ((q.Q1+q.Q3)/200)*10
		else ((q.Q2+q.Q1)/200)*10
	END +((m.m_mark+m.m_p_mark)/200)*20  as mark,
	if(
	case
		when q.Q1 < q.Q2 AND q.Q1 < q.Q3 then (((q.Q2+q.Q3)/200)*10)
		when q.Q2 < q.Q3  then ((q.Q1+q.Q3)/200)*10
		else ((q.Q2+q.Q1)/200)*10
	END +((m.m_mark+m.m_p_mark)/200)*20> (30*40)/100,'pass','fail') as status
from q_ict13 q,student s,final_t_ict13 ft,final_p_ict13 fp,m_ict14 m where s.st_id=q.st_id AND s.st_id=ft.st_id AND s.st_id=fp.st_id AND s.st_id=m.st_id;

**************************************************************
************CA(it shut be morethan 40% (30*40/100))**********

create view CA_et11 as 
select   s.st_id,s.St_first_name,
	case
		when q.Q1 < q.Q2 AND q.Q1 < q.Q3 then (((q.Q2+q.Q3)/200)*10)
		when q.Q2 < q.Q3  then ((q.Q1+q.Q3)/200)*10
		else ((q.Q2+q.Q1)/200)*10
	END +
    case
		when a.A1 < a.A2 AND a.A1 < a.A3 then ((a.A2+a.A3)/200)*20          
		when a.A2 < a.A3  then ((a.A1+a.A3)/200)*20
		else ((a.A2+a.A1)/200)*20
	END as mark,
	if(
	case
		when q.Q1 < q.Q2 AND q.Q1 < q.Q3 then (((q.Q2+q.Q3)/200)*10)
		when q.Q2 < q.Q3  then ((q.Q1+q.Q3)/200)*10
		else ((q.Q2+q.Q1)/200)*10
	END +
    case
		when a.A1 < a.A2 AND a.A1 < a.A3 then ((a.A2+a.A3)/200)*20          
		when a.A2 < a.A3  then ((a.A1+a.A3)/200)*20
		else ((a.A2+a.A1)/200)*20
	END > (30*40)/100,'pass','fail') as status
from q_et11 q,student s,a_et11 a where s.st_id=q.st_id AND s.st_id=a.st_id;

**************************************************************
************CA(it shut be morethan 40% (30*40/100))**********

create view CA_et12 as 
select   s.st_id,s.St_first_name,
	case
		when q.Q1 < q.Q2 AND q.Q1 < q.Q3 then (((q.Q2+q.Q3)/200)*10)
		when q.Q2 < q.Q3  then ((q.Q1+q.Q3)/200)*10
		else ((q.Q2+q.Q1)/200)*10
	END + ((m.m_mark*20)/100) as mark,
	if(
	case
		when q.Q1 < q.Q2 AND q.Q1 < q.Q3 then (((q.Q2+q.Q3)/200)*10)
		when q.Q2 < q.Q3  then ((q.Q1+q.Q3)/200)*10
		else ((q.Q2+q.Q1)/200)*10
	END + ((m.m_mark*20)/100)> (30*40)/100,'pass','fail') as status
from q_et12 q,student s,m_et12 m where s.st_id=q.st_id AND s.st_id=m.st_id;

**************************************************************
**************************************************************