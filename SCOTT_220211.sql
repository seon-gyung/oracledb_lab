-- PIVOT ★★★★★

SELECT *
FROM cal;

SELECT week,
1 일,
2 월,
3 화,
4 수,
5 목,
6 금,
7 토
FROM cal
GROUP BY week
ORDER BY week;

SELECT
week,
DECODE(day, '일', num_day),
DECODE(day, '월', num_day),
DECODE(day, '화', num_day),
DECODE(day, '수', num_day),
DECODE(day, '목', num_day),
DECODE(day, '금', num_day),
DECODE(day, '토', num_day)
FROM cal;

SELECT
week,
sum(DECODE(day, '일', num_day)) 일,
sum(DECODE(day, '월', num_day)) 월,
sum(DECODE(day, '화', num_day)) 화,
sum(DECODE(day, '수', num_day)) 수,
sum(DECODE(day, '목', num_day)) 목,
sum(DECODE(day, '금', num_day)) 금,
sum(DECODE(day, '토', num_day)) 토
FROM cal
GROUP BY week
ORDER BY week;

SELECT * FROM emp;

SELECT 
sum(DECODE(job, 'MANAGER', sal)) MANAGER,
sum(DECODE(job, 'ANALYST', sal)) ANALYST,
sum(DECODE(job, 'CLERK', sal)) CLERK,
sum(DECODE(job, 'SALESMAN', sal)) SALESMAN,
sum(DECODE(job, 'PRESIDENT', sal)) PRESIDENT
FROM emp;

SELECT *
FROM (SELECT job, sal FROM emp)
PIVOT (sum(sal) for job in ('MANAGER', 'ANALYST', 'CLERK', 'SALESMAN', 'PRESIDENT'));

SELECT *
FROM (SELECT deptno, sal FROM emp)
PIVOT (avg(sal) for deptno in (10, 20, 30));

SELECT job, sum(sal)
FROM emp
GROUP BY job;

SELECT *
FROM cal
PIVOT (sum(num_day) for day in ('일', '월', '화', '수', '목', '금', '토'))
ORDER BY week;

SELECT *
FROM professor;

-- PROFESSOR 테이블에서 POSITION 별 평균 PAY를 구하시오. (피벗해서)
SELECT *
FROM (select position, pay from professor)
pivot (avg(pay) for position in ('정교수', '조교수','전임강사'));

SELECT position, avg(pay)
FROM professor
group by position;