-- 여기는 USER2

select * from tbl_score;
/*
tbl_score 데이터는 한 학생의 과목 점수가 각각 레코드별로 저장되어 있다.
과목수가 늘어나면 학번, 과목명, 점수 형식으로 계속 저장해주면 된다.

실제 필요한 데이터는 학번, 과목명, 점수 칼럼인데, PK를 설정하기 위해 SEQ라는 
칼럼이 추가된 상태

SEQ 칼럼이 없이 PK를 설정하려면 학번 + 과목명 으로 두개의 칼럼을 묶어서
PK로 해야 한다.
다수의 칼럼을 묶음으로 PK를 설정하는 것을 Super Key 라고 한다.
필요에 따라 Super Key로 PK로 설정 하기도 하지만 Super Key는 잘못 사용하면
데이터 무결성을 해칠 수 있다.

UPDATE tbl_sutdent SET sc_score = 90
WHERE sc_num = '1111' AND sc_subject = '국어' 

DELETE FROM tbl_sutdent
WHERE sc_num = '1111' AND sc_subject = '국어' 

*/

-- 학번 S0043 인 학생의 미술점수를 50점에서 80으로 바꾸고 싶다.
-- update 나 delete 실행할때 조건절(where)에 복수의 칼럼 조건을 부여하는 것은
-- 썩 좋지 않다.
update tbl_score sc_score= 80
where sc_stnum='S0043' and sc_subject='미술';

-- 1. 변경하고자 하는 점수의 데이터를 먼저 조회한다.
select * from tbl_score
where sc_stnum = 'S0043' and sc_subject='미술';

-- 2. 변경하고자 하는 데이터가 조회되면 PK가 무엇인지 확인한다.
-- PK : 299

-- 3. PK를 조건으로 하는 update 명령을 실행한다.
update tbl_score set sc_score = 80
where sc_seq = 299;

-- 4. 실행 후 정확히 원하는 값으로 변경되었는지 확인
select * from tbl_score where sc_seq=299;

-- 5. 학생별로 성적 총점을 계산하기
select sc_stnum, sum(sc_score)
from tbl_score
group by sc_stnum;

-- 정규화되지 않고 각 과목별로 칼럼이 있는 table
select sc_kor + sc_eng + sc_math from tbl_score;

-- 학생별로 성적 총점을 계산하고
-- 학번 순으로 정령하자
select sc_stnum, sum(sc_score)
from tbl_score
group by sc_stnum
order by sc_stnum;

-- 성적조회를 하였는데 학번과 정수만 나타나서 누구인지(학생이름)을 알수 가 없다.
-- 두개 이상의 테이블을 서로 연동하여 데이터를 확인하기
-- JOIN하여 데이터 검색
-- 1. tbl_score table 데이터를 전부 펼치고
-- 2. sc_stnum 칼럼과 sc_score 칼럼 데이터를 보여주면서
-- 3. tbl_score.sc_stnum 데이터를 가지고 tbl_student.st_num을 select 한 후
-- 4. 일치하는 데이터가 있으면 st_name 칼럼을 가져와서 함께 보여라
select sc_stnum, st_name, sc_score
from tbl_score, tbl_student
where sc_stnum = st_num;







