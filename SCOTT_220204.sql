-- SELECT ����

-- 1. distinct �ߺ�����
SELECT DISTINCT deptno
FROM emp;

SELECT DISTINCT job
FROM emp;

-- 2. ���� ������ ||
SELECT '���� �̸��� ' || ename
FROM emp;

-- 3. ��Ī as
SELECT '���� �̸��� ' || ename as "�ڱ�Ұ�" FROM emp; -- ����
SELECT '���� �̸��� ' || ename �ڱ�Ұ� FROM emp; -- as, "" ���� ����
SELECT sal*12 ���� FROM emp;

-- 4. NVL null�� �����ϱ� (DB�� null�� ���� ������ �ȵȴ�)
SELECT ename, sal+nvl(comm, 0) ����, nvl(comm, 0) -- ?nvl(cullum, null �ٲ� ��)
FROM emp;

-- 5. decode (���ǹ� = if)
SELECT decode(comm, null, 0, comm) ���ʽ� -- comm�� null�̸� 0, �ƴϸ� comm
FROM emp;

-- �ǽ� 1��
SELECT name || 'is ID: ' || id || ',' || ' WEIGHT is ' || weight || 'kg'
"ID AND WEIGHT"
FROM student;

DESC student;

-- �ǽ� 2��
SELECT ename || '(' || job || ')' || ' , ' || ename || '''' || job || ''''
"NAME AND JOB"
FROM emp;

DESC emp;

-- �ǽ� 3��
SELECT ename || ' is sal is ' || '$' || sal
"Name and Sal"
FROM emp;

DESC emp;

-- WHERE ����

-- 1. = ����
SELECT *
FROM emp
WHERE empno = 7900;

-- 2. < > ũ��, �۴� <= => ũ�ų� ����
SELECT *
FROM emp
WHERE sal < 3000;

-- 3. ���ڿ� �˻�
SELECT *
FROM emp
WHERE ename = 'SMITH';

-- 4. ���� !=, <> ���� �ʴ�
SELECT *
FROM emp
WHERE ename != 'SMITH';

-- 5. OR, IN (���� �÷� ������)
SELECT *
FROM emp
WHERE job = 'MANAGER' OR job = 'CLERK';

SELECT *
FROM emp
WHERE job in ('MANAGER', 'CLERK');

-- 6. AND, BETWEEN
-- tip. ��¥(date Ÿ��) /, - �� �� ����
SELECT hiredate
FROM emp
WHERE hiredate >= '1981/02/20' AND hiredate <= '1982/02/22';

SELECT hiredate
FROM emp
WHERE hiredate BETWEEN '1981/02/20' AND '1982/02/22'

-- 7. NULL ã�� ��
SELECT *
FROM emp
WHERE comm is not null;

SELECT *
FROM emp
WHERE comm is not null;

-- 8. ����� �����͸� ã�� ��
SELECT sal*12 ����
FROM emp
WHERE sal*12 > 9000;

-- LIKE (���̹� �˻�, �κ� �˻�)
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

-- ORDER BY ���� ASC ��������(����Ʈ), DESC �������� 
SELECT *
FROM emp
WHERE job = 'MANAGER'
ORDER BY ename ASC;

SELECT sal, ename, empno
FROM emp
ORDER BY sal DESC, ename ASC;

SELECT mod(sal, 500) ������, ename
FROM emp
ORDER BY 1 DESC;

-- 그룹 ?��?��?�� max, count, min, sum, avg (?��로젝?�� ?��?��)
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

-- UNION ALL (�ΰ��� ���� ���ϱ� - ���� : Į���� ������ ���ƾ� �Ѵ�. ���� null�� �߰�)
SELECT empno, ename, sal
FROM emp
WHERE job = 'SALESMAN'
UNION ALL
SELECT null, null, avg(sal)
FROM emp
WHERE job = 'SALESMAN';
