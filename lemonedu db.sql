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
INSERT INTO MEMBER(id, pw, NAME, email, tel) VALUES("shin","5555","신예찬","shin@lemonedu.com","01055555555");
INSERT INTO MEMBER(id, pw, NAME, email, tel) VALUES("cho","6666","조원상","cho@lemonedu.com","01066666666");
INSERT INTO MEMBER(id, pw, NAME, email, tel) VALUES("choi","7777","최상엽","choi@lemonedu.com","01077777777");
INSERT INTO MEMBER(id, pw, NAME, email, tel) VALUES("shingi","8888","신광일","shingi@lemonedu.com","01088888888");


SELECT * FROM MEMBER;

UPDATE MEMBER set pw='03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4' WHERE id='admin';
UPDATE MEMBER set pw='0ffe1abd1a08215353c233d6e009613e95eec4253832a761af28ff37ac5a150c' WHERE id='kim';
UPDATE MEMBER set pw='79f06f8fde333461739f220090a23cb2a79f6d714bee100d0e4b4af249294619' WHERE id='kimwp';
UPDATE MEMBER set pw='318aee3fed8c9d040d35a7fc1fa776fb31303833aa2de885354ddf3d44d8fb69' WHERE id='park';
UPDATE MEMBER set pw='edee29f882543b956620b26d0ee0e7e950399b1c4222f5de05e06425b4c995e9' WHERE id='yoon';
UPDATE MEMBER set pw='c1f330d0aff31c1c87403f1e4347bcc21aff7c179908723535f2b31723702525' WHERE id='shin';
UPDATE MEMBER set pw='d7697570462f7562b83e81258de0f1e41832e98072e44c36ec8efec46786e24e' WHERE id='cho';
UPDATE MEMBER set pw='41c991eb6a66242c0454191244278183ce58cf4a6bcd372f799e4b9cc01886af' WHERE id='choi';
UPDATE MEMBER set pw='2926a2731f4b312c08982cacf8061eb14bf65c1a87cc5d70e864e079c6220731' WHERE id='shingi';


COMMIT;
	
SELECT * FROM member;
-- 공지사항 -------------------------------------------------------------------------------------

CREATE TABLE notice(
	bno INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(200) NOT NULL,
	content VARCHAR(1000),
	author VARCHAR(16),
	resdate TIMESTAMP NOT NULL default CURRENT_TIMESTAMP,
	cnt INT DEFAULT 0);
	
INSERT INTO notice(title, content, author) VALUES("글1","글1입니다.","admin");
INSERT INTO notice(title, content, author) VALUES("글2","글3입니다.","admin");
INSERT INTO notice(title, content, author) VALUES("글3","글3입니다.","admin");
INSERT INTO notice(title, content, author) VALUES("글4","글4입니다.","admin");
INSERT INTO notice(title, content, author) VALUES("글5","글5입니다.","admin");
INSERT INTO notice(title, content, author) VALUES("글6","글6입니다.","admin");
INSERT INTO notice(title, content, author) VALUES("글7","글7입니다.","admin");
INSERT INTO notice(title, content, author) VALUES("글8","글8입니다.","admin");
INSERT INTO notice(title, content, author) VALUES("글9","글9입니다.","admin");
INSERT INTO notice(title, content, author) VALUES("글10","글10입니다.","admin");
INSERT INTO notice(title, content, author) VALUES("글11","글11입니다.","admin");

SELECT * FROM notice;
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

INSERT INTO qna(title, content, author, lev) VALUES('질문1', '질문입니다. 1', 'kim', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=1;

INSERT INTO qna(title, content, author, lev) VALUES('질문2', '질문입니다. 2', 'park', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=2;

INSERT INTO qna(title, content, author, lev) VALUES('질문3', '질문입니다. 3', 'kimwp', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=3;

INSERT INTO qna(title, content, author, lev) VALUES('질문4', '질문입니다. 4', 'choi', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=4;

INSERT INTO qna(title, content, author, lev) VALUES('질문5', '질문입니다. 5', 'choi', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=5;

INSERT INTO qna(title, content, author, lev) VALUES('질문6', '질문입니다. 6', 'yoon', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=6;

INSERT INTO qna(title, content, author, lev) VALUES('질문7', '질문입니다. 7', 'kim', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=7;

INSERT INTO qna(title, content, author, lev) VALUES('질문8', '질문입니다. 8', 'shingi', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=8;

INSERT INTO qna(title, content, author, lev) VALUES('질문9', '질문입니다. 9', 'park', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=9;

INSERT INTO qna(title, content, author, lev) VALUES('질문10', '질문입니다. 10', 'kimwp', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=10;

INSERT INTO qna(title, content, author, lev, par) VALUES ('질문1에 대한 답변', '답변입니다. 1', 'admin', 1, 1);
INSERT INTO qna(title, content, author, lev, par) VALUES ('질문2에 대한 답변', '답변입니다. 2.', 'admin', 1, 2);
INSERT INTO qna(title, content, author, lev, par) VALUES ('질문3에 대한 답변', '답변입니다. 3', 'admin', 1, 3);
INSERT INTO qna(title, content, author, lev, par) VALUES ('질문4에 대한 답변', '답변입니다. 4', 'admin', 1, 4);
INSERT INTO qna(title, content, author, lev, par) VALUES ('질문5에 대한 답변', '답변입니다. 5', 'admin', 1, 5);
INSERT INTO qna(title, content, author, lev, par) VALUES ('질문6에 대한 답변', '답변입니다. 6', 'admin', 1, 6);
INSERT INTO qna(title, content, author, lev, par) VALUES ('질문7에 대한 답변', '답변입니다. 7', 'admin', 1, 7);
INSERT INTO qna(title, content, author, lev, par) VALUES ('질문8에 대한 답변', '답변입니다. 8', 'admin', 1, 8);
INSERT INTO qna(title, content, author, lev, par) VALUES ('질문9에 대한 답변', '답변입니다. 9', 'admin', 1, 9);
INSERT INTO qna(title, content, author, lev, par) VALUES ('질문10에 대한 답변', '답변입니다. 10', 'admin', 1, 10);

SELECT * FROM qna;
DROP TABLE qna;
-- FAQ
CREATE TABLE faq(
	fno INT PRIMARY KEY AUTO_INCREMENT,
	question VARCHAR(500) NOT NULL,
	answer VARCHAR(1000) NOT NULL, 
	cnt INT DEFAULT 0); 
	
INSERT INTO faq(question, answer) VALUES('자주 묻는 질문입니다1', '답변입니다1');
INSERT INTO faq(question, answer) VALUES('자주 묻는 질문입니다2', '답변입니다2');
INSERT INTO faq(question, answer) VALUES('자주 묻는 질문입니다3', '답변입니다3');
INSERT INTO faq(question, answer) VALUES('자주 묻는 질문입니다4', '답변입니다4');
INSERT INTO faq(question, answer) VALUES('자주 묻는 질문입니다5', '답변입니다5');

-- comment
create table Comment(
	cno INT AUTO_INCREMENT PRIMARY KEY,
	bno INT,
	author VARCHAR(16),
	resdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
	content VARCHAR(500),
	FOREIGN KEY(bno) REFERENCES board(bno) ON DELETE CASCADE
);