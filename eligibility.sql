****************ELIGIBILITY********************************
CREATE view eligibility_ict12 as
select a.st_id,c.St_first_name,a.status as atten,c.status as CA,if((a.status>79) AND (c.status='pass'),'EL','NOT EL') as EL 
from att_eligibility_ict12 a,CA_ict12 c where a.st_id=c.st_id;

***********************************************************
****************ELIGIBILITY********************************

CREATE view eligibility_ict22 as
select a.st_id,c.St_first_name,a.status as atten,c.status as CA,if((a.status>79) AND (c.status='pass'),'EL','NOT EL') as EL 
from att_eligibility_ict22 a,CA_ict22 c where a.st_id=c.st_id;

***********************************************************
****************ELIGIBILITY********************************

CREATE view eligibility_ict13 as
select a.st_id,c.St_first_name,a.status as atten,c.status as CA,if((a.status>79) AND (c.status='pass'),'EL','NOT EL') as EL 
from att_eligibility_ict13 a,CA_ict13 c where a.st_id=c.st_id;

***********************************************************
****************ELIGIBILITY********************************

CREATE view eligibility_ict14 as
select a.st_id,c.St_first_name,a.status as atten,c.status as CA,if((a.status>79) AND (c.status='pass'),'EL','NOT EL') as EL 
from att_eligibility_ict14 a,CA_ict14 c where a.st_id=c.st_id;

***********************************************************
****************ELIGIBILITY********************************

CREATE view eligibility_et11 as
select a.st_id,c.St_first_name,a.status as atten,c.status as CA,if((a.status>79) AND (c.status='pass'),'EL','NOT EL') as EL 
from att_eligibility_et11 a,CA_et11 c where a.st_id=c.st_id;

***********************************************************
****************ELIGIBILITY********************************

CREATE view eligibility_et12 as
select a.st_id,c.St_first_name,a.status as atten,c.status as CA,if((a.status>79) AND (c.status='pass'),'EL','NOT EL') as EL 
from att_eligibility_et12 a,CA_et12 c where a.st_id=c.st_id;