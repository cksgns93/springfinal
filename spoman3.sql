
drop table ccp;
drop table cpicture;

--모임사진첩 테이블(exerd변경)
ALTER TABLE cpicture
	DROP
		CONSTRAINT FK_member_TO_cpicture
		CASCADE;

ALTER TABLE cpicture
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_cpicture;

/* 모임사진첩 */
DROP TABLE cpicture 
	CASCADE CONSTRAINTS;

/* 모임사진첩 */
CREATE TABLE cpicture (
	cpno NUMBER(4) NOT NULL, /* 사진번호 */
	cpimage VARCHAR2(100) NOT NULL, /* 이미지 */
	cptitle VARCHAR2(50) NOT NULL, /* 글제목 */
  cpdate DATE, /*등록일 default sysdate*/
  cno NUMBER(4),  /*모임번호*/
	idx NUMBER(4) /* 회원번호 */
);

CREATE UNIQUE INDEX PK_cpicture
	ON cpicture (
		cpno ASC
	);

ALTER TABLE cpicture
	ADD
		CONSTRAINT PK_cpicture
		PRIMARY KEY (
			cpno
		);

ALTER TABLE cpicture
	ADD
		CONSTRAINT FK_member_TO_cpicture
		FOREIGN KEY (
			idx
		)
		REFERENCES member (
			idx
		);

-----insert
drop sequence cpicture_seq;
create sequence cpicture_seq
start with 1 increment by 1;

--4번 삽입함
insert into cpicture(cpno, cpimage, cpdate, cptitle, cno, idx)
values(cpicture_seq.nextval, 'soccerplay1.jpg', sysdate, '축구하는 중', 46, 1);

select * from cpicture;

select cpimage, cptitle, cpdate from cpicture  where cno=46 and idx=2; 

--모임_사진------------------------
ALTER TABLE ccp
	DROP
		CONSTRAINT FK_club_TO_ccp
		CASCADE;

ALTER TABLE ccp
	DROP
		CONSTRAINT FK_cpicture_TO_ccp
		CASCADE;

/* 모임-사진 */
DROP TABLE ccp 
	CASCADE CONSTRAINTS;

/* 모임-사진 */
CREATE TABLE ccp (
	cno NUMBER(4), /* 클럽번호 */
	cpno NUMBER(4) /* 사진번호 */
);


ALTER TABLE ccp
	ADD
		CONSTRAINT FK_club_TO_ccp
		FOREIGN KEY (
			cno
		)
		REFERENCES club (
			cno
		);

ALTER TABLE ccp
	ADD
		CONSTRAINT FK_cpicture_TO_ccp
		FOREIGN KEY (
			cpno
		)
		REFERENCES cpicture (
			cpno
		);
-----insert
insert into ccp(cno, cpno) values(46, 1);
insert into ccp(cno, cpno) values(46, 2);
insert into ccp(cno, cpno) values(46, 3);
insert into ccp(cno, cpno) values(46, 4);

select * from cpicture;


--------3개 조인(회원명,회원아이디, 사진이름 등등)
select cpimage, cptitle, cpdate, name, id from ccp
join cpicture cp on cp.cpno=ccp.cpno 
join member m on cp.idx=m.idx where cno=46;

select cpimage, cptitle, cpdate, name, id from cpicture cp
join member m on m.idx=cp.idx where cno=46; 

--모임게시판----------------------------------------------------------------
ALTER TABLE cboard
	DROP
		CONSTRAINT FK_club_TO_cboard
		CASCADE;

ALTER TABLE cboard
	DROP
		CONSTRAINT FK_member_TO_cboard
		CASCADE;

ALTER TABLE cboard
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_cboard;

/* 모임게시판 */
DROP TABLE cboard 
	CASCADE CONSTRAINTS;

/* 모임게시판 */
CREATE TABLE cboard (
	cbno NUMBER(4) NOT NULL, /* 글번호 */
	cno NUMBER(4) NOT NULL, /* 클럽번호 */
	idx NUMBER(4) NOT NULL, /* 회원번호 */
	cbtitle VARCHAR2(50) NOT NULL, /* 글제목 */
	cbcontent VARCHAR2(2000) NOT NULL, /* 글내용 */ 
  cbreadnum number(8) default 0, --조회수
	cbimage VARCHAR2(100), /* 이미지 */
	cbupdate TIMESTAMP default systimestamp /* 등록일 */
);

CREATE UNIQUE INDEX PK_cboard
	ON cboard (
		cbno ASC
	);

ALTER TABLE cboard
	ADD
		CONSTRAINT PK_cboard
		PRIMARY KEY (
			cbno
		);

ALTER TABLE cboard
	ADD
		CONSTRAINT FK_club_TO_cboard
		FOREIGN KEY (
			cno
		)
		REFERENCES club (
			cno
		);

ALTER TABLE cboard
	ADD
		CONSTRAINT FK_member_TO_cboard
		FOREIGN KEY (
			idx
		)
		REFERENCES member (
			idx
		);


--------------------------------------------
drop table cboard;

select * from cboard;

create sequence cboard_seq;

--글번호, 클럽번호, 회원번호, 조회수(cbreadnum),cbupdate(timestamp)=>default 지정 
insert into cboard(cbno, cno, idx, cbtitle, cbcontent, cbimage)
values(cboard_seq.nextval, 46, 1, '가입인사해요!', '안녕하세요?? 저 오늘 가입했어요!', null);
insert into cboard(cbno, cno, idx, cbtitle, cbcontent, cbimage)
values(cboard_seq.nextval, 46, 2, '가입인사해요!', '안녕하세요?? 저 오늘 가입했어요!', null);
insert into cboard(cbno, cno, idx, cbtitle, cbcontent, cbimage)
values(cboard_seq.nextval, 46, 1, '오늘 정모했어요.', '오늘 모였는데 정말 재밌었어요!', null);
insert into cboard(cbno, cno, idx, cbtitle, cbcontent, cbimage)
values(cboard_seq.nextval, 46, 3, '오늘 정모했어요.', '오늘 모였는데 정말 재밌었어요!', null);

update cboard set cbimage='cboard1.jpg' where idx=1;  

---cboadmapper
select cbno, cbimage, cbtitle, cbupdate, m.idx, name, id, cbreadnum from cboard cb
join member m on m.idx=cb.idx where cno=46;

select cbno, cbimage, cbtitle, cbupdate, name, id, cbreadnum
from (select ROW_NUMBER () OVER (order by cbno desc) rn, 
cb.*, m.* from cboard cb join member m on m.idx=cb.idx where cno=46) 
where rn between 1 and 17;




--notice
CREATE TABLE notice (
	nno number(4) primary key
);

select * from member;
alter table member change img mark varchar2();
