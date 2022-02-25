-- ���� ���� (1. �ζ��κ�, 2. ��Į�� ��������, 3. ��������)

-- ��Į�� �������� (�÷�)
SELECT avg(sal) FROM emp;

SELECT e.*, (SELECT avg(sal) FROM emp) FROM emp e ORDER BY deptno;

-- �������� (����)
SELECT max(sal) FROM emp;

SELECT * FROM emp WHERE sal = (SELECT max(sal) FROM emp);

SELECT * FROM emp WHERE sal in (SELECT sal FROM emp WHERE sal > 2000);

-- �ζ��κ� (����)
-- FROM�� ��� �ִ� ROWNUM�� ����Ϸ��� �Ʒ��� ���� ��Ī�� ����.
SELECT ename, sal, R1
FROM (
    SELECT ename, sal, ROWNUM R1
    FROM emp
    ORDER BY sal DESC
);

-- ��
SELECT ename, sal, rownum FROM emp
WHERE rownum < 3;

-- �ȵ�
SELECT ename, sal, rownum FROM emp
WHERE rownum > 2;

-- STUDENT ���̺� Ű ������ ���ϰ� 5~8�� ����ϱ�
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

-- GROUP �׷� (���ο���) - sum, avg, count, max, min
SELECT sum(sal), job
FROM emp
GROUP BY job;

-- ���� ���̺�(substr) Ű�� ����� ���Ͻÿ�. - �ζ��κ並 Ȱ��
SELECT year, avg(height)
FROM
(
    SELECT substr(jumin, 1, 2) year, height
    FROM student
)
GROUP BY year; -- 75, 76, 77, 78

-- 1. ���� ������ �ְ� Ű�� ���Ͻÿ�. - �ζ��κ� Ȱ�� student
SELECT t1, max(height)
FROM
(
    SELECT substr(tel, 1, instr(tel, ')')-1) t1 , height
    FROM student
)
GROUP BY t1;

-- 2. ������� 5�� ��� ����Ʈ�� ��� ���Ͻÿ�. mod, /, *, gogak
