-- 여기는 root 화면
-- root 는 oracle 와 sys와 같은 역할
/*
mySQL 사용자와 DB(Data 저장소)의 관계가 연결이 아니다
오라클에서는 사용자에게 defalt Table Space 지정하여
login(접속)을 하면 자동으로 기본 DB가 연결된다.

사용자는 단순희 DB 서버에 접속하는 권한을부여받을 뿐이고
어떤 DB를 사용할 것인지 처음 시작할때 연결을 해주어야 한다.
*/
-- DB 저장소 생성
CREATE DATABASE myDB;

-- 일반 사용자 생성
-- MySQL은 전통적으로 root 사용자로 접속하여 DB 관리한다.
-- 최근추세는 root 사용자는 DB, USER 생성만을 담당하고
-- DB 관리는 일반 사용자등 생성하여 실행하도록 권장한다.
-- MySQL 은 사용자를 생성할때 어떤 방법으로 접속할 것인지를 명시해야 한다.
-- callor 사용자는 localhost 에서만 mySQL 서버에 접속할 수 있다.
DROP USER 'callor'@'localhost';
CREATE USER 'callor'@'localhost' identified BY '!Korea8080';

/*
MySQL 은 사용자를 등록하면
그 사용자는 DBA 권한을 기본적으로 갖는다.
MySQL 은 실무에서 가장 많이 사용하는 버전이 5.7.x 이다
5.7 버전은 사용자 등록과 동시에 DB관련된 명령을 대부분 사용할수 있다.
8.x 버전은 사용자 권한이 좀 더 엄겼해졌다.
*/