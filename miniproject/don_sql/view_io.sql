
/* Drop Tables */

DROP TABLE base_category CASCADE CONSTRAINTS;
DROP TABLE category CASCADE CONSTRAINTS;
DROP TABLE input_output CASCADE CONSTRAINTS;
DROP TABLE members CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE category_no_seq;
DROP SEQUENCE input_output_no_seq;
DROP SEQUENCE members_no_seq;




/* Create Sequences */

CREATE SEQUENCE category_no_seq INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE input_output_no_seq INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE members_no_seq INCREMENT BY 1 START WITH 1;



/* Create Tables */

CREATE TABLE base_category
(
	cate_name varchar2(20) NOT NULL
);
insert into BASE_CATEGORY values ('식료품');
insert into BASE_CATEGORY values ('외식');
insert into BASE_CATEGORY values ('의복');
insert into BASE_CATEGORY values ('문화생활');
insert into BASE_CATEGORY values ('기타');

commit

select * from members;

CREATE TABLE category
(
	no number NOT NULL,
	cate_name varchar2(20) NOT NULL,
	id varchar2(20) NOT NULL,
	PRIMARY KEY (no)
);
-- 꼭 실행시킬 것........
alter table category
add constraint category_catenameid_uk unique(cate_name, id);
-- 꼭 실행시킬 것........

-- meber table column 추가
alter table members
add (regist_date date not null);
delete members;

alter table members
drop column regist_date;

select * from members;
delete category;

update members set regist_date='2015-03-05' where id='test';

select regist_date, id from members;
select to_char(regist_date, 'yyyy') as reg_date
from members
where id = 'test';
CREATE TABLE input_output
(
	no number NOT NULL,
	id varchar2(20) NOT NULL,
	regdate date NOT NULL,
	category varchar2(20) NOT NULL,
	io number(1) NOT NULL,
	money number DEFAULT 0 NOT NULL,
	memo varchar2(1000),
	PRIMARY KEY (no)
);

select id, regdate, money, memo
	 , decode (io, 1, '수입'
	 			    , '지출')
from input_output
where id = 'test';

select io.no, io.id, io.regdate, io.money, c.cate_name, io.memo
from input_output io left join category c
on io.id = 'test' and io.category = c.no;

select * from category;
select * from category where id = 'test';
select * from input_output;

CREATE TABLE members
(
	no number NOT NULL,
	id varchar2(20) NOT NULL UNIQUE,
	password varchar2(128) NOT NULL,
	name varchar2(20) NOT NULL,
	email varchar2(50) NOT NULL,
	PRIMARY KEY (no)
);

insert into category (no, cate_name, id)
select category_no_seq.nextval, cate_name, 'number1' from base_category;

select * from category;

select * from input_output;


select no, cate_name
from category
where id = 'wishrich'
order by no;


select * from input_output
where id = 'wishrich';



select sum(money) from input_output
where io = 2 and id = 'wishrich';

select io.category, cg.cate_name 
from input_output io
inner join category cg
on io.category = cg.no
where io.io = 2 and io.id = 'wishrich';

select * from input_output;

update input_output set io = 2;

select sum(money)
from input_output
where id = 'test' and regdate = '20200627'
group by id;

select to_char(regdate, 'yyyyMM')
from input_output;

select sum(money)
from input_output
where id like 'test' and to_char(regdate, 'yyyyMM')  like '202005' and io = 1
group by id;

select sum(money) as money2 from input_output where id like 'test' and to_char(regdate, 'yyyyMM') 
like '202006' and io = 2 group by id
