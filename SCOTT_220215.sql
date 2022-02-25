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

INSERT INTO postTbl(id, title, content, userid) VALUES(SEQ_POSTTBL.nextval, '����1', '����1', 1);
INSERT INTO postTbl(id, title, content, userid) VALUES(SEQ_POSTTBL.nextval, '����2', '����2', 2);
INSERT INTO postTbl(id, title, content, userid) VALUES(SEQ_POSTTBL.nextval, '����3', '����3', 2);
INSERT INTO postTbl(id, title, content, userid) VALUES(SEQ_POSTTBL.nextval, '����4', '����4', 55);

drop table userTbl;
delete from posttbl;

SELECT *
FROM student;

-- STUDENT(N - ����̺�, FK), DEPARTMENT (1)
-- 1. STUDENT (DEPTNO2 = FK) ���̺�� DEPARTMENT (DEPTNO = PK) ���̺� -> ���� ����
SELECT *
FROM department d INNER JOIN student s
ON d.deptno = s.deptno2;

-- 2. ��� �л��� �� ����ϰ�, ������ ������ ������ �����ؼ� �����ּ���.
SELECT *
FROM department d RIGHT OUTER JOIN student s
ON d.deptno = s.deptno2;

-- 3. ��� �а��� �� ����ϰ�, ������ �л��� ������ �����ؼ� �����ּ���.
SELECT *
FROM department d LEFT OUTER JOIN student s
ON d.deptno = s.deptno1;

SELECT * FROM posttbl;
-- user(1), post(N)-����̺�, FK
SELECT *
FROM postTbl p right outer join user_Tbl u
on p.userId = u.id;


SELECT *
FROM emp;