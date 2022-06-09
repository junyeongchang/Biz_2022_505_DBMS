-- bookuser 화면
create table tbl_books(
    isbn VARCHAR2(13) primary key,
    title NVARCHAR2(50) not null,
    author NVARCHAR2(50) not null,
    publisher NVARCHAR2(50) not null,
    price NUMBER,
    discount NUMBER,
    description NVARCHAR2(2000),
    pubdate VARCHAR2(10),
    link VARCHAR2(120),
    image VARCHAR2(120)
);

select * from tbl_books;

insert into tbl_books(isbn, title, author, publisher)
VALUES ('0001','자바','홍길동','우리출판사');

insert all
into tbl_books(isbn, title, author, publisher)
VALUES ('0002','자바자바','홍길동','우리출판사')
into tbl_books(isbn, title, author, publisher)
VALUES ('0003','오라클','홍길동','우리출판사')
select * from dual;

insert into tbl_books(isbn, title, author, publisher,price)
values ('0005','mysql','이몽룡','남원출판사', '9000');

insert into tbl_books(isbn, title, author, publisher,price)
values ('0006','mysql','이몽룡','남원출판사', '');

/*
SQL Developer 에서 insert, update, delete 수행하였으나
다른(spring) 프로젝트에서 데이터 반영이 안되는 경우
명령 끝에 반드시 commit 을 수행한다.

insert, update, delete 를 수행한 결과는
아직 메모리 버퍼에 머물러 있는 상태이다.
이 상태에서 다른 프로젝트에서 데이터를 조회하면
데이터가 보이지 않는다.
commit 을 할때까지
*/
commit;