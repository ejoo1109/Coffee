-- 회원가입을 위한 UserTBL
CREATE TABLE UserTBL (
	userid		VARCHAR2(15), 
	password	VARCHAR2(20)	NOT NULL, 
	name		NVARCHAR2(10)	NOT NULL, 
	postcode	VARCHAR2(50)	NOT NULL,
	address		VARCHAR2(50)	NOT NULL,
	detailAddress    VARCHAR2(50),
	email		VARCHAR2(50)	NOT NULL, 
	tel			VARCHAR2(20)	NOT NULL, 
	point number(20) not null,
	CONSTRAINT UserTBL_PK PRIMARY KEY (userid)
);

drop table usertbl;
DROP TABLE usertbl
CASCADE CONSTRAINTS;
select * from USERTBL;

insert into USERTBL 
values('hong123','hong123!!','홍길동','07085','서울시 종로구 관철동','중앙로156','test123@naver.com','010-1234-1234',1000);
insert into USERTBL 
values('hong1234','hong1234!!','홍길자','07085','서울시 종로구 관철동','중앙로156','test123@naver.com','010-1234-1234',1000);

--출석체크 tbl
DROP TABLE CALENDAR
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_CAL;

CREATE TABLE CALENDAR(
CAL_SEQ NUMBER(8) PRIMARY KEY,
userid VARCHAR2(50) NOT NULL,
RDATE VARCHAR2(30) NOT NULL
);

CREATE SEQUENCE SEQ_CAL
START WITH 1
INCREMENT BY 1;

--userid 탈퇴시 calendar userid도 같이 삭제됨
ALTER TABLE CALENDAR
ADD CONSTRAINT FK_CAL_userid FOREIGN KEY(userid)
REFERENCES usertbl(userid) on delete cascade;

insert into calendar
values(SEQ_CAL.NEXTVAL, 'hong1234','20210201');
insert into calendar
values(SEQ_CAL.NEXTVAL, 'hong1234','20210202');
insert into calendar
values(SEQ_CAL.NEXTVAL, 'hong1234','20210203');
insert into calendar
values(SEQ_CAL.NEXTVAL, 'hong1234','20210204');
insert into calendar
values(SEQ_CAL.NEXTVAL, 'hong1234','20210205');
insert into calendar
values(SEQ_CAL.NEXTVAL, 'hong1234','20210206');
insert into calendar
values(SEQ_CAL.NEXTVAL, 'hong1234','20210207');
insert into calendar
values(SEQ_CAL.NEXTVAL, 'hong1234','20210208');
insert into calendar
values(SEQ_CAL.NEXTVAL, 'hong1234','20210209');
insert into calendar
values(SEQ_CAL.NEXTVAL, 'hong1234','20210210');
insert into calendar
values(SEQ_CAL.NEXTVAL, 'hong1234','20210211');
insert into calendar
values(SEQ_CAL.NEXTVAL, 'hong1234','20210212');
insert into calendar
values(SEQ_CAL.NEXTVAL, 'hong1234','20210213');
insert into calendar
values(SEQ_CAL.NEXTVAL, 'hong1234','20210214');
insert into calendar
values(SEQ_CAL.NEXTVAL, 'hong1234','20210215');
insert into calendar
values(SEQ_CAL.NEXTVAL, 'hong1234','20210216');

delete from CALENDAR where userid='hong1234';
delete from usertbl where userid='hong1234';
select *from calendar;
select * from usertbl;