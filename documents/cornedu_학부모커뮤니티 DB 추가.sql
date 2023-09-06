CREATE DATABASE cornedu;

-- 윈도우 노트북 안될 때 사용
ALTER DATABASE cornedu DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

USE cornedu;

-- per에는 관리자, 학생, 학부모만 INSERT 가능
CREATE TABLE member(
                       id VARCHAR(16) NOT NULL,
                       pw VARCHAR(330) NOT NULL,
                       NAME VARCHAR(100) NOT NULL,
                       email VARCHAR(100) NOT NULL,
                       tel VARCHAR(13),
                       resdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
                       POINT INT DEFAULT 0,
                       per VARCHAR(5) CHECK(per IN(0, 1, 2)),
                       PRIMARY KEY (id));

INSERT INTO member(id, pw, NAME, email, tel, per)
VALUES('admin','1234', '관리자', 'admin@edu.com', '010-1004-1004', 0);
INSERT INTO member(id, pw, NAME, email, tel, per)motherboard
    VALUES('kimhk','9876', '김현경', 'kimhk@edu.com', '010-1234-5678', 1);
INSERT INTO member(id, pw, NAME, email, tel, per)
VALUES('kimbk','1111', '김보경', 'kimbk@edu.com', '010-8765-4321', 1);
INSERT INTO member(id, pw, NAME, email, tel, per)
VALUES('park','2222', '박진권', 'park@edu.com', '010-1111-2222', 2);
INSERT INTO member(id, pw, NAME, email, tel, per)
VALUES('oh','4321', '오태훈', 'oh@edu.com', '010-1122-3344', 2);
INSERT INTO member(id, pw, NAME, email, tel, per)
VALUES('shin','3333', '신예은', 'shin@edu.com', '010-9999-8888', 2);

COMMIT;

SELECT * FROM member;

UPDATE member SET pw='03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4' WHERE id='admin';
UPDATE member SET pw='0ffe1abd1a08215353c233d6e009613e95eec4253832a761af28ff37ac5a150c' WHERE id='kimbk';
UPDATE member SET pw='dbff5341acad5e2a58db4efd5e72e2d9a0a843a28e02b1183c68162d0a3a3de6' WHERE id='kimhk';
UPDATE member SET pw='fe2592b42a727e977f055947385b709cc82b16b9a87f88c6abf3900d65d0cdc3' WHERE id='oh';
UPDATE member SET pw='edee29f882543b956620b26d0ee0e7e950399b1c4222f5de05e06425b4c995e9' WHERE id='park';
UPDATE member SET pw='318aee3fed8c9d040d35a7fc1fa776fb31303833aa2de885354ddf3d44d8fb69' WHERE id='shin';

--------------------------------------------------------------

-- 공지사항(board) 테이블 생성
CREATE TABLE board(
                      bno INT PRIMARY KEY AUTO_INCREMENT,
                      title VARCHAR(200) NOT NULL,
                      content VARCHAR(1000),
                      author VARCHAR(16),
                      resdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                      cnt INT DEFAULT 0);

-- 공지사항 더미글 추가 8건
INSERT INTO board(title, content, author)
VALUES ('공지사항1', '여기는 공지사항1입니다', 'admin');
INSERT INTO board(title, content, author)
VALUES ('공지사항2', '여기는 공지사항2입니다', 'admin');
INSERT INTO board(title, content, author)
VALUES ('공지사항3', '여기는 공지사항3입니다', 'admin');
INSERT INTO board(title, content, author)
VALUES ('공지사항4', '여기는 공지사항4입니다', 'admin');
INSERT INTO board(title, content, author)
VALUES ('공지사항5', '여기는 공지사항5입니다', 'admin');
INSERT INTO board(title, content, author)
VALUES ('공지사항6', '여기는 공지사항6입니다', 'admin');
INSERT INTO board(title, content, author)
VALUES ('공지사항7', '여기는 공지사항7입니다', 'admin');
INSERT INTO board(title, content, author)
VALUES ('공지사항8', '여기는 공지사항8입니다', 'admin');

COMMIT;

SELECT * FROM board;

------------------------------------------------------

-- 학부모 게시판 생성
CREATE TABLE motherboard(
                            bno INT PRIMARY KEY AUTO_INCREMENT,
                            title VARCHAR(200) NOT NULL,
                            content VARCHAR(1000),
                            author VARCHAR(16),
                            resdate TIMESTAMP NOT NULL default CURRENT_TIMESTAMP,
                            cnt INT DEFAULT 0
                            FOREIGN KEY(author) REFERENCES member(id) ON DELETE CASCADE);

-- motherboard JOIN & VIEW 생성 ( 내가 쓴 글에 이용)
SELECT a.bno AS bno, a.title AS title, a.content AS content ,a.author AS author,a.resdate AS resdate ,a.cnt AS cnt, b.id as id FROM motherboard a, member b WHERE a.author =b.id;
CREATE view motherboardlist AS (SELECT a.bno AS bno ,a.title AS title, a.content AS content ,a.author AS author,a.resdate AS resdate ,a.cnt AS cnt, b.id as id FROM motherboard a, member b WHERE a.author =b.id);
SELECT * FROM motherboardlist;

-- 게시판 더미글 추가 8건
INSERT INTO motherboard(title, content, author)
VALUES ('N수생, 수능서 1.5배 증가... 9월 모평 성적 보수적으로 평가해야', '기사 제목 : N수생, 수능서 1.5배 증가... 9월 모평 성적 보수적으로 평가해야
주요내용
- 지난해 9월 모평은 고3, 수능은 N수생이 "1·2등급 과반"
- 올해 수능 N수생 유입 예상치, 지난해와 비슷
- 수능에 대한 지나친 기대보다 졸업생 유입 고려해 보수적으로 접근, 최대한 준비해야', 'shin');

INSERT INTO motherboard(title, content, author)
VALUES ('수능 D-90... 9월 모평 후 학습계획 변경도 염두해야', '기사 제목 : 수능 D-90... 9월 모평 후 학습계획 변경도 염두해야

주요내용

- 9월 모평, "킬러문항 배제" 방향성 적용되는 첫 시험

- 90일 남은 시점... 다양한 문제풀이와 주어진 시간 안에 문제 푸는 연습으로 수능 실전 감각 키워야

- EBS 인터넷 강의와 교재는 반드시 참고, 비연계 지문에 대한 대비도 필요

- 9월 모의평가 이후 학급 분위기에 휩쓸리지 않기... 수시 올인 혹은 정시 지원 방향 결정해야', 'park');

INSERT INTO motherboard(title, content, author)
VALUES ('입학사정관이 말하는 2024학년도 수시 학종 면접 준비 방법', '기사 제목 : 입학사정관이 말하는 2024학년도 수시 학종 면접 준비 방법

주요내용

- 자신이 지원한 대학의 면접 유형 파악이 우선, 학생부 숙지 필수

- 블라인드 면접, 개인 정보 노출하면 불이익 있어 유의

- 대학별 면접일정 확인... 대학별 면접고사 중복 유의', 'park');

INSERT INTO motherboard(title, content, author)
VALUES ('정시까지 가지 않더라도 수능 준비를 계속 해야하는 이유', '기사 제목 : 정시까지 가지 않더라도 수능 준비를 계속 해야하는 이유

주요내용

- 내신이 좋지 않더라도 모의고사를 계속 붙잡아야 해

- 내신이 애매한 등급대일 수록 모의고사에 집중

- 이제는 반환점을 돌아 다시 달려가야 하는 시기', 'shin');

INSERT INTO motherboard(title, content, author)
VALUES ('올해 수능 100일 앞으로... 성적관리만큼 중요한 수험생 건강관리 수칙', '기사 제목 : 올해 수능 100일 앞으로... 성적관리만큼 중요한 수험생 건강관리 수칙

주요내용

- 피로, 스트레스 심하면 두통 유발할 수도... 틈틈이 스트레칭하면 증상 완화에 도움

- 덥고 피곤해도 카페인 섭취는 적당히... 100일 전부터 규칙적 수면 취해야

- 나만의 스트레스 해소법으로 불안 퇴치하길 (음악감상, 명상, 햇볕 쬐기, 친구와의 수다, 산책, 가벼운 운동 등)', 'oh');
INSERT INTO motherboard(title, content, author)
VALUES ('"수능 D-100" 영역별 대비 전략 다시 한번 살펴보자', '여기는 학부모 게시판6입니다', 'oh');
INSERT INTO motherboard(title, content, author)
VALUES ('수시 내신 합격선 상승…올해 비교과 배제로 더 오를 듯', '여기는 학부모 게시판7입니다', 'park');
INSERT INTO motherboard(title, content, author)
VALUES ('"문과 교차지원 할 것" 이과생 작년보다 21%p↓', '여기는 학부모 게시판8입니다', 'oh');

COMMIT;

-- 게시판 테이블 검색
SELECT * FROM motherboard;


-- 데이터 출처 : https://www.adiga.kr/PageLinkAll.do?link=/kcue/ast/eip/eis/inf/bbs/EipUnventNews.do&p_menu_id=PG-EIP-07601
-- 데이터 출처 : https://www.ebsi.co.kr/ebs/ent/enta/retrieveEntNewsEduList.ebs
--------------------------------------------------------

-- 학생 게시판 생성
CREATE TABLE studentboard(
                             bno INT PRIMARY KEY AUTO_INCREMENT,
                             title VARCHAR(200) NOT NULL,
                             content VARCHAR(1000),
                             author VARCHAR(16),
                             resdate TIMESTAMP NOT NULL default CURRENT_TIMESTAMP,
                             cnt INT DEFAULT 0
                             FOREIGN KEY(author) REFERENCES member(id) ON DELETE CASCADE);


-- studentboard JOIN & VIEW 생성 ( 내가 쓴 글에 이용)
SELECT a.bno AS bno, a.title AS title, a.content AS content ,a.author AS author,a.resdate AS resdate ,a.cnt AS cnt, b.id as id FROM studentboard a, member b WHERE a.author =b.id;
CREATE view studentboardlist AS (SELECT a.bno AS bno, a.title AS title, a.content AS content ,a.author AS author,a.resdate AS resdate ,a.cnt AS cnt, b.id as id FROM studentboard a, member b WHERE a.author =b.id);
SELECT * FROM studentboardlist;

-- 게시판 테이블 구조 보기
DESC studentboard;

-- 게시판 더미글 추가 8건
INSERT INTO studentboard(title, content, author)
VALUES ('2024 EBS 수능완성 실전편 5회 전문항 풀이', '여기는 학생 게시판1입니다', 'kimhk');
INSERT INTO studentboard(title, content, author)
VALUES ('유니스트/지스트/디지스트 합격하는 과학 기술원 자기 소개서 만들기 사진링크new', '여기는 학생 게시판2입니다', 'kimbk');
INSERT INTO studentboard(title, content, author)
VALUES ('[수학칼럼] 예비 고3은 개념정리를 꼼꼼하게 하세요 + 반드시 알아야하는 내용 3개 정리', '여기는 학생 게시판3입니다', 'kimbk');
INSERT INTO studentboard(title, content, author)
VALUES ('[자료] 하루하루 남기다 보면 늘어가는 국어 #196 비문학 사진 [1]', '여기는 학생 게시판4입니다', 'kimhk');
INSERT INTO studentboard(title, content, author)
VALUES ('[칼럼] 방학기간 예비 고3 선택과목 준비법', '여기는 학생 게시판5입니다', 'kimhk');
INSERT INTO studentboard(title, content, author)
VALUES ('수능과 내신 대비) EBS 수능특강 문학 고전산문 03강 임춘 - 공방전 (036)', '여기는 학생 게시판6입니다', 'kimbk');
INSERT INTO studentboard(title, content, author)
VALUES ('[칼럼] 새학기가 시작되기 직전, 슬럼프가 온 여러분들에게 쓰는 글 사진링크', '여기는 학생 게시판7입니다', 'kimbk');
INSERT INTO studentboard(title, content, author)
VALUES ('의대 박살내는 회독법 총정리', '여기는 학생 게시판8입니다', 'kimbk');

COMMIT;

-- 게시판 테이블 검색
SELECT * FROM studentboard;

-- 기존 테이블 존재시 현재 테이블을 참조하는 테이블도삭제
DROP TABLE if EXISTS qna CASCADE;

---------------------------------------------------------

-- 질문 및 답변 테이블 생성
CREATE TABLE qna(
                    qno INT PRIMARY KEY AUTO_INCREMENT,
                    title VARCHAR(200) NOT NULL,
                    content VARCHAR(1000),
                    author VARCHAR(16),
                    resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
                    cnt INT DEFAULT 0,
                    lev INT DEFAULT 0,		-- 질문(0), 답변(1)
                    par INT,						-- 부모 글번호 -> 질문(자신 레코드의 qno), 답변(질문의 글번호)
                    FOREIGN KEY(author) REFERENCES member(id) ON DELETE CASCADE
);

DESC qna;

-- 더미 데이터 작성
INSERT INTO qna(title, content, author, lev) VALUES('질문1', '질문입니다. 1', 'kimbk', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=1;

INSERT INTO qna(title, content, author, lev) VALUES('질문2', '질문입니다. 2', 'park', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=2;

INSERT INTO qna(title, content, author, lev) VALUES('질문3', '질문입니다. 3', 'kimhk', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=3;

INSERT INTO qna(title, content, author, lev) VALUES('질문4', '질문입니다. 4', 'park', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=4;

INSERT INTO qna(title, content, author, lev) VALUES('질문5', '질문입니다. 5', 'kimbk', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=5;

INSERT INTO qna(title, content, author, lev) VALUES('질문6', '질문입니다. 6', 'oh', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=6;

INSERT INTO qna(title, content, author, lev) VALUES('질문7', '질문입니다. 7', 'shin', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=7;

INSERT INTO qna(title, content, author, lev) VALUES('질문8', '질문입니다. 8', 'shin', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=8;

INSERT INTO qna(title, content, author, lev) VALUES('질문9', '질문입니다. 9', 'park', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=9;

INSERT INTO qna(title, content, author, lev) VALUES('질문10', '질문입니다. 10', 'kimbk', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=10;

INSERT INTO qna(title, content, author, lev, par) VALUES ('질문1에 대한 답변', '답변입니다. 1', 'park', 1, 1);
INSERT INTO qna(title, content, author, lev, par) VALUES ('질문2에 대한 답변', '답변입니다. 2.', 'admin', 1, 2);
INSERT INTO qna(title, content, author, lev, par) VALUES ('질문3에 대한 답변', '답변입니다. 3', 'admin', 1, 3);
INSERT INTO qna(title, content, author, lev, par) VALUES ('질문4에 대한 답변', '답변입니다. 4', 'admin', 1, 4);
INSERT INTO qna(title, content, author, lev, par) VALUES ('질문5에 대한 답변', '답변입니다. 5', 'admin', 1, 5);
INSERT INTO qna(title, content, author, lev, par) VALUES ('질문6에 대한 답변', '답변입니다. 6', 'admin', 1, 6);
INSERT INTO qna(title, content, author, lev, par) VALUES ('질문7에 대한 답변', '답변입니다. 7', 'admin', 1, 7);
INSERT INTO qna(title, content, author, lev, par) VALUES ('질문8에 대한 답변', '답변입니다. 8', 'admin', 1, 8);
INSERT INTO qna(title, content, author, lev, par) VALUES ('질문9에 대한 답변', '답변입니다. 9', 'admin', 1, 9);
INSERT INTO qna(title, content, author, lev, par) VALUES ('질문10에 대한 답변', '답변입니다. 10', 'admin', 1, 10);

COMMIT;

-- QnA 리스트
SELECT a.qno AS qno, a.title AS title, a.content AS content, a.author AS author, a.resdate AS resdate, a.cnt AS cnt, a.lev AS lev,
       a.par AS par, b.name AS name
FROM qna a, member b WHERE a.author=b.id ORDER BY a.par DESC, a.lev ASC, a.qno ASC;

-- qna JOIN & VIEW 생성 ( 내가 쓴 글에 이용)
CREATE VIEW qnalist2 AS (SELECT a.qno AS qno, a.title AS title, a.content AS content, a.author AS author, a.resdate AS resdate, a.cnt AS cnt, a.lev AS lev,
                         a.par AS par, b.id AS idFROM qna a, member b WHERE a.author=b.id ORDER BY a.par DESC, a.lev ASC, a.qno ASC);
SELECT * FROM qnalist2;


-----------------------------------------------------------------------------------------------------------------------

-- FAQ 테이블 생성
CREATE TABLE faq (
                     fno INT PRIMARY KEY AUTO_INCREMENT,
                     question VARCHAR(1000) NOT NULL,
                     answer VARCHAR(1000) NOT NULL,
                     cnt INT DEFAULT 0 NOT NULL
);

INSERT INTO faq(question, answer) VALUES('자주 묻는 질문입니다1', '답변입니다1');
INSERT INTO faq(question, answer) VALUES('자주 묻는 질문입니다2', '답변입니다2');
INSERT INTO faq(question, answer) VALUES('자주 묻는 질문입니다3', '답변입니다3');
INSERT INTO faq(question, answer) VALUES('자주 묻는 질문입니다4', '답변입니다4');
INSERT INTO faq(question, answer) VALUES('자주 묻는 질문입니다5', '답변입니다5');

COMMIT;

----------------------------------------------------------------------------------
-- 공지사항 게시판 댓글 테이블 생성
CREATE table boardComment (
                              cno INT AUTO_INCREMENT PRIMARY KEY,
                              bno INT,
                              author VARCHAR(16),
                              resdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
                              content VARCHAR(200),
                              FOREIGN KEY(bno) REFERENCES board(bno) on DELETE CASCADE
);

SELECT * FROM boardComment;

----------------------------------------------------------------------------------
-- 학부모 게시판 댓글 테이블 생성
create table motherComment(
                              cno INT AUTO_INCREMENT PRIMARY KEY,
                              bno INT,
                              author VARCHAR(16),
                              resdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
                              content VARCHAR(200),
                              FOREIGN KEY(bno) REFERENCES motherboard(bno) ON DELETE CASCADE
);

SELECT * FROM mothercomment;

----------------------------------------------------------------------------------------------------------------------------
-- 학생 게시판 댓글 테이블 생성
create table studentComment(
                               cno INT AUTO_INCREMENT PRIMARY KEY,
                               bno INT,
                               author VARCHAR(16),
                               resdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
                               content VARCHAR(200),
                               FOREIGN KEY(bno) REFERENCES studentboard(bno) ON DELETE CASCADE
);

-- 더미 데이터 추가
INSERT INTO studentComment(bno, author, content)
VALUES(1, 'admin', '댓글 기능 더미데이터1');
INSERT INTO studentComment(bno, author, content)
VALUES(1, 'admin', '댓글 기능 더미데이터2');
INSERT INTO studentComment(bno, author, content)
VALUES(1, 'shin', '댓글 기능 더미데이터3');

COMMIT;

SELECT * FROM studentcomment;

-----------------------------------------------------------------------------------------------------------------------------
-- 강의 테이블 생성
CREATE TABLE lecture(
                        lno INT AUTO_INCREMENT PRIMARY KEY,
                        lectureName VARCHAR(500) NOT NULL,
                        teacher VARCHAR(10) NOT NULL,
                        content VARCHAR(500),
                        filePath VARCHAR(200),
                        target VARCHAR(10) CHECK(target IN('초등','중등','고등'))
);

-- 초등 강의 더미데이터 5건
INSERT INTO lecture(lectureName, teacher, content, filePath, target)
VALUES('파닉스 레이스','김영어','숨은 그림 찾기로 영어에 대한 흥미를 키워요','/images/lecture01.png','초등');
INSERT INTO lecture(lectureName, teacher, content, filePath, target)
VALUES('수학의 신','한매스','수학 신들의 놀이터에 가기 위해 수학 영웅이 되어보아요','/images/lecture02.png','초등');
INSERT INTO lecture(lectureName, teacher, content, filePath, target)
VALUES('과학이 붐!','김과학','앞으로 배울 과학 개념들을 한 번에 모아 공부하고 싶은 초등생을 위한 강의','/images/lecture03.png','초등');
INSERT INTO lecture(lectureName, teacher, content, filePath, target)
VALUES('영어 홈스쿨 레벨1','박레벨','즐겁게 영어 기본기를 다지는 영어홈스쿨!','/images/lecture04.png','초등');
INSERT INTO lecture(lectureName, teacher, content, filePath, target)
VALUES('기적의 문제해결법 6-2','정문제','나의 첫 수학공부를 정문제 선생님과 함께 해요','/images/lecture05.png','초등');

-- 중등 강의 더미데이터 5건
INSERT INTO lecture(lectureName, teacher, content, filePath, target)
VALUES('빠작! 중학 국어','박국어','국어 만점을 받고 싶다면 이 강의를 들어보세요','/images/lecture01.png','중등');
INSERT INTO lecture(lectureName, teacher, content, filePath, target)
VALUES('고전문학 독해','김고전','독해 실력을 키워봐요','/images/lecture02.png','중등');
INSERT INTO lecture(lectureName, teacher, content, filePath, target)
VALUES('단기 영문법 핵심 특강','김영어','영문법을 단기간으로 습득할 수 있는 기회!','/images/lecture03.png','중등');
INSERT INTO lecture(lectureName, teacher, content, filePath, target)
VALUES('귀가 트이는 영어듣기 학습법','정리슨','영어 듣기가 어렵다면 이 강의를 들어보세요','/images/lecture04.png','중등');
INSERT INTO lecture(lectureName, teacher, content, filePath, target)
VALUES('한달 마스터 VOCA 1000','신보카','한 달 안에 영단어 1000개를 외울 수 있는 마법의 강의!','/images/lecture05.png','중등');

-- 고등 강의 더미데이터 5건
INSERT INTO lecture(lectureName, teacher, content, filePath, target)
VALUES('[2024 수능완성] 국어+언어와 매체','박국어','박국어쌤과 함께라면 국어는 걱정 없다!','/images/lecture01.png','고등');
INSERT INTO lecture(lectureName, teacher, content, filePath, target)
VALUES('[2024 수능완성] 수학+확률과 통계','이종영','5등급에서 1등급까지! 노력은 배신하지 않아요','/images/lecture02.png','고등');
INSERT INTO lecture(lectureName, teacher, content, filePath, target)
VALUES('[2024 수능특강] 완벽한 세계사','류역사','4등급 탈출! 상위권으로 가는 날개를 달아주는 강의','/images/lecture03.png','고등');
INSERT INTO lecture(lectureName, teacher, content, filePath, target)
VALUES('[2024 수능특강] 현대소설','박소설','어려운 내용도 재미있게 풀어주는 박소설쌤!','/images/lecture04.png','고등');
INSERT INTO lecture(lectureName, teacher, content, filePath, target)
VALUES('[2024 수능개념] 해석공식 기출구문','주영어','수능 영어 등급 상승의 단 하나의 공식!','/images/lecture05.png','고등');
-- 데이터 참고: EBS 초등, EBS 중등, EBSi

SELECT * FROM lecture;

-------------------------------------------------------------------------------------------------------------------------------------
-- 강의 목록 페이지 구현
CREATE TABLE lectureInfo(
                            vno INT AUTO_INCREMENT PRIMARY KEY,
                            lno INT NOT NULL,
                            vTitle VARCHAR(500) NOT NULL,
                            filePath VARCHAR(200) NOT NULL,
                            duration VARCHAR(100) NOT NULL,
                            FOREIGN KEY(vno) REFERENCES lecture(lno) ON DELETE CASCADE
);

-- 중등 강의 추가
INSERT INTO lectureInfo(lno, vTitle, filePath, duration)
VALUES(1, '[1강] 빠작! 국어 뽀개기', '/videos/lecture_video01', '02:30');
INSERT INTO lectureInfo(lno, vTitle, filePath, duration)
VALUES(1, '[2강] 빠작! 국어 뽀개기', '/videos/lecture_video02', '02:30');
INSERT INTO lectureInfo(lno, vTitle, filePath, duration)
VALUES(1, '[3강] 빠작! 국어 뽀개기', '/videos/lecture_video03', '01:41');
INSERT INTO lectureInfo(lno, vTitle, filePath, duration)
VALUES(1, '[4강] 빠작! 국어 뽀개기', '/videos/lecture_video01', '02:30');
INSERT INTO lectureInfo(lno, vTitle, filePath, duration)
VALUES(1, '[5강] 빠작! 국어 뽀개기', '/videos/lecture_video02', '02:30');
INSERT INTO lectureInfo(lno, vTitle, filePath, duration)
VALUES(1, '[6강] 빠작! 국어 뽀개기', '/videos/lecture_video03', '01:41');
INSERT INTO lectureInfo(lno, vTitle, filePath, duration)
VALUES(1, '[7강] 빠작! 국어 뽀개기', '/videos/lecture_video01', '02:30');
INSERT INTO lectureInfo(lno, vTitle, filePath, duration)
VALUES(1, '[8강] 빠작! 국어 뽀개기', '/videos/lecture_video02', '02:30');
INSERT INTO lectureInfo(lno, vTitle, filePath, duration)
VALUES(1, '[9강] 빠작! 국어 뽀개기', '/videos/lecture_video03', '01:41');
INSERT INTO lectureInfo(lno, vTitle, filePath, duration)
VALUES(1, '[10강] 빠작! 국어 뽀개기', '/videos/lecture_video01', '02:30');
INSERT INTO lectureInfo(lno, vTitle, filePath, duration)
VALUES(1, '[11강] 빠작! 국어 뽀개기', '/videos/lecture_video02', '02:30');

-- 고등 강의 추가
INSERT INTO lectureInfo(lno, vTitle, filePath, duration)
VALUES(11, '[1강] 독서 유형 연습①-②', '/videos/lecture_video01', '02:30');
INSERT INTO lectureInfo(lno, vTitle, filePath, duration)
VALUES(11, '[2강] 독서 유형 연습③', '/videos/lecture_video02', '02:30');
INSERT INTO lectureInfo(lno, vTitle, filePath, duration)
VALUES(11, '[3강] 독서 유형 연습④', '/videos/lecture_video03', '01:41');
INSERT INTO lectureInfo(lno, vTitle, filePath, duration)
VALUES(11, '[4강] 문학 유형 연습①-②', '/videos/lecture_video01', '02:30');
INSERT INTO lectureInfo(lno, vTitle, filePath, duration)
VALUES(11, '[5강] 문학 유형 연습③', '/videos/lecture_video02', '02:30');
INSERT INTO lectureInfo(lno, vTitle, filePath, duration)
VALUES(11, '[6강] 문학 유형 연습④-⑤', '/videos/lecture_video03', '01:41');