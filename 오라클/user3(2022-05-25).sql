-- 여기는 user3로 접속한 화면
drop table tbl_student;
drop table tbl_dept;
drop table tbl_belong;

-- 학생정보 테이블
create table tbl_student(
    ST_NUM	    VARCHAR2(8)	    primary key,
    ST_NAME	    NVARCHAR2(15)	not null,
    ST_GRADE	NUMBER(1,0),	    
    ST_TEL	    VARCHAR2(15),	
    ST_ADDR	    NVARCHAR2(255)	
);

--학과정보 테이블
create table tbl_dept(
    D_CODE	VARCHAR2(5) primary key,
    D_NAME	NVARCHAR2(20) not null,
    D_PRO	NVARCHAR2(15),
    D_CLASS	VARCHAR2(5)
);

-- 소속정보 테이블
create table tbl_belong(
    B_SEQ	NUMBER	primary key,
    B_STNUM	VARCHAR2(8)	not null,
    B_DCODE	VARCHAR2(5)	not null,
    unique(B_STNUM, B_DCODE)
);

-- 학생정보 샘플데이터 추가
insert into tbl_student(st_num, st_name, st_grade) values('20220001','홍길동',1);
insert into tbl_student(st_num, st_name, st_grade) values('20220002','이몽룡',3);
insert into tbl_student(st_num, st_name, st_grade) values('20220003','성춘향',2);

-- 학과정보 샘플데이터 추가
insert into tbl_dept(D_CODE,D_NAME,D_PRO,D_CLASS) values('D0001','컴퓨터공학','장영실','505');
insert into tbl_dept(D_CODE,D_NAME,D_PRO,D_CLASS) values('D0002','체육과','임꺽정','501');
insert into tbl_dept(D_CODE,D_NAME,D_PRO,D_CLASS) values('D0003','법학과','장영자','502');

-- 소속정보 샘플데이터 추가
insert into tbl_belong(B_SEQ,B_STNUM,B_DCODE) values(1,'20220001','D0001');
insert into tbl_belong(B_SEQ,B_STNUM,B_DCODE) values(2,'20220002','D0001');
insert into tbl_belong(B_SEQ,B_STNUM,B_DCODE) values(3,'20220002','D0002');
insert into tbl_belong(B_SEQ,B_STNUM,B_DCODE) values(4,'20220003','D0001');
insert into tbl_belong(B_SEQ,B_STNUM,B_DCODE) values(5,'20220003','D0002');
insert into tbl_belong(B_SEQ,B_STNUM,B_DCODE) values(6,'20220003','D0003');

/*
테이블에 일련번호 칼럼이 있을 경우
중복되지 않은 일련번호를 사용하여 PK로 설정한다.
오라클 이외의 다른 DBMS에서는 AUTO INCREMENT 라는 속성을 사용하여
테이터를 import 할때 자동으로 칼럼 데이터를 추가한다.
하지만 오라클은 그러한 속성이 없어서
상당히 불편하다.

오라클에서는 SEQUENCE 라는 특별한 객체가 있어서
그 객체를 사용하여 같은 효과를 발휘한다

또는 PK에 해당하는 칼럼을 문자열 32BYTE 크기로 설정하고
UUID를 사용하기도 한다.
프로그래밍 언어(JAVA, C, PYTHON : 호스트 언어)와 함께
프로젝트를 할때는 UUID를 사용한다.
*/

-- seq_belong 이라는 sequence 객체를 생성하고
-- 시작값을 1로 자동 증가 옵션을 1로 설정하겠다
create SEQUENCE seq_belong
increment by 1 start with 1;

-- seq_belong SEQUENCE 의 NEXTVAL 값을 조회(SELECT) 하라
-- NEXTVAL 값은 호출(SELECT 등)할때마다 항상 1증가된 값을 보여준다.
select seq_belong.nextval from dual;

-- 표준 SQL에서 간단한 4칙연산을 수행하는 방법
-- 오라클에서는 select 명령문이 from 절이 없어 수행하는 것이 불가능하다.
-- 그래서 의미없는(dumy) table인 dual table 을 사용하여 from 절을 붙여준다.
select 10 + 20 from dual;
select 100 * 100 from dual;
select 100 - 10 from dual;
select 50 / 20 from dual;

-- SEQUENCE를 사용하여 자동 증가하는 SEQ를 만들고, INSERT에서 사용하기
insert into tbl_belong(B_SEQ,B_STNUM,B_DCODE) values(seq_belong.nextval,'20220003','D0004');
insert into tbl_belong(B_SEQ,B_STNUM,B_DCODE) values(seq_belong.nextval,'20220003','D0005');
insert into tbl_belong(B_SEQ,B_STNUM,B_DCODE) values(seq_belong.nextval,'20220003','D0006');

SELECT * FROM TBL_BELONG;

-- tbl_student, tbl_dept, tbl_belong 3개의 table left join 하여
-- 학번, 이름, 학과코드, 학과명, 학년을 표시하는 SELECT문 작성

select a.st_num, a.st_name, b.D_CODE, b.D_NAME, a.st_grade
from tbl_student a
    left join tbl_belong c
        on a.st_num = c.B_STNUM
    left join tbl_dept b
        on c.b_dcode = b.d_code;

-- projection(칼럼을 제한하여 보여주기)
select st_num, st_name, st_grade
from tbl_student;
-- 학생정보를 확인하면서 어떤학과에 소속되었는지 알고 싶다
-- 소속은 tbl_belong에 저장되어 있다
select st_num, st_name, st_grade
from tbl_student;

-- 20220001 학생이 어떤 학과 소속인지 알고 싶다
select *
from tbl_belong
where b_stnum = '20220001';

-- 20220001 학생이 소속된 학과가 D0001 인것을 확인했다
-- D0001 학과 이름이 무엇인지 궁금하다.
select * from tbl_dept
where d_code='D0001';

select ST.st_num, ST.st_name, B.b_dcode, C.d_name, ST.st_grade
from tbl_student ST
    left join tbl_belong b
        on B.b_stnum = ST.st_num
    left join tbl_dept c
        on C.d_code = B.b_dcode
order by ST.st_num, b.b_dcode;
        
select ST.st_num, ST.st_name, B.b_dcode, C.d_name, ST.st_grade
from tbl_student ST, tbl_belong b, tbl_dept c
where ST.st_num = B.b_stnum AND B.b_dcode = C.d_code;

-- 학생, 학과, 소속 테이블간에 FK 설정하기
-- 1. FK 설정하기 앞서 참조무결성 관계를 조회하기
-- 다음의 sql의 결과에서 결과가 한개도 없어야 참조무결성 관계가 성립된다.
select ST.st_num, ST.st_name, b.b_seq, B.b_dcode, C.d_name, ST.st_grade
from tbl_student ST
    left join tbl_belong b
        on B.b_stnum = ST.st_num
    left join tbl_dept c
        on C.d_code = B.b_dcode
where st_num is null or d_name is null;

-- 위의 sql 결과 참조 무결성이 성립되지 않는 데이터들은
-- 10, 11, 12 의 seq값을 갖고 있다.
-- 2. 참조무결성이 성립되지 않은 데이터를 삭제한다.
delete from tbl_belong
where b_seq in(10,11,12);

select b_seq, b_stnum, b_dcode, st_num, d_name
from tbl_belong
    left join tbl_student
        on b_stnum = st_num
    left join tbl_dept
        on b_dcode= d_code
where st_num is null or d_name is null;

-- 3. 테이블 간의 참조무결성 제약조건을 부여한다.
-- 참조무결성 제약조건을 테이블에 추가하는데
-- 이때는 Relation 테이블에 추가한다.

-- 테이블에 FK를 추가하여 참조무결성 제약조건을 부여한다.
ALTER TABLE tbl_belong
ADD CONSTRAINT FK_tbl_student
FOREIGN KEY (b_stnum)
REFERENCES tbl_student(st_num);

ALTER TABLE tbl_belong
ADD CONSTRAINT FK_tbl_dept
FOREIGN KEY (b_dcode)
REFERENCES tbl_dept(d_code);

select * from tbl_student;
/*
20220001	홍길동	1		
20220002	이몽룡	3		
20220003	성춘향	2		
*/
select * from tbl_dept;
/*
D0001	컴퓨터공학	장영실	505
D0002	체육과	임꺽정	501
D0003	법학과	장영자	502
*/
select * from tbl_belong;
/*
1	20220001	D0001
2	20220002	D0001
3	20220002	D0002
4	20220003	D0001
5	20220003	D0002
6	20220003	D0003
*/
-- tbl_student 에 아직 추가되지 않은 학번을 belong table에 추가하기
-- tbl_student에 없는 20220004 학번을 추가하려고 했더니
-- parent key not found 오류가 발생한다.
insert into tbl_belong(b_seq, b_stnum, b_dcode) 
values(seq_belong.nextval,'20220004','D0003');
-- 먼저 tbl_student에 해당 학번의 학생정보를 추가해 두어야 한다.
-- tbl_student에 아래 데이터를 추가한 후 다시 위의 sql을 실행하면 정상 추가
insert into tbl_student(st_num, st_name, st_grade)
values('20220004','장보고',2);
-- tbl_belong에 등록된 학번의 정보를 tbl_student에서 삭제하려고 한다.
-- tbl_belong에 등록된 학번이므로 학번의 정보를 삭제할 수 없다.
-- child key found
-- FK를 설정할때
-- parent table 의 데이터를 삭제하려고 할때 child table에 데이터 있으면
-- 보통 삭제 금지.
-- parent table 데이터를 변경(update)하려고 할때 child table에 데이터 있으면
-- 보통 변경 금지.

-- FK의 옵션을 지정하여 parent 의 정보가 삭제되면, child 데이터를 모두 삭제하거나
-- parent 의 데이터가 변경되면 child 데이터를 변경하도록 설정할수 있다.
delete from tbl_student where st_num='20220004';

-- 만약 parent table의 데이터를 일괄 변경하거나, table의 구조를 변경하려고 하면
-- FK를 먼저 제거하고 실행을 해야 한다.
alter table tbl_belong
drop CONSTRAINT FK_tbl_student CASCADE;