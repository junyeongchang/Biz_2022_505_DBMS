select * from tbl_post;

insert into tbl_post(
POST_SEQ	,
POST_TITLE	,
POST_CONTENT	,
POST_IMG_BIG	,
POST_IMG_SMALL
) values(
'00001',
'고구마갤럭시',
'맛있다맛있다',
'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00017_2.png',
'http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00017_3.png'
);
UPDATE tbl_post SET 
			POST_TITLE = '칼륨 듬뿍 고구마죽'
WHERE POST_SEQ = '1';



/*
create SEQUENCE seq_belong
increment by 1 start with 1;

select seq_belong.nextval from dual;

insert into tbl_belong(B_SEQ,B_STNUM,B_DCODE) values(seq_belong.nextval,'20220003','D0004');

UPDATE tbl_student SET 
			st_name = #{st_name},
			st_grade = #{st_grade},
			st_addr = #{st_addr},
			st_tel = #{st_tel}
		WHERE st_num = #{st_num}
        
ALTER TABLE tbl_belong
ADD CONSTRAINT FK_tbl_student
FOREIGN KEY (b_stnum)
REFERENCES tbl_student(st_num);

ALTER TABLE tbl_belong
ADD CONSTRAINT FK_tbl_dept
FOREIGN KEY (b_dcode)
REFERENCES tbl_dept(d_code);

select b_seq, b_stnum, b_dcode, st_num, d_name
from tbl_belong
    left join tbl_student
        on b_stnum = st_num
    left join tbl_dept
        on b_dcode= d_code
where st_num is null or d_name is null;
*/