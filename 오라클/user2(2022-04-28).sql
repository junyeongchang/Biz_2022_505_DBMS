-- 여기는 user2 화면
/*
처음으로 데이터를 저장하기 위해서 할 일
1. 등론된 사용자로 접속하기
2. 테이블 생성
*/

CREATE TABLE tbl_student (
	st_num      VARCHAR2(5)	    PRIMARY KEY,
	st_name	    nVARCHAR2(20)	NOT NULL,
	st_tel	    VARCHAR2(15)	UNIQUE NOT NULL,
	st_addr	    nVARCHAR2(125)	NULL,
	st_dept	    nVARCHAR2(5)	NULL,
	st_grade	NUMBER(1)	    NULL
);

--DROP TABLE tbl_student;

-- tbl_student 에 데이터 추가하기
-- 생성된 테이블에 데이터를 추가하는 행위를 Data Create 라고 한다.
INSERT INTO tbl_student( st_num, st_name, st_tel, st_dept) 
VALUES ('0001', '홍길동', '010-111-1111', '컴공과');

INSERT INTO tbl_student( st_num, st_name, st_tel, st_dept) 
VALUES ('0002', '이몽룡', '010-111-1112', '전자과');

INSERT INTO tbl_student( st_num, st_name, st_tel, st_dept) 
VALUES ('0003', '성춘향', '010-111-1113', '정보통신과');

-- 저장된 데이터의 조회(Query), 읽기
/*
SELECT * : 모든칼럼을 다 표시하여 달라
SELECT st_num, st_name : 여러 칼럼중에서 st_num, st_name 칼럼만 표시해달라
    projection : 보고싶은 칼럼만 보기
*/
SELECT * 
FROM tbl_student;

SELECT st_num, st_name, st_dept 
FROM tbl_student;

SELECT st_num, st_dept, st_name, st_tel,st_addr, st_grade
FROM tbl_student;

-- tbl_student에 저장된 데이터 중에서 이름이 홍길동인 데이터만
-- SELECTION 해달라
SELECT *
FROM tbl_student 
WHERE st_name='홍길동';

/*
SELECT 명령 수행
Projection : 데이터를 조회할때 보고자 하는 명령만 표시하는 것
Selection : 데이터를 조회할때 WHERE 조건문을 붙여 
            데이터 리스트 리스트만 보는 것
            
Projection을 하면 실제 칼럼보다 적은 양의 칼럼을 보여준다.
Selection을 하면 실제 데이터 리스트보다 적은 양의 리스트를 보여준다.
*/

-- 전체 데이터를 조건없이 보여주되 이름(st_name 칼럼) 순으로 정렬(Sort) 하여 보여라
-- 가나다순(오름차순) 정렬
SELECT *
FROM tbl_student
ORDER BY st_name;

-- 역순(내림차순) 정렬
SELECT *
FROM tbl_student
ORDER BY st_name DESC;



INSERT INTO tbl_student(st_num, st_name, st_tel, st_dept)
VALUES ('0004', '장영실', '010-111-1114' ,'컴공과');

INSERT INTO tbl_student(st_num, st_name, st_tel, st_dept)
VALUES ('0005', '최순실', '010-111-1115' ,'컴공과');

-- 학과가 컴공과인 데이터만 셀렉션하여
-- 이름순으로 정렬하라
SELECT * 
FROM tbl_student
WHERE st_dept = '컴공과'
ORDER BY st_name;

-- 컴공과 학생들만 이름을 역순정렬하여 보여라
SELECT *
FROM tbl_student
WHERE st_dept = '컴공과'
ORDER BY st_name DESC;

-- 전체 데이터를 학과명 순으로 정령하고
-- 학과명이 같은 데이터끼리는 이름순으로 정렬하라
SELECT *
FROM tbl_student
ORDER BY st_dept, st_name;

-- 전체 데이터의 개수가 몇 개냐?
SELECT COUNT(st_dept)
FROM tbl_student;

-- 학과 별로 학생이 몇 명인지 알고 싶다
SELECT st_dept, COUNT(st_dept) AS 학생수
FROM tbl_student 
GROUP BY st_dept; 

SELECT COUNT(*)
FROM tbl_student;

-- 전체 데이터 중에 컴공과 학생이 몇 명인가
SELECT COUNT(st_dept)
FROM tbl_student
WHERE st_dept='컴공과';

/*
도구에서 데이터를 추가, 수정, 삭제 명령을 수행한 경우
Oracle DBMS에게 요청을 한 상태가 된다.
하지만 Oracle DBMS는 아직 스토리지와 DBF 파일에 저장하지 않은 상태이다.
이 상태에서 도구를 종료해 버리면
Orcle DBMS는 어떤 문제가 발생하여 종료된 것으로 생각하고
데이터를 지워버린다.
도구를 사용하여 접속하였을 경우는 도구를 종료하기 전에
반드시 COMMIT을 해 주어야 한다.
*/
COMMIT;

SELECT * FROM tbl_student;

INSERT INTO tbl_student(st_num, st_name, st_tel)
VALUES ('0006','신창원','010-111-1116'); 

/*
데이터를 추가, 수정, 삭제하고 아직 COMMIT 되지 않은 상태에서
추가, 수정, 삭제를 취소하는 명령
*/
ROLLBACK;

DELETE 
FROM tbl_student;
/*
DCL(Data Control Lang.)
사용자에게 권한을 부여(GRANT)하거나 회수(REVOKE)하는 명령이 있고
데이터를 COMMIT, 또는 ROLLBACK 하는 명령이 있다.
*/

DROP TABLE tbl_student;

CREATE TABLE tbl_student(
    st_num	VARCHAR2(5)		PRIMARY KEY,
    st_name	nVARCHAR2(20)	NOT NULL,
    st_dept	nVARCHAR2(10),
    st_grade NUMBER(2),	
    st_tel	VARCHAR2(15)	NOT NULL UNIQUE,
    st_addr	nVARCHAR2(125)		
);

CREATE TABLE tbl_score(
sc_stnum	VARCHAR2(5)		PRIMARY KEY,
sc_kor	NUMBER	,	
sc_eng	NUMBER	,	
sc_math	NUMBER	,	
sc_his	NUMBER	,	
sc_moral	NUMBER,		
sc_sci	NUMBER	
);

SELECT st_dept, count(st_dept)
from tbl_student
group by st_dept;
-- 위 결과에서 학생수가 많은 학과 부터 보여주기
select st_dept, count(st_dept)
from tbl_student
group by st_dept
order by count(st_dept) desc;

select st_dept, count(st_dept) as 학생수
from tbl_student
group by st_dept
order by 학생수 desc;

select st_dept, count(st_dept) as 학생수
from tbl_student
group by st_dept
order by 학생수 desc, st_dept;
