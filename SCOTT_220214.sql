-- DDL (테이블 생성)
-- create (테이블, 유저 생성) drop (테이블, 유저 삭제), alter (테이블, 유저 수정)

CREATE TABLE USER_TBL2
(	
    NO NUMBER, 
	USERNAME VARCHAR2(20 BYTE) NOT NULL, 
	PASSWORD VARCHAR2(13 BYTE) NOT NULL, 
	GENDER CHAR(3 BYTE), 
    CONSTRAINT "USER_TBL2_PK" PRIMARY KEY ("NO")
);


ALTER TABLE user_tbl2 MODIFY password VARCHAR2(20);

desc user_tbl2;

drop table user_tbl2;

delete from userTbl;

SELECT * FROM usertbl;

-- DML
-- insert
INSERT INTO user_tbl(no, username, password, gender) VALUES(1, 'ssar', 'ssar1234', '남');

INSERT INTO user_tbl(no, username, password, gender) VALUES(2, 'cos', 'cos1234', '여');

INSERT INTO user_tbl(no, username, password) VALUES(3, 'love', 'love1234');

ALTER TABLE user_tbl ADD UNIQUE (username);

SELECT * FROM ALL_CONSTRAINTS
WHERE TABLE_NAME = 'USER_TBL';

INSERT INTO user_tbl(no, username, password) VALUES(4, 'love', 'love1234');
-- delete
DELETE FROM user_tbl WHERE username = 'ssar';
DELETE FROM user_tbl WHERE no = 2;
DELETE FROM user_tbl;

SELECT * FROM user_tbl;
-- update
UPDATE user_tbl SET password = 'love5678' WHERE no = '3';
UPDATE user_tbl SET password = 'love1234', gender = '여' WHERE no = '3';

-- join (테이블 2개를 병합)
SELECT *
FROM emp;

SELECT *
FROM dept;

SELECT e.ename, e.deptno, d.dname, d.loc
FROM emp e INNER JOIN dept d
ON e.deptno = d.deptno;

SELECT *
FROM dept
WHERE deptno =
(
    SELECT deptno
    FROM emp
    WHERE ename = 'SMITH'
);

SELECT *
FROM PROFESSOR;

SELECT *
FROM STUDENT;

SELECT *
FROM STUDENT S INNER JOIN PROFESSOR P
ON S.PROFNO = P.PROFNO;


