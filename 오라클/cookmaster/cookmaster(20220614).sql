
drop table tbl_recipe;
create table tbl_recipe(
RCP_SEQ		number			PRIMARY KEY	,  -- 일련번호
RCP_NM		nVARCHAR2(125)		not null,  -- 요리이름
rcp_content	nVARCHAR2(1000)		,          -- 요리설명
ATT_FILE_NO_MK		VARCHAR2(500)	,      -- 사진
INFO_ENG		    NUMBER(5)		,      -- 열량
RCP_PARTS_DTLS		nVARCHAR2(1000)	,      -- 재료정보
HASH_TAG	    nVARCHAR2(200)	,          -- 해쉬태그
POST_STAR  number                       -- 별점
);
drop table tbl_recipe;
select * from tbl_recipe;
create SEQUENCE seq_recipe start with 1 increment by 1;
select seq_recipe.nextval from dual;
insert into tbl_recipe(
RCP_SEQ,
RCP_NM,
rcp_content,
ATT_FILE_NO_MK,
INFO_ENG,
RCP_PARTS_DTLS,
HASH_TAG,
POST_STAR
) values(
seq_recipe.nextval,
'고구마갤럭시',
'맛있다맛있다맛있다맛있다맛있다맛있다맛있다맛있다맛있다맛있다맛있다맛있다vv맛있다맛있다맛있다맛있다맛있다맛있다맛있다맛있다맛있다맛있다맛있다맛있다맛있다맛있다',
'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00017_2.png',
'500',
'고구마죽 고구마 100g(2/3개), 설탕 2g(1/3작은술), 찹쌀가루 3g(2/3작은술),물 200ml(1컵), 잣 8g(8알)',
'고구마',
'3'
);


drop table tbl_recipe_manual;
create table tbl_recipe_manual(
manual_seq		VARCHAR2(10)			PRIMARY KEY	,
RCP_SEQ		VARCHAR2(10)		NOT NULL		,
manual		    nVARCHAR2(200)				,
manual_img      nVARCHAR2(500)				,
manual_num		NUMBER(2)				
);
select * from tbl_recipe_manual;
create SEQUENCE seq_manual start with 1 increment by 1;
select seq_manual.nextval from dual;


insert into tbl_recipe_manual (
manual_seq,
RCP_SEQ,
MANUAL,
MANUAL_IMG,
MANUAL_NUM
) values(
seq_manual.nextval,
22,
'1. 고구마는 깨끗이 씻어서 껍질을 벗기고 4cm 정도로 잘라준다.',
'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00017_1.png',
1
);
insert into tbl_recipe_manual (
manual_seq,
RCP_SEQ,
MANUAL,
MANUAL_IMG,
MANUAL_NUM
) values(
seq_manual.nextval,
22,
'2. 찜기에 고구마를 넣고 20~30분 정도 삶아 주고, 블렌더나 체를 이용하여 잘 으깨어 곱게 만든다.',
'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00017_2.png<',
2
);
insert into tbl_recipe_manual (
manual_seq,
RCP_SEQ,
MANUAL,
MANUAL_IMG,
MANUAL_NUM
) values(
seq_manual.nextval,
22,
'3. 고구마와 물을 섞어 끓이면서 찹쌀가루로 농도를 맞추고 설탕을 넣어 맛을 낸다.',
'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00017_3.png',
3
);
insert into tbl_recipe_manual (
manual_seq,
RCP_SEQ,
MANUAL,
MANUAL_IMG,
MANUAL_NUM
) values(
seq_manual.nextval,
22,
'4. 잣을 팬에 노릇하게 볶아 다져서 고구마 죽에 섞는다. 기호에 따라 고구마를 튀겨 얹어 먹어도 좋다.',
'http://www.foodsafetykorea.go.kr/uploadimg/cook/10_00017_2.png',
4
);

commit;



