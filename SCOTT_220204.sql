-- SELECT 문법

-- 1. distinct 중복제거
SELECT DISTINCT deptno
FROM emp;

SELECT DISTINCT job
FROM emp;

-- 2. 결합 연산자 ||
SELECT '나의 이름은 ' || ename
FROM emp;

-- 3. 별칭 as
SELECT '나의 이름은 ' || ename as "자기소개" FROM emp; -- 원형
SELECT '나의 이름은 ' || ename 자기소개 FROM emp; -- as, "" 생략 가능
SELECT sal*12 연봉 FROM emp;

-- 4. NVL null값 변경하기 (DB는 null이 들어가면 연산이 안된다)
SELECT ename, sal+nvl(comm, 0) 월급, nvl(comm, 0) -- ?nvl(cullum, null 바꿀 값)
FROM emp;

-- 5. decode (조건문 = if)
SELECT decode(comm, null, 0, comm) 보너스 -- comm이 null이면 0, 아니면 comm
FROM emp;

-- 실습 1번
SELECT name || 'is ID: ' || id || ',' || ' WEIGHT is ' || weight || 'kg'
"ID AND WEIGHT"
FROM student;

DESC student;

-- 실습 2번
SELECT ename || '(' || job || ')' || ' , ' || ename || '''' || job || ''''
"NAME AND JOB"
FROM emp;

DESC emp;

-- 실습 3번
SELECT ename || ' is sal is ' || '$' || sal
"Name and Sal"
FROM emp;

DESC emp;

-- WHERE 문법

-- 1. = 같다
SELECT *
FROM emp
WHERE empno = 7900;

-- 2. < > 크다, 작다 <= => 크거나 같다
SELECT *
FROM emp
WHERE sal < 3000;

-- 3. 문자열 검색
SELECT *
FROM emp
WHERE ename = 'SMITH';

-- 4. 부정 !=, <> 같지 않다
SELECT *
FROM emp
WHERE ename != 'SMITH';

-- 5. OR, IN (같은 컬럼 내에서)
SELECT *
FROM emp
WHERE job = 'MANAGER' OR job = 'CLERK';

SELECT *
FROM emp
WHERE job in ('MANAGER', 'CLERK');

-- 6. AND, BETWEEN
-- tip. 날짜(date 타입) /, - 둘 다 가능
SELECT hiredate
FROM emp
WHERE hiredate >= '1981/02/20' AND hiredate <= '1982/02/22';

SELECT hiredate
FROM emp
WHERE hiredate BETWEEN '1981/02/20' AND '1982/02/22'

-- 7. NULL 찾는 법
SELECT *
FROM emp
WHERE comm is not null;

SELECT *
FROM emp
WHERE comm is not null;

-- 8. 연산된 데이터를 찾는 법
SELECT sal*12 연봉
FROM emp
WHERE sal*12 > 9000;

-- LIKE (네이버 검색, 부분 검색)
SELECT *
FROM emp
WHERE ename LIKE 'S%';

SELECT *
FROM emp
WHERE ename LIKE '%M%';

SELECT *
FROM emp
WHERE ename LIKE '_M%';

SELECT *
FROM emp
WHERE ename LIKE '%H';

SELECT *
FROM emp
WHERE ename LIKE '__I%';

-- ORDER BY 정렬 ASC 오름차순(디폴트), DESC 내림차순 
SELECT *
FROM emp
WHERE job = 'MANAGER'
ORDER BY ename ASC;

SELECT sal, ename, empno
FROM emp
ORDER BY sal DESC, ename ASC;

SELECT mod(sal, 500) 나머지, ename
FROM emp
ORDER BY 1 DESC;

-- 洹몃９ ?뿰?궛?옄 max, count, min, sum, avg (?봽濡쒖젥?뀡 ?뿰?궛)
SELECT max(sal)
FROM emp;

SELECT min(sal)
FROM emp;

SELECT sum(sal)
FROM emp;

SELECT avg(sal)
FROM emp;

SELECT count(ename)
FROM emp;

SELECT sum(sal)
FROM emp
WHERE job = 'MANAGER';

SELECT max(sal)
FROM emp
WHERE job = 'MANAGER';

-- UNION ALL (두개의 집합 더하기 - 조건 : 칼럼의 개수가 같아야 한다. 보통 null을 추가)
SELECT empno, ename, sal
FROM emp
WHERE job = 'SALESMAN'
UNION ALL
SELECT null, null, avg(sal)
FROM emp
WHERE job = 'SALESMAN';
