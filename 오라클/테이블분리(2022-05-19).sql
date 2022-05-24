select * from tbl_score
where sc_subject = '영어';
/*
성적데이터가 저장된 tbl_score table 의 데이터 중
영어과목을 영어영문으로 변경하고 싶다
SQL UPDATE 명령을 이용하면 간단히 해결할수 있다.

하지만, 현제 table에서 100개의 레코드(데이터들)이 변경되는 문제가 발생한다.
한번에 다량의 레코드의 데이터가 변경되는 경우
데이터 무결성, transaction 등의 문제를 일으킬 수 있다.

자주 일어나는 상황은 아니지만 이러한 상황이 발생하지 않도록 하기 위하여
table 설계를 다시 수행해야 한다.
*/
update tbl_score
set sc_subject ='영어영문과'
where sc_subject='영어';

