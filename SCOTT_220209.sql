-- 서브 쿼리 (1. 인라인뷰, 2. 스칼라 서브쿼리, 3. 서브쿼리)

-- 스칼라 서브쿼리 (컬럼)
SELECT avg(sal) FROM emp;

SELECT e.*, (SELECT avg(sal) FROM emp) FROM emp e ORDER BY deptno;

-- 서브쿼리 (웨얼)
SELECT max(sal) FROM emp;

SELECT * FROM emp WHERE sal = (SELECT max(sal) FROM emp);

SELECT * FROM emp WHERE sal in (SELECT sal FROM emp WHERE sal > 2000);

-- 인라인뷰 (프롬)
-- FROM이 들고 있는 ROWNUM을 사용하려면 아래와 같이 별칭을 쓴다.
SELECT ename, sal, R1
FROM (
    SELECT ename, sal, ROWNUM R1
    FROM emp
    ORDER BY sal DESC
);

-- 됨
SELECT ename, sal, rownum FROM emp
WHERE rownum < 3;

-- 안됨
SELECT ename, sal, rownum FROM emp
WHERE rownum > 2;

-- STUDENT 테이블에 키 순위를 구하고 5~8위 출력하기
SELECT name, height, rank
FROM
(
    SELECT e1.*, rownum rank
    FROM
    (
        SELECT name, height
        FROM student
        ORDER BY height DESC
    ) e1
)
WHERE rank >= 5 AND rank <= 8;

-- GROUP 그룹 (세로연산) - sum, avg, count, max, min
SELECT sum(sal), job
FROM emp
GROUP BY job;

-- 같은 나이별(substr) 키의 평균을 구하시오. - 인라인뷰를 활용
SELECT year, avg(height)
FROM
(
    SELECT substr(jumin, 1, 2) year, height
    FROM student
)
GROUP BY year; -- 75, 76, 77, 78

-- 1. 같은 지역별 최고 키를 구하시오. - 인라인뷰 활용 student
SELECT t1, max(height)
FROM
(
    SELECT substr(tel, 1, instr(tel, ')')-1) t1 , height
    FROM student
)
GROUP BY t1;

-- 2. 순서대로 5명씩 끊어서 포인트의 평균 구하시오. mod, /, *, gogak
