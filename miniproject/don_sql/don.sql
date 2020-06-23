create table test (no number);

select * from test;

create table members(
id varchar2(20) primary key,
password varchar2(128) not null, 
name varchar2(10) not null,
private_no varchar2(20) unique);

create sequence members_no_seq
start with 1
increment by 1
nocache;

select * from members;