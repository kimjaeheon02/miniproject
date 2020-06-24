drop table members purge;
drop sequence members_no_seq;

create table members(
no number primary key,
id varchar2(20) not null,
password varchar2(128) not null, 
name varchar2(20) not null,
email varchar2(30) not null);

create sequence members_no_seq
start with 1
increment by 1
nocache;

select * from members;

select * from INPUT_OUTPUT;
