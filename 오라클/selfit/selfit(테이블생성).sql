-- 여기는 selfit 사용자 화면
create table tbl_sch(
sc_id		varchar2(4)	primary key	,
sc_num		varchar2(6)	not null	,
sc_label		nvarchar2(10)	not null	,
sc_division		nvarchar2(20)	not null	,
sc_day		varchar2(10)	not null	,
sc_part		nvarchar2(30)	not null	
);

create table tbl_list (
list_id	varchar2(5)		primary key	,
list_name	nvarchar2(125)	not null		
);

drop table tbl_sch_list;
create table tbl_sch_list (
sl_id	varchar2(5)		primary key	,
sl_scid	varchar2(4)	not null		,
sl_listid	varchar2(6)	not null		,
sl_listname	nvarchar2(125)	not null		,
sl_set	number	not null		,
sl_weight	varchar2(10)	not null		,
sl_rep	varchar2(10)	not null			
);

select count(*) from tbl_sch;
select count(*) from tbl_list;
select count(*) from tbl_sch_list;

select * from tbl_sch_list;

drop view view_workout;
create view view_WorkOut
as(
select sl_id,sl_scid, sc_num, sc_label, sc_division, sc_day, sc_part, 
        sl_listid, list_name,
        sl_set, sl_weight, sl_rep
from tbl_sch_list
    left join tbl_sch
        on sc_id=sl_scid
    left join tbl_list
        on list_id = sl_listid
);

select * from view_WorkOut
order by sc_num, sc_day;

select sc_num, sc_label
from view_WorkOut
group by sc_num, sc_label
order by sc_num;

select sc_label
from view_workout
group by sc_label;

select sc_label, sc_part
from view_workout
where sc_label='초급';

-- 운동스케줄 table 에서 등급ID + label + division 이를 묶어서 한개씩만 보고 싶을때
select sc_num, sc_label, sc_division from tbl_sch
group by sc_num, sc_label, sc_division
order by sc_num;

select * from view_workout where sl_scid='D001';



