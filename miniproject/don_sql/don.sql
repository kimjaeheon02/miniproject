create table test (no number);

select * from test;

create table members(
id varchar2(12) primary key,
password varchar2(20) not null, 
name varchar2(10) not null,
private_no varchar2(20) unique);

create sequence members_no_seq
start with 1
increment by 1
nocache;

select * from members;

drop table members purge;
drop table calendar purge;

create table cashbook(
regdate   date not null,
money    number default 0 not null);

create table members(
no number primary key,
id varchar2(20) not null,
password varchar2(128) not null, 
name varchar2(20) not null,
e_mail varchar2(30) not null);

create sequence members_no_seq
start with 1
increment by 1
nocache;

select * from members;
select * from calendar;
