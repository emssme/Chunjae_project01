USE lemonedu;

-- 멤버
CREATE TABLE MEMBER(
	id VARCHAR(16) NOT NULL,
	pw VARCHAR(330) NOT NULL,
	NAME VARCHAR(100) NOT NULL,
	email VARCHAR(100) NOT NULL,
	tel VARCHAR(13),
	regdate TIMESTAMP NOT NULL default CURRENT_TIMESTAMP,
	POINT INT DEFAULT 0,
	PRIMARY KEY (id));
	
INSERT INTO MEMBER(id, pw, NAME, email, tel) VALUES("admin","1234","관리자","admin@lemonedu.com","01012341234");
INSERT INTO MEMBER(id, pw, NAME, email, tel) VALUES("kim","1111","김영현","kim@lemonedu.com","01011111111");
INSERT INTO MEMBER(id, pw, NAME, email, tel) VALUES("yoon","2222","윤도운","yoon@lemonedu.com","01022222222");
INSERT INTO MEMBER(id, pw, NAME, email, tel) VALUES("park","3333","박성진","park@lemonedu.com","01033333333");
INSERT INTO MEMBER(id, pw, NAME, email, tel) VALUES("kimwp","4444","김원필","kimwp@lemonedu.com","01044444444");


SELECT * FROM MEMBER;

UPDATE MEMBER set pw='03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4' WHERE id='admin';
UPDATE MEMBER set pw='0ffe1abd1a08215353c233d6e009613e95eec4253832a761af28ff37ac5a150c' WHERE id='kim';
UPDATE MEMBER set pw='79f06f8fde333461739f220090a23cb2a79f6d714bee100d0e4b4af249294619' WHERE id='kimwp';
UPDATE MEMBER set pw='318aee3fed8c9d040d35a7fc1fa776fb31303833aa2de885354ddf3d44d8fb69' WHERE id='park';
UPDATE MEMBER set pw='edee29f882543b956620b26d0ee0e7e950399b1c4222f5de05e06425b4c995e9' WHERE id='yoon';

COMMIT;
	
-- 게시판-----------------------------------------------------------------------------------------
CREATE TABLE board(
	bno INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(200) NOT NULL,
	content VARCHAR(1000),
	author VARCHAR(16),
	resdate TIMESTAMP NOT NULL default CURRENT_TIMESTAMP,
	cnt INT DEFAULT 0);
	
INSERT INTO board(title, content, author) VALUES("글1","글1입니다.","kim");
INSERT INTO board(title, content, author) VALUES("글2","글3입니다.","park");
INSERT INTO board(title, content, author) VALUES("글3","글3입니다.","yoon");
INSERT INTO board(title, content, author) VALUES("글4","글4입니다.","kimwp");
INSERT INTO board(title, content, author) VALUES("글5","글5입니다.","kim");
INSERT INTO board(title, content, author) VALUES("글6","글6입니다.","kimwp");
INSERT INTO board(title, content, author) VALUES("글7","글7입니다.","park");
INSERT INTO board(title, content, author) VALUES("글8","글8입니다.","yoon");
INSERT INTO board(title, content, author) VALUES("글9","글9입니다.","yoon");
INSERT INTO board(title, content, author) VALUES("글10","글10입니다.","kim");
INSERT INTO board(title, content, author) VALUES("글11","글11입니다.","park");
	
-- QnA--------------------------------------------------------------------------------
CREATE TABLE qna(qno INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(200) NOT NULL,
content VARCHAR(1000),
author VARCHAR(16),
resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
cnt INT DEFAULT 0,
lev INT DEFAULT 0,	-- 질문(0), 답변(1)
par INT,		-- 부모 글번호 -> 질문(자신 레코드의 qno), 답변(질문의 글번호)
FOREIGN KEY(author) REFERENCES member(id) ON DELETE CASCADE 
);



-- FAQ
CREATE TABLE faq(
	fno INT PRIMARY KEY AUTO_INCREMENT,
	question VARCHAR(500) NOT NULL,
	answer VARCHAR(1000) NOT NULL, 
	cnt INT DEFAULT 0); 


-- comment
create table Comment(
	cno INT AUTO_INCREMENT PRIMARY KEY,
	bno INT,
	author VARCHAR(16),
	resdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
	content VARCHAR(500),
	FOREIGN KEY(bno) REFERENCES board(bno) ON DELETE CASCADE
);