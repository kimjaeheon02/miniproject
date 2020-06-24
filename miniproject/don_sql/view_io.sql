
/* Drop Tables */

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

CREATE TABLE category
(
	no number NOT NULL,
	cate_name varchar2(20) NOT NULL,
	id varchar2(20) NOT NULL,
	PRIMARY KEY (no)
);


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


CREATE TABLE members
(
	no number NOT NULL,
	id varchar2(20) NOT NULL UNIQUE,
	password varchar2(128) NOT NULL,
	name varchar2(20) NOT NULL,
	email varchar2(50) NOT NULL,
	PRIMARY KEY (no)
);



