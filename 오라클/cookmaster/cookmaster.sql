select * from tbl_post;
select * from tbl_recipe;

create SEQUENCE seq_belong
increment by 1 start with 1;

insert into tbl_post(
post_seq	,
POST_TITLE	,
POST_CONTENT	,
POST_IMG_BIG	,
POST_IMG_SMALL
) values(
seq_belong.nextval,
'고구마갤럭시',
'맛있다맛있다너무 맛있담ㄴ이루먖두리누',
'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00017_2.png',
'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00017_3.png'
);

insert into tbl_recipe (
RCP_SEQ	,
HASH_TAG	,
rcp_contents
RCP_PARTS_DTLS	
) values(
seq_belong.nextval,
500,
'고구마',
'고구마죽 고구마 100g(2/3개), 설탕 2g(1/3작은술), 찹쌀가루 3g(2/3작은술),물 200ml(1컵), 잣 8g(8알)'
);

insert into tbl_manual (
MANUAL_SEQ,
RCP_SEQ,
MANUAL,
MANUAL_IMG,
MANUAL_NUM
) values(
seq_belong.nextval,
2,
'1. 고구마는 깨끗이 씻어서 껍질을 벗기고 4cm 정도로 잘라준다.',
'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00017_1.png',
1
);

insert into tbl_manual (
MANUAL_SEQ,
RCP_SEQ,
MANUAL,
MANUAL_IMG,
MANUAL_NUM
) values(
seq_belong.nextval,
2,
'2. 찜기에 고구마를 넣고 20~30분 정도 삶아 주고, 블렌더나 체를 이용하여 잘 으깨어 곱게 만든다.',
'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00017_2.png<',
2
);
insert into tbl_manual (
MANUAL_SEQ,
RCP_SEQ,
MANUAL,
MANUAL_IMG,
MANUAL_NUM
) values(
seq_belong.nextval,
2,
'3. 고구마와 물을 섞어 끓이면서 찹쌀가루로 농도를 맞추고 설탕을 넣어 맛을 낸다.',
'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00017_3.png',
3
);
insert into tbl_manual (
MANUAL_SEQ,
RCP_SEQ,
MANUAL,
MANUAL_IMG,
MANUAL_NUM
) values(
seq_belong.nextval,
2,
'4. 잣을 팬에 노릇하게 볶아 다져서 고구마 죽에 섞는다. 기호에 따라 고구마를 튀겨 얹어 먹어도 좋다.',
'http://www.foodsafetykorea.go.kr/uploadimg/cook/10_00017_2.png',
4
);

select * from tbl_manual;

commit;

insert into tbl_user (
U_USERNAME,
U_PASSWORD,
U_NICKNAME,
U_NAME,
U_EMAIL,
U_ROLE
) values (
'asdf01',
'asdfasdf',
'asdf01',
'홍길동',
'asdf01@asdf01.com',
'guest'
);
insert into tbl_user (
U_USERNAME,
U_PASSWORD,
U_NICKNAME,
U_NAME,
U_EMAIL,
U_ROLE
) values (
'asdf04',
'asdfasdf',
'asdf04',
'성춘향',
'asdf04@asdf04.com',
'guest'
);

insert into tbl_registerdate (
C_SEQ,
R_DATE,
C_USERNAME,
C_POST_SEQ
) values (
seq_belong.nextval,
'20220609:17:41',
'asdf03',
'1'
);

select * from tbl_user;
select * from tbl_registerdate;

select u.username, p.post_title, , , 
from tbl_user as u
    left join tbl_registerdate as r
        on u.username = r.c_username
    left join tbl_post as p
        on p.post_seq = r.c_post_seq
    left join tbl_recipe as re
        on re.rcp_seq=p.manual_seq
    left join tbl_manul as m
        on m.rcp_seq =  re.rcp_seq;


