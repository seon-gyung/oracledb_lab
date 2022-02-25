drop table posttbl;

CREATE TABLE postTbl
(
    ID NUMBER,
    TITLE VARCHAR2(100 BYTE) NOT NULL,
    CONTENT CLOB NOT NULL,
    USERID NUMBER,
    CONSTRAINT "postTbl_PK" PRIMARY KEY ("ID"),
    CONSTRAINT "postTbl_FK" foreign key ("USERID") references userTbl (id)
);

SELECT * FROM postTbl;
CREATE SEQUENCE SEQ_POSTTBL INCREMENT BY 1 START WITH 1;

INSERT INTO postTbl(id, title, content, userid) VALUES(SEQ_POSTTBL.nextval, '제목1', '내용1', 1);
INSERT INTO postTbl(id, title, content, userid) VALUES(SEQ_POSTTBL.nextval, '제목2', '내용2', 2);
INSERT INTO postTbl(id, title, content, userid) VALUES(SEQ_POSTTBL.nextval, '제목3', '내용3', 2);
INSERT INTO postTbl(id, title, content, userid) VALUES(SEQ_POSTTBL.nextval, '제목4', '내용4', 55);

drop table userTbl;
delete from posttbl;

SELECT *
FROM student;

-- STUDENT(N - 드라이빙, FK), DEPARTMENT (1)
-- 1. STUDENT (DEPTNO2 = FK) 테이블과 DEPARTMENT (DEPTNO = PK) 테이블 -> 동일 조인
SELECT *
FROM department d INNER JOIN student s
ON d.deptno = s.deptno2;

-- 2. 모든 학생을 다 출력하고, 연관된 부전공 정보도 조인해서 보여주세요.
SELECT *
FROM department d RIGHT OUTER JOIN student s
ON d.deptno = s.deptno2;

-- 3. 모든 학과를 다 출력하고, 연관된 학생의 정보를 조인해서 보여주세요.
SELECT *
FROM department d LEFT OUTER JOIN student s
ON d.deptno = s.deptno1;

SELECT * FROM posttbl;
-- user(1), post(N)-드라이빙, FK
SELECT *
FROM postTbl p right outer join user_Tbl u
on p.userId = u.id;


SELECT *
FROM emp;