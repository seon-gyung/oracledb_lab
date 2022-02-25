-- 1. 데이터베이스는 테이블의 모임
-- 2. 테이블은 데이터의 모임
-- 3. 테이블은 행(레코드)과 열(프로젝션)을 가진다.
-- 4. 오라클을 설치하면 DBS와 DBMS가 세팅이 된다.
-- 5. DBMS에 SQL을 전송하려면 SQLDevelop을 설치하면 좋다.
-- 6. 검색은 SELECT
-- 7. 검색을 위한 조건이 테이블을 퍼올려야 한다. (하드 -> 메모리) FROM
-- 8. 스키마 보는 법 -> DESC 테이블명
-- 9. 특정 레코드(행) 보는 법 -> WHERE
-- 10. FROM 1번 WHERE 2번 SELECT 3번

SELECT empno, ename, job
FROM emp;

SELECT *
FROM emp;

SELECT deptno, dname, loc
FROM dept;

DESC dept;

SELECT *
FROM emp
WHERE sal = 800;

-- 문자는 홑따옴표로 감싸야 한다. 'MANAGER' 대소문자 구분해야 함.
SELECT *
FROM emp
WHERE job = 'MANAGER';