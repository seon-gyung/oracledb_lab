
-- having은 group by 되고 난 뒤에 조건절이다.
SELECT job, max(sal)
FROM emp
GROUP BY job
HAVING max(sal) >= 2500;

SELECT *
FROM
(
    SELECT job, max(sal) money
    FROM emp
    GROUP BY job
)
WHERE money > 2500; 

SELECT avg(point), g1
FROM
(
    SELECT gname, point, ceil(ROWNUM/5) g1
    FROM gogak
)
GROUP BY g1; -- 4행

SELECT avg(point), g1
FROM
(
    SELECT gname, point, mod(ROWNUM, 2) g1
    FROM gogak
)
GROUP BY g1; -- 4행

-- student 테이블에서 담당교수별로 관리하고 있는 학생들을 카운팅하시오. count() 
SELECT profno, COUNT(*)
FROM student
WHERE profno is not null
GROUP BY profno;

-- student 테이블에서 비만 그룹 몸무게 평균과 마름 그룹 몸무게 평균을 구하시오
-- 60키로 이상 (비만), 60키로 미만(마름)
SELECT round(avg(weight), 2), decode(g1, 1, '비만', '마름') 비만도
FROM
(
    SELECT name, weight, floor(weight/60) g1
    FROM student ORDER BY weight
)
group by g1;

-- student 테이블에서 비만 그룹 몸무게 평균과 마름 그룹 몸무게 평균을 구하시오
-- 60키로 이상 (비만), 60키로 미만(마름)
-- case when으로 다시 풀어보세요. ★숙제★
SELECT round(avg(weight), 1) 몸무게평균, 비만도
FROM
(
    SELECT name, weight,
    CASE WHEN weight >= 60 THEN '비만' ELSE '마름' END 비만도
    FROM student
    ORDER BY weight
)
GROUP BY 비만도;

-- 순위 구하기 1,3 4,6 7,9

-- rank() over()
SELECT ename, rank() OVER (ORDER BY sal DESC) 순위, sal
FROM emp;

-- dense_rank() OVER()
SELECT ename, dense_rank() OVER (ORDER BY sal DESC) 순위, sal
FROM emp;

-- UNION ALL로 복잡한 통계쿼리 구현하기
SELECT sal, deptno, rank() OVER (ORDER BY sal DESC)
FROM emp
WHERE deptno = 10

UNION ALL

SELECT SUM(sal), null, null
FROM emp
WHERE deptno = 10

UNION ALL

SELECT sal, deptno, rank() OVER (ORDER BY sal DESC)
FROM emp
WHERE deptno = 20

UNION ALL

SELECT SUM(sal), null, null
FROM emp
WHERE deptno = 20

UNION ALL
SELECT sal, deptno, rank() OVER (ORDER BY sal DESC)
FROM emp
WHERE deptno = 30

UNION ALL

SELECT SUM(sal), null, null
FROM emp
WHERE deptno = 30

UNION ALL

SELECT SUM(sal), null, null
FROM emp;

-- PARTITION BY (그룹핑)
SELECT deptno, rank() OVER (PARTITION BY deptno ORDER BY sal DESC)
FROM emp;

-- ROLL UP (소계 값, 총계 값)
-- 1. deptno, job으로 롤업한다.
-- 2. deptno 소계를 구한다.
-- 3. 전체 소계를 구한다.
SELECT deptno, sum(sal)
FROM emp
GROUP BY rollup(deptno);

SELECT deptno, job, sum(sal)
FROM emp
GROUP BY rollup(deptno, job); -- deptno, job 롤업

-- 1. job으로 롤업한다.
-- 2. 전체 소계를 구한다.
SELECT job, sum(sal)
FROM emp
GROUP BY rollup(job); -- job 롤업

SELECT job, sum(sal)
FROM emp
GROUP BY rollup(job, deptno, comm); -- job 롤업

-- PIVOT


