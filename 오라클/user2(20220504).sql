-- 여기는 user2 접속화면

select * from tbl_student;

--성적테이블 재 설계
--기본 성적테이블 제거
--drop table tbl_score;

--재 설계된 성적테이블 생성
create table tbl_score (
    sc_stnum	VARCHAR2(5)	not null,	
    sc_subject	nvarchar2(15)	not null,	
    sc_score	number	,	
    sc_seq	number		PRIMARY KEY
);
--생성된 table 구조 확인
desc tbl_score;

--데이터 import

-- import 후에 데이터 수량을 카운트하여 모두 잘 import 되었는지 확인
select count(*) from tbl_score;

/*
tbl_score 테이블은 제1정규화가 완료되어 제 설계된고
데이터를 import한 상태가 되었다.
*/

--학생(학번)별로 전체 총점과 평균을 구해보자
--DB 합계와 평균을 계산하는 함수
--sum(숫자칼럼), avg(숫자칼럼)
--소수점 이하 관리하는 함수 : round(값, 자릿수)
--      round(avg(sc_score),1)
--      avg() 함수로 구한 결과를 소수점 2째에서 반올림하여 1째 자리까지만 표현
select sc_stnum, sum(sc_score) as 총점, round(avg(sc_score),1) as 평균 
from tbl_score
group by sc_stnum;

--round(avg(sc_score) : round(avg(sc_score),0) 과 같다.
--소수 부분에서 반올림하여 정수만 표현
select sc_stnum , sum(sc_score) as 총점, round(avg(sc_score)) as 평균 
from tbl_score
group by sc_stnum;

--전체학생의 과목별 총점과 평균을 구하기
--과목명(sc_subject칼럼)으로 그룹을 묶고
--그룹내에서 총점과 평균을 계산하라
select sc_subject, sum(sc_score) as 총점, round(avg(sc_score)) as 평균
from tbl_score
group by sc_subject;

/*
학생별 총점과 평균을 구하고
평균 순으로 높은 점수분터 낮은 점수 순으로 보이기
*/
select sc_stnum as 학번 , sum(sc_score) as 총점, round(avg(sc_score)) as 평균 
from tbl_score
group by sc_stnum 
ORDER BY round(avg(sc_score))
DESC;
/*
전체 학생을 과목별 총점과 평균을 구하고
평균 순으로 낮은 점수부터 높은 점수 순으로 보이기
*/
select sc_subject as 과목 , sum(sc_score) as 총점, round(avg(sc_score)) as 평균 
from tbl_score
group by sc_subject
ORDER BY round(avg(sc_score))
asc;

/*
DBMS의 표준 통계함수
group by로 공통항목을 묶고 공통항목 내에서
    개수 ( count ), 합계 ( sum ) , 평균( avg ), 최대값 ( max ), 최소값 ( min ) 등을 
계산하는 함수

통계함수로 묶지 않는 칼럼은 반드시 group by에 명시해야 한다.
*/

--과목별 총점과 평균을 계산하고
--평균이 76점 이상인 과목만 보고싶다
--통계함수로 계산된 결과에 대한 조건부여
select sc_subject, sum(sc_score), round(avg(sc_score),2)
from tbl_score
group by sc_subject
having round(avg(sc_score),2) > 75;

--음악, 국어 과목의 총점과 평균 계산
select sc_subject, sum(sc_score) 총점, round(avg(sc_score),2) 평균
from tbl_score
group by sc_subject
having sc_subject = '음악' or sc_subject = '국어';

select sc_subject, sum(sc_score) 총점, round(avg(sc_score),2) 평균
from tbl_score
group by sc_subject
having sc_subject in('음악','국어');

select sc_subject, sum(sc_score) 총점, round(avg(sc_score),2) 평균
from tbl_score
where sc_subject in('음악','국어')
group by sc_subject;

/*
통계함수와 group by를 사용하여 통계연산을 수행할때 주의사항
통계연산 결과에 어떤 조건을 부여하여 데이터를 보고자 할때는
where 절이나 having 절에 조건을 부여 할 수 있다.

통계연산이 수행된 결과 대하여 조건을 부여할때는
어쩔수 없이 having절에 조건을 부여해야할 것이다.

하지만 연산결과가 아닌 어떤 조건에 일치하는 데이터들에게만
통계연산을 수행하고자 할때는 
where 절에 조건을 부여할 수 없는지 반드시 고민해야 한다.

통계함수와 group by 를 통한 통계연산은
sql 조회명령에서 많이 느린 연산이다.
*/