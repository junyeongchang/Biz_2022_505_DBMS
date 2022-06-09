-- 관리자 접속화면

-- tablespace : 새로운 프로젝트를 만들때 프로젝트의 데이터가 저장될 파일 생성
create TABLESPACE naverDB
DATAFILE 'c:/oraclexe/data/naverDB.dbf'
size 1m AUTOEXTEND on next 1k;

-- 사용자 등록
-- 사용자 등록할때 defalt tablespace 를 지정하지 않으면 
-- system tablespace에 데이터를 저장하게 되어 문제가 될수 있다.
CREATE USER bookuser IDENTIFIED BY bookuser
DEFAULT TABLESPACE naverDB;

GRANT DBA TO bookuser;


