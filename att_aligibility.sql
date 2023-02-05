**************************************************************

create view att_eligibility_ict12 as
select st_id,sum(stat) as stat,sum(medi) as medi,sum((stat+medi)/15)*100 as status from(
select st_id , sum(stat) as stat, sum(medi) as medi
from att_t_ict12 group by st_id


union all

select st_id, sum(stat) as stat, sum(medi) as medi
from att_p_ict12 group by st_id
) as sss  group by st_id;

**************************************************************

create view att_eligibility_ict22 as
select st_id , sum(stat) as stat, sum(medi) as medi,sum((stat+medi)/15)*100 as status
from att_t_ict22 group by st_id;

*************************************************************

create view att_eligibility_ict13 as
select st_id,sum(stat) as stat,sum(medi) as medi,sum((stat+medi)/15)*100 as status from(
select st_id , sum(stat) as stat, sum(medi) as medi
from att_t_ict13 group by st_id


union all

select st_id, sum(stat) as stat, sum(medi) as medi
from att_p_ict13 group by st_id
) as sss  group by st_id;

*************************************************************

create view att_eligibility_ict14 as
select st_id,sum(stat) as stat,sum(medi) as medi,sum((stat+medi)/15)*100 as status from(
select st_id , sum(stat) as stat, sum(medi) as medi
from att_t_ict14 group by st_id


union all

select st_id, sum(stat) as stat, sum(medi) as medi
from att_p_ict14 group by st_id
) as sss  group by st_id;

*************************************************************

create view att_eligibility_et11 as
select st_id,sum(stat) as stat,sum(medi) as medi,sum((stat+medi)/15)*100 as status from(
select st_id , sum(stat) as stat, sum(medi) as medi
from att_t_et11 group by st_id


union all

select st_id, sum(stat) as stat, sum(medi) as medi
from att_p_et11 group by st_id
) as sss  group by st_id;

*************************************************************

create view att_eligibility_et12 as
select st_id,sum(stat) as stat,sum(medi) as medi,sum((stat+medi)/15)*100 as status from(
select st_id , sum(stat) as stat, sum(medi) as medi
from att_t_et12 group by st_id


union all

select st_id, sum(stat) as stat, sum(medi) as medi
from att_p_et12 group by st_id
) as sss  group by st_id;