
create view att_ict12 as
select st_id,Dates , if(stat=1,'Present','Absent') as status,"Theory" as Type
from att_t_ict14

union all

select st_id,Dates ,if(stat=1,'Present','Absent') as status ,"Practicat" as Type
from att_p_ict14 order by Dates ASC ;
*****************************************************************************************

create view att_ict14 as
select st_id,Dates , if(stat=1,'Present','Absent') as status,"Theory" as Type
from att_t_ict14

union all

select st_id,Dates ,if(stat=1,'Present','Absent') as status ,"Practicat" as Type
from att_p_ict14 order by Dates ASC ;

*****************************************************************************************

create view att_ict14 as
select st_id,Dates , if(stat=1,'Present','Absent') as status,"Theory" as Type
from att_t_ict14

union all

select st_id,Dates ,if(stat=1,'Present','Absent') as status ,"Practicat" as Type
from att_p_ict14 order by Dates ASC ;
*****************************************************************************************

select st_id,Dates , stat as t_stat, medi as t_medi, null as p_stat, null as p_medi
from att_t_ict12
where st_id = 'ICT001'

union all

select st_id,Dates , null as t_stat, null as t_medi, stat as p_stat, medi as p_medi
from att_p_ict12
where st_id = 'ICT001';

*******************************************************************************************************************

select st_id,Dates,"Theory" as Type_m
from att_t_ict12
where st_id = 'ICT001'

union all

select st_id,Dates ,"Practicat" as Type_m
from att_p_ict12
where st_id = 'ICT001';


****************************************************************************
