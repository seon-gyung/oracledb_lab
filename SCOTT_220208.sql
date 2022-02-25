SELECT instr('051)2222-4444)', ')')-1 FROM dual;
SELECT instr('02)2222-4444)', ')')-1 FROM dual;

SELECT tel, substr(tel, 1, instr(tel, ')')-1) FROM student;

SELECT * FROM student;

-- 첫번째 문제. 전화번호 가운데 부분 추출하기
SELECT tel, substr(tel, instr(tel, ')')+1, instr(tel, '-')-instr(tel, ')')-1) 중간번호 FROM student;



-- 숫자 관련 함수
SELECT avg(sal) FROM emp;

-- ROUND 5부터 반올림됨. 두번째 인수는 소숫점 몇자리까지 표현할 건지
SELECT ROUND(987.664, 1) FROM dual;

-- TRUNC 소수점 이하 버리기
SELECT TRUNC(987.664) FROM dual;

-- mod 나머지 구하기
SELECT MOD(6,4) FROM dual;


-- 날짜 sysdate 현재시간 출력
SELECT sysdate FROM dual;

SELECT * FROM emp;

-- MONTHS_BETWEEN 사이의 개월수
SELECT MONTHS_BETWEEN(SYSDATE, hiredate) FROM emp;

SELECT ENAME,
TRUNC(MONTHS_BETWEEN(SYSDATE,hiredate)/12) 근속년도,
DECODE(TRUNC(MONTHS_BETWEEN(SYSDATE,hiredate)/12), 40, '금반지 증정', '없음')
FROM emp;

-- ADD_MONTHS 개월수 더하기
SELECT ADD_MONTHS(sysdate, 3) FROM dual;

-- LAST_DAY 마지막 날짜 알려주기
SELECT LAST_DAY(SYSDATE) FROM dual;


-- 형변환 함수 to_number(), to_char(), to_date()
SELECT 2 + to_number('2') FROM dual;

SELECT to_date('2020/04/01') FROM dual;

-- YYYY MM DD hh mm ss 년 월 일 시 분 초
SELECT to_char(hiredate, 'YYYY-MM-DD:hh:mm') FROM emp;

-- 오라클 제공 DAY 요일
SELECT to_char(hiredate, 'DAY') FROM emp;

SELECT to_char(1530, '$9999') FROM dual;
SELECT to_char(1530, '$9,999') FROM dual;
SELECT to_char(sal, '$9,999,999') FROM emp;

-- 1. 20번 부서에 소속된 직원들의 이름과 2~3번째 글자 '-'으로 출력
SELECT REPLACE(ename, substr(ename, 2, 2), '--')
FROM emp
WHERE deptno = 20;

-- 2. 1전공이 101번인 학생들의 이름과, 주민등록번호를 출력하되 주민등록번호의 뒤 7자리는 -과 /로 표시
SELECT name, REPLACE(jumin, substr(jumin, 7, 7), '-/-/-/-')
FROM student
WHERE deptno1 = 101;

-- 3. 1전공이 102번인 학생들의 이름과, 전화번호, 전화번호의 국번은 * 처리. 단, 국번은 3자리
SELECT name, tel, replace(tel, substr(tel, instr(tel, ')')+1, 3), '***')
FROM student
WHERE deptno1 = 102;

-- 4. 1전공이 101번인 학생들의 이름과 전화번호와 전화번호의 지역번호, 국번 제외 나머지 번호는 * 처리
SELECT name, tel, REPLACE(tel, substr(tel, instr(tel, '-')+1, 4), '****')
FROM student
WHERE deptno1 = 101;


-- 1번 부서번호가 10번인 부서의 사람 중 사원번호, 이름, 월급을 출력하라.
SELECT empno EMPNO, ename ENAME, sal SAL
FROM emp
WHERE deptno = 10;
-- 2번 사원번호가 7369인 사람 중 이름, 입사일, 부서번호를 출력하라.
SELECT ename ENAME, TO_char(hiredate, 'YYYY-MM-DD:hh:mm') HIREDATE, deptno DEPNO
FROM emp
WHERE empno = 7369;
-- 3번 이름이 ALLEN인 사람의 모든 정보를 출력하라.
SELECT *
FROM emp
WHERE ename = 'ALLEN';
-- 4번 입사일이 80/12/17인 사원의 이름, 부서번호, 월급을 출력하라. ex) HIREDATE = "80/12/17"
SELECT ename ENAME, deptno DEPTNO, sal Sal
FROM emp
WHERE hiredate = '80/12/17';
-- 5번 직업이 MANAGER가 아닌 사람의 모든 정보를 출력하라. ex) !=, <>, not in ('','','')
SELECT *
FROM emp
WHERE job != 'MANAGER';
-- 6번 입사일이 81/04/02 이후에 입사한 사원의 정보를 출력하라.
SELECT *
FROM emp
WHERE hiredate > '81/04/02';
-- 7번 급여가 $800 이상인 사람의 이름, 급여, 부서번호를 출력하라.
SELECT ename, sal, deptno
FROM emp
WHERE sal >= 800;
-- 8번 부서번호가 20번 이상인 사원의 모든 정보를 출력하라.
SELECT *
FROM emp
WHERE deptno >= 20;
-- 9번 입사일이 81/12/09 보다 먼저 입사한 사람들의 모든 정보를 출력하라.
SELECT *
FROM emp
WHERE hiredate < '81/12/09';
-- 10번 입사번호가 7698보다 작거나 같은 사람들의 입사번호와 이름을 출력하라.
SELECT empno, ename
FROM emp
WHERE empno >= 7698;

