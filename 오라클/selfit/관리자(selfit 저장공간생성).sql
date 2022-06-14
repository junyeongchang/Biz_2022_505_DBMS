-- 여기는 관리자 화면

create tablespace selfitDB
DATAFILE 'C:/oraclexe/data/selfit.dbf'
size 1m AUTOEXTEND on next 1k;

create user selfit IDENTIFIED by selfit
default tablespace selfitDB;

grant dba to selfit;