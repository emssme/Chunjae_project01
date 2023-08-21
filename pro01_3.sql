SELECT * FROM member;

INSERT INTO member VALUES ('gu','1004','구예철','gu@google.com','010-1004-2848',CURRENT_TIMESTAMP(),0);

INSERT INTO member VALUES ('park','1234','박진권','park@google.com','010-1278-2848',CURRENT_TIMESTAMP(),0);

DESC member;

DESC board;

select * from board order by bno;

select * from board where bno=8;

SELECT * FROM member;

INSERT INTO board(title, content, author) VALUES('테스트10', '테스트10의 내용입니다.','admin');
INSERT INTO board(title, content, author) VALUES('테스트11', '테스트11의 내용입니다.','admin');
INSERT INTO board(title, content, author) VALUES('테스트12', '테스트12의 내용입니다.','admin');
INSERT INTO board(title, content, author) VALUES('테스트13', '테스트13의 내용입니다.','admin');
INSERT INTO board(title, content, author) VALUES('테스트14', '테스트14의 내용입니다.','admin');
INSERT INTO board(title, content, author) VALUES('테스트15', '테스트15의 내용입니다.','admin');
INSERT INTO board(title, content, author) VALUES('테스트16', '테스트16의 내용입니다.','admin');

COMMIT;

-- 기존 테이블 존재시 현재 테이블을 참조하는 테이블도 삭제
DROP TABLE IF EXISTS qna;

-- 질문 및 답변 테이블 생성
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
 
ALTER TABLE qna MODIFY par INT;
-- 만약, 외래키로 인해 발생한다.

-- 해당 회원이 묻고 답하기(qna)에 글을 남기고, 회원 탈퇴를 시도하는 경우에는 묻고 답하기에 남긴 글도 같이 제거해야 한다.
DELETE FROM member WHERE id=?;   -- 탈퇴가 되지 않음(묻고 답하기에 글이 존재하므로)
-- 탈퇴를 허용하면서 묻고 답하기의 글도 같이 연쇄삭제 처리해야 하는 경우 테이블 생성시 외래키에 cascade 조건을 명시하면 된다.

DESC qna;

SELECT * FROM MEMBER;

SELECT * FROM qna;

-- 더미 데이터 작성
INSERT INTO qna(title, content, author, lev) VALUES('질문1', '나연씨 오늘은 일찍 오셨나요?','lee',0);
UPDATE qna SET par=qno WHERE lev=0;

INSERT INTO qna(title, content, author, lev) VALUES('질문2', '세훈씨 오늘은 지각 안하셨겠죠?','park',0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=3;

INSERT INTO qna(title, content, author, lev) VALUES('질문3', '승원씨  오늘 기대하겠습니다?','kim',0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=5;


INSERT INTO qna(title, content, author, lev, par) VALUES ('질문1에 대한 답변1', '저 오늘 3등으로 왔어요','park',1,1);
-- UPDATE qna SET par=qno WHERE lev=0 AND qno=4;

INSERT INTO qna(title, content, author, lev, par) VALUES('질문3에 대한 답변', '기대하셔도 좋습니다.','admin',1,5);

INSERT INTO qna(title, content, author, lev, par) VALUES('질문2에 대한 답변', '저 요즘 일찍 옵니다.','admin',1,4);

SELECT * FROM qna order by par DESC, lev ASC, qno ASC;

 
SELECT a.qno AS qno, a.title AS title, a.content AS content, a.author AS author, a.resdate AS resdate, a.cnt as cnt, a.lev AS lev, a.par AS par, b.name AS name FROM qna a, member b WHERE a.author=b.id order BY a.par DESC, a.lev ASC, a.qno ASC;


CREATE VIEW qnalist AS (SELECT a.qno AS qno, a.title AS title, a.content AS content, a.author AS author, a.resdate AS resdate, a.cnt as cnt, a.lev AS lev, a.par AS par, b.name AS name FROM qna a, member b WHERE a.author=b.id order BY a.par DESC, a.lev ASC, a.qno ASC);

SELECT * FROM qnalist;

SELECT * FROM qnalist WHERE qno=3;

SELECT a.qno AS qno, a.title AS title, a.content AS content, a.author AS author, a.resdate AS resdate, a.cnt as cnt, a.lev AS lev, a.par AS par, b.name AS name FROM qna a, member b WHERE a.author=b.id AND a.qno=3 order BY a.par DESC, a.lev ASC, a.qno ASC;

COMMIT;

-- 답변만 삭제
DELETE FROM qna WHERE qno=?;

-- 질문 삭제(해당 답변도 같이 삭제해야됨)
DELETE FROM qna WHERE par=?;


CREATE TABLE faq(fno INT PRIMARY KEY AUTO_INCREMENT,
question VARCHAR(500) NOT NULL, answer VARCHAR(1000) NOT NULL, 
cnt INT DEFAULT 0); 

INSERT INTO faq VALUES (DEFAULT, '자주하는 질문1', '자주하는 질문에 대한 답변입니다1<br>오늘도 할일을 내일로 미루시겠습니까?', DEFAULT);
INSERT INTO faq VALUES (DEFAULT, '자주하는 질문2', '자주하는 질문에 대한 답변2<br>오늘도 할일을 내일로 미루시겠습니까?', DEFAULT);
INSERT INTO faq VALUES (DEFAULT, '자주하는 질문3', '자주하는 질문에 대한 답변3입니다. <br>오늘도 할일을 내일로 미루시겠습니까?', DEFAULT);
INSERT INTO faq VALUES (DEFAULT, '자주하는 질문4', '자주하는 질문에 대한 답변입니다4<br>오늘도 할일을 내일로 미루시겠습니까?', DEFAULT);
INSERT INTO faq VALUES (DEFAULT, '자주하는 질문5', '자주하는 질문에 대한 답변5<br>오늘도 할일을 내일로 미루시겠습니까?', DEFAULT);
INSERT INTO faq VALUES (DEFAULT, '자주하는 질문6', '자주하는 질문에 대한 답변6입니다. <br>오늘도 할일을 내일로 미루시겠습니까?', DEFAULT);
INSERT INTO faq VALUES (DEFAULT, '자주하는 질문7', '자주하는 질문에 대한 답변7', DEFAULT);
INSERT INTO faq VALUES (DEFAULT, '자주하는 질문8', '자주하는 질문에 대한 답변8', DEFAULT);
INSERT INTO faq VALUES (DEFAULT, '자주하는 질문9', '자주하는 질문에 대한 답변9', DEFAULT);

COMMIT;

