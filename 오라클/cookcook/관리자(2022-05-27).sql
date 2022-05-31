
create TABLESPACE testCookCook
DATAFILE 'c:/oraclexe/data/testcookcook.dbf'
size 1m AUTOEXTEND on next 1k;

CREATE USER cookcook IDENTIFIED BY 1234
DEFAULT TABLESPACE testCookCook;

GRANT DBA TO cookcook;
