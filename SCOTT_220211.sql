-- PIVOT �ڡڡڡڡ�

SELECT *
FROM cal;

SELECT week,
1 ��,
2 ��,
3 ȭ,
4 ��,
5 ��,
6 ��,
7 ��
FROM cal
GROUP BY week
ORDER BY week;

SELECT
week,
DECODE(day, '��', num_day),
DECODE(day, '��', num_day),
DECODE(day, 'ȭ', num_day),
DECODE(day, '��', num_day),
DECODE(day, '��', num_day),
DECODE(day, '��', num_day),
DECODE(day, '��', num_day)
FROM cal;

SELECT
week,
sum(DECODE(day, '��', num_day)) ��,
sum(DECODE(day, '��', num_day)) ��,
sum(DECODE(day, 'ȭ', num_day)) ȭ,
sum(DECODE(day, '��', num_day)) ��,
sum(DECODE(day, '��', num_day)) ��,
sum(DECODE(day, '��', num_day)) ��,
sum(DECODE(day, '��', num_day)) ��
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
PIVOT (sum(num_day) for day in ('��', '��', 'ȭ', '��', '��', '��', '��'))
ORDER BY week;

SELECT *
FROM professor;

-- PROFESSOR ���̺��� POSITION �� ��� PAY�� ���Ͻÿ�. (�ǹ��ؼ�)
SELECT *
FROM (select position, pay from professor)
pivot (avg(pay) for position in ('������', '������','���Ӱ���'));

SELECT position, avg(pay)
FROM professor
group by position;