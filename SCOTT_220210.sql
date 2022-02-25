
-- having�� group by �ǰ� �� �ڿ� �������̴�.
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
GROUP BY g1; -- 4��

SELECT avg(point), g1
FROM
(
    SELECT gname, point, mod(ROWNUM, 2) g1
    FROM gogak
)
GROUP BY g1; -- 4��

-- student ���̺��� ��米������ �����ϰ� �ִ� �л����� ī�����Ͻÿ�. count() 
SELECT profno, COUNT(*)
FROM student
WHERE profno is not null
GROUP BY profno;

-- student ���̺��� �� �׷� ������ ��հ� ���� �׷� ������ ����� ���Ͻÿ�
-- 60Ű�� �̻� (��), 60Ű�� �̸�(����)
SELECT round(avg(weight), 2), decode(g1, 1, '��', '����') �񸸵�
FROM
(
    SELECT name, weight, floor(weight/60) g1
    FROM student ORDER BY weight
)
group by g1;

-- student ���̺��� �� �׷� ������ ��հ� ���� �׷� ������ ����� ���Ͻÿ�
-- 60Ű�� �̻� (��), 60Ű�� �̸�(����)
-- case when���� �ٽ� Ǯ�����. �ڼ�����
SELECT round(avg(weight), 1) ���������, �񸸵�
FROM
(
    SELECT name, weight,
    CASE WHEN weight >= 60 THEN '��' ELSE '����' END �񸸵�
    FROM student
    ORDER BY weight
)
GROUP BY �񸸵�;

-- ���� ���ϱ� 1,3 4,6 7,9

-- rank() over()
SELECT ename, rank() OVER (ORDER BY sal DESC) ����, sal
FROM emp;

-- dense_rank() OVER()
SELECT ename, dense_rank() OVER (ORDER BY sal DESC) ����, sal
FROM emp;

-- UNION ALL�� ������ ������� �����ϱ�
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

-- PARTITION BY (�׷���)
SELECT deptno, rank() OVER (PARTITION BY deptno ORDER BY sal DESC)
FROM emp;

-- ROLL UP (�Ұ� ��, �Ѱ� ��)
-- 1. deptno, job���� �Ѿ��Ѵ�.
-- 2. deptno �Ұ踦 ���Ѵ�.
-- 3. ��ü �Ұ踦 ���Ѵ�.
SELECT deptno, sum(sal)
FROM emp
GROUP BY rollup(deptno);

SELECT deptno, job, sum(sal)
FROM emp
GROUP BY rollup(deptno, job); -- deptno, job �Ѿ�

-- 1. job���� �Ѿ��Ѵ�.
-- 2. ��ü �Ұ踦 ���Ѵ�.
SELECT job, sum(sal)
FROM emp
GROUP BY rollup(job); -- job �Ѿ�

SELECT job, sum(sal)
FROM emp
GROUP BY rollup(job, deptno, comm); -- job �Ѿ�

-- PIVOT


