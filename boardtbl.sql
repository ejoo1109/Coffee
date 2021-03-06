-- 1:1 게시판을 위한 BoarTBL
CREATE TABLE BoardTBL (
	bno			NUMBER(10, 0)	NOT NULL, 
	title		VARCHAR2(200)	NOT NULL, 
	content		VARCHAR2(2000)	NOT NULL, 
	writer		VARCHAR2(50)	NOT NULL, 
	regdate		DATE default sysdate, 
	updatedate	DATe default sysdate, 
	CONSTRAINT BoardTBL_PK PRIMARY KEY (bno)
);
alter table boardtbl add replycnt number;
-- 1:1 게시판의 글번호를 위한 시퀸스
CREATE SEQUENCE seq_boarda START WITH 1 INCREMENT BY 1;

insert into BoardTBL(bno,title,content,writer)values (seq_boarda.nextval, '배송문의', '언제 배송되나요?','서길동');
insert into BoardTBL(bno,title,content,writer) values (seq_boarda.nextval, '교환문의', '교환 가능한가요?','북길동');
insert into BoardTBL(bno,title,content,writer) values (seq_boarda.nextval, '환불문의', '환불 가능한가요?','동길동');
insert into BoardTBL(bno,title,content,writer) values (seq_boarda.nextval, '결제내역', '주문내역 어디서 확인가능 한가요?','동길홍');

--더미데이터 삽입
insert into boardtbl(bno,title, content, writer)
(select seq_boarda.nextval,title, content, writer from boardtbl);

select count(*) from boardtbl;
select* from BOARDTBL_ATTACH where bno=562;
----------------------------------------------------------------
-- 1:1 게시판의 첨부파일을 위한 BoardTBL_Attach
CREATE TABLE BoardTBL_Attach (
	uuid		VARCHAR2(100)	NOT NULL, 
	uploadPath	VARCHAR2(200)	NOT NULL, 
	fileName	VARCHAR2(100)	NOT NULL, 
	fileType	CHAR(1), 
	bno			NUMBER(10)		NOT NULL, 
    CONSTRAINT BoardTBL_Attach_PK PRIMARY KEY (uuid)
);

-- BoarTBL의 bno와 BoardTBL_Attach의 bno 외래키 작업 
ALTER TABLE BoardTBL_Attach ADD CONSTRAINT FK_BoardTBL_Attach FOREIGN KEY (bno) REFERENCES BoardTBL (bno);

-- 1:1 게시판의 댓글을 위한 BoardTBL_Reply
CREATE TABLE BoardTBL_Reply (
	rno			NUMBER(10, 0)	CONSTRAINT BoardTBL_Reply_PK PRIMARY KEY, 
    bno			NUMBER(10)		NOT NULL, 
	reply		VARCHAR2(1000)	,
    replyer		VARCHAR2(50)	,
    replyDate	DATE DEFAULT SYSDATE, 
    updateDate	DATE DEFAULT SYSDATE, 
    CONSTRAINT BoardTBL_Reply_FK FOREIGN KEY(bno) REFERENCES BoardTBL(bno)
);

-- 1:1 게시판 댓글의 글번호를 위한 시퀸스
CREATE SEQUENCE seq_reply START WITH 1 INCREMENT BY 1;

-- BoarTBL의 bno와 BoardTBL_Reply bno 외래키 작업 
ALTER TABLE BoardTBL_Reply ADD CONSTRAINT FK_BoardTBL_Reply_bno_BoardTBL FOREIGN KEY (bno) REFERENCES BoardTBL (bno);

--스프링에서 시큐리티에서 remember me 를 위해 기본적으로 구현하는 테이블 
create table persistent_logins(
   username varchar2(64) not null,
   series varchar2(64) primary key,
   token varchar2(64) not null,
   last_used timestamp not null
);
-- Auth 추가 (id:admin pw:admin123!)
create table UserTBL_auth(
	userid varchar2(50) not null,
	auth varchar2(50) not null,
	constraint fk_user_auth foreign key(userid) references UserTBL(userid)
);
-- Auth 추가 (id:admin pw:admin123!)
create table UserTBL_auth(
	userid varchar2(50) not null,
	auth varchar2(50) not null,
	constraint fk_user_auth foreign key(userid) references UserTBL(userid)
);
select * from UserTBL_auth;
insert into UserTBL_auth values('admin', 'ROLE_ADMIN');