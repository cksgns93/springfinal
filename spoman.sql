--회원 테이블--------------------------------------------------------------
ALTER TABLE member
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_member;

/* 회원 */
DROP TABLE member 
	CASCADE CONSTRAINTS;

/* 회원 */
CREATE TABLE member (
	idx NUMBER(4) NOT NULL, /* 회원번호 */
	name VARCHAR2(10) NOT NULL, /* 이름 */
	id VARCHAR2(40) NOT NULL, /* 아이디 */
	pwd VARCHAR2(20) NOT NULL, /* 비밀번호 */
	gender VARCHAR2(4) NOT NULL, /* 성별 */
	birth VARCHAR2(20) NOT NULL, /* 생년월일 */
	hp1 NUMBER(3) NOT NULL, /* 핸드폰번호1 */
	hp2 NUMBER(4) NOT NULL, /* 핸드폰번호2 */
	hp3 NUMBER(4) NOT NULL, /* 핸드폰번호3 */
	state NUMBER(2) NOT NULL /* 회원상태 */
);


CREATE UNIQUE INDEX PK_member
	ON member (
		idx ASC
	);

ALTER TABLE member
	ADD
		CONSTRAINT PK_member
		PRIMARY KEY (
			idx
		);
    


--모임 테이블------------------------------------------------------------
ALTER TABLE club
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_club;

/* 모임 */
DROP TABLE club 
	CASCADE CONSTRAINTS;

/* 모임 */
CREATE TABLE club (
	cno NUMBER(4) NOT NULL, /* 클럽번호 */
	cname VARCHAR2(30) NOT NULL, /* 클럽 이름 */
	csports VARCHAR2(20) NOT NULL, /* 종목 */
	cking VARCHAR2(10) NOT NULL, /* 대표자 */
	cnumber NUMBER(3) NOT NULL, /* 클럽 인원 */
	cplace VARCHAR2(100) NOT NULL, /* 선호지역 */
	cinfo VARCHAR2(2000) NOT NULL, /* 클럽소개 */
	chp1 NUMBER(3) NOT NULL, /* 전화번호1 */
	chp2 NUMBER(4) NOT NULL, /* 전화번호2 */
	chp3 NUMBER(4) NOT NULL, /* 전화번호3 */
	cstate NUMBER(2) NOT NULL /* 활동상태 */
);

CREATE UNIQUE INDEX PK_club
	ON club (
		cno ASC
	);

ALTER TABLE club
	ADD
		CONSTRAINT PK_club
		PRIMARY KEY (
			cno
		);
    
--팀테이블---------------------------------------------------------------
ALTER TABLE team
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_team;

/* 팀 */
DROP TABLE team 
	CASCADE CONSTRAINTS;

/* 팀 */
CREATE TABLE team (
	tno NUMBER(4) NOT NULL, /* 팀번호 */
	tname VARCHAR2(50) NOT NULL, /* 팀명 */
	tking VARCHAR2(10) NOT NULL, /* 대표자 */
	tsports VARCHAR2(20) NOT NULL, /* 종목 */
	tnumber NUMBER(3) NOT NULL, /* 팀인원수 */
	age NUMBER(3) NOT NULL, /* 평균나이 */
	level VARCHAR2(10) NOT NULL, /* 팀실력 */
	timage VARCHAR2(100), /* 팀마크 */
	tplace VARCHAR2(100) NOT NULL, /* 선호지역 */
	thp1 NUMBER(3) NOT NULL, /* 전화번호1 */
	thp2 NUMBER(4) NOT NULL, /* 전화번호2 */
	thp3 NUMBER(4) NOT NULL /* 전화번호3 */
);


CREATE UNIQUE INDEX PK_team
	ON team (
		tno ASC
	);

ALTER TABLE team
	ADD
		CONSTRAINT PK_team
		PRIMARY KEY (
			tno
		);
    
    
--회원_팀------------------------------------------------------------------
ALTER TABLE mt
	DROP
		CONSTRAINT FK_member_TO_mt
		CASCADE;

ALTER TABLE mt
	DROP
		CONSTRAINT FK_team_TO_mt
		CASCADE;

ALTER TABLE mt
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_mt;

/* 회원_팀 */
DROP TABLE mt 
	CASCADE CONSTRAINTS;

/* 회원_팀 */
CREATE TABLE mt (
	mtno NUMBER(4) NOT NULL, /* 회원_팀번호 */
	idx NUMBER(4) NOT NULL, /* 회원번호 */
	tno NUMBER(4) NOT NULL /* 팀번호 */
);


CREATE UNIQUE INDEX PK_mt
	ON mt (
		mtno ASC
	);

ALTER TABLE mt
	ADD
		CONSTRAINT PK_mt
		PRIMARY KEY (
			mtno
		);

ALTER TABLE mt
	ADD
		CONSTRAINT FK_member_TO_mt
		FOREIGN KEY (
			idx
		)
		REFERENCES member (
			idx
		);

ALTER TABLE mt
	ADD
		CONSTRAINT FK_team_TO_mt
		FOREIGN KEY (
			tno
		)
		REFERENCES team (
			tno
		);
    
--회원_모임--------------------------------------------------------------------
ALTER TABLE mc
	DROP
		CONSTRAINT FK_member_TO_mc
		CASCADE;

ALTER TABLE mc
	DROP
		CONSTRAINT FK_club_TO_mc
		CASCADE;

ALTER TABLE mc
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_mc;

/* 회원_모임 */
DROP TABLE mc 
	CASCADE CONSTRAINTS;

/* 회원_모임 */
CREATE TABLE mc (
	mcno NUMBER(3) NOT NULL, /* 회원_클럽번호 */
	idx NUMBER(4) NOT NULL, /* 회원번호 */
	cno NUMBER(4) NOT NULL, /* 클럽번호 */
	mcstate NUMBER(2) NOT NULL, /* 클럽활동상태 */
	grade NUMBER(2) NOT NULL, /* 클럽회원등급 */
	indate DATE NOT NULL, /* 가입일 */
	outdate DATE /* 탈퇴일 */
);

CREATE UNIQUE INDEX PK_mc
	ON mc (
		mcno ASC
	);

ALTER TABLE mc
	ADD
		CONSTRAINT PK_mc
		PRIMARY KEY (
			mcno
		);

ALTER TABLE mc
	ADD
		CONSTRAINT FK_member_TO_mc
		FOREIGN KEY (
			idx
		)
		REFERENCES member (
			idx
		);

ALTER TABLE mc
	ADD
		CONSTRAINT FK_club_TO_mc
		FOREIGN KEY (
			cno
		)
		REFERENCES club (
			cno
		);
    
--매칭게시판-------------------------------------------------------------------
ALTER TABLE matching
	DROP
		CONSTRAINT FK_team_TO_matching
		CASCADE;

ALTER TABLE matching
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_matching;

/* 매칭게시판 */
DROP TABLE matching 
	CASCADE CONSTRAINTS;

/* 매칭게시판 */
CREATE TABLE matching (
	mno NUMBER(4) NOT NULL, /* 매칭번호 */
	tno NUMBER(4) NOT NULL, /* 팀번호 */
	mname VARCHAR2(50) NOT NULL, /* 게시물이름 */
	away VARCHAR2(50), /* 원정팀 */
	mcontent VARCHAR2(2000) NOT NULL, /* 글내용 */
	mdate DATE NOT NULL, /* 경기 날짜 */
	addr VARCHAR2(100) NOT NULL, /* 구장 주소 */
	map VARCHAR2(200) NOT NULL, /* 지도 */
	mupdate DATE NOT NULL /* 등록시간 */
);

CREATE UNIQUE INDEX PK_matching
	ON matching (
		mno ASC
	);

ALTER TABLE matching
	ADD
		CONSTRAINT PK_matching
		PRIMARY KEY (
			mno
		);

ALTER TABLE matching
	ADD
		CONSTRAINT FK_team_TO_matching
		FOREIGN KEY (
			tno
		)
		REFERENCES team (
			tno
		);
    
--매칭 수학 테이블------------------------------------------------------------
ALTER TABLE accept
	DROP
		CONSTRAINT FK_team_TO_accept
		CASCADE;

ALTER TABLE accept
	DROP
		CONSTRAINT FK_matching_TO_accept
		CASCADE;

ALTER TABLE accept
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_accept;

/* 매칭수락테이블 */
DROP TABLE accept 
	CASCADE CONSTRAINTS;

/* 매칭수락테이블 */
CREATE TABLE accept (
	ano NUMBER(4) NOT NULL, /* 매칭수락번호 */
	tno NUMBER(4) NOT NULL, /* 팀번호 */
	mno NUMBER(4) NOT NULL /* 매칭번호 */
);

CREATE UNIQUE INDEX PK_accept
	ON accept (
		ano ASC
	);

ALTER TABLE accept
	ADD
		CONSTRAINT PK_accept
		PRIMARY KEY (
			ano
		);

ALTER TABLE accept
	ADD
		CONSTRAINT FK_team_TO_accept
		FOREIGN KEY (
			tno
		)
		REFERENCES team (
			tno
		);

ALTER TABLE accept
	ADD
		CONSTRAINT FK_matching_TO_accept
		FOREIGN KEY (
			mno
		)
		REFERENCES matching (
			mno
		);
    
    
--모임 사진 게시판-------------------------------------------------------------
ALTER TABLE cpicture
	DROP
		CONSTRAINT FK_club_TO_cpicture
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
	cno NUMBER(4) NOT NULL, /* 클럽번호 */
	cpimage VARCHAR2(100) NOT NULL, /* 이미지 */
	cptitle VARCHAR2(50) NOT NULL /* 글제목 */
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
		CONSTRAINT FK_club_TO_cpicture
		FOREIGN KEY (
			cno
		)
		REFERENCES club (
			cno
		);
    
    
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
	cbimage VARCHAR2(100), /* 이미지 */
	cbupdate DATE NOT NULL /* 등록일 */
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