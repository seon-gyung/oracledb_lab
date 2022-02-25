SELECT instr('051)2222-4444)', ')')-1 FROM dual;
SELECT instr('02)2222-4444)', ')')-1 FROM dual;

SELECT tel, substr(tel, 1, instr(tel, ')')-1) FROM student;

SELECT * FROM student;

-- ù��° ����. ��ȭ��ȣ ��� �κ� �����ϱ�
SELECT tel, substr(tel, instr(tel, ')')+1, instr(tel, '-')-instr(tel, ')')-1) �߰���ȣ FROM student;



-- ���� ���� �Լ�
SELECT avg(sal) FROM emp;

-- ROUND 5���� �ݿø���. �ι�° �μ��� �Ҽ��� ���ڸ����� ǥ���� ����
SELECT ROUND(987.664, 1) FROM dual;

-- TRUNC �Ҽ��� ���� ������
SELECT TRUNC(987.664) FROM dual;

-- mod ������ ���ϱ�
SELECT MOD(6,4) FROM dual;


-- ��¥ sysdate ����ð� ���
SELECT sysdate FROM dual;

SELECT * FROM emp;

-- MONTHS_BETWEEN ������ ������
SELECT MONTHS_BETWEEN(SYSDATE, hiredate) FROM emp;

SELECT ENAME,
TRUNC(MONTHS_BETWEEN(SYSDATE,hiredate)/12) �ټӳ⵵,
DECODE(TRUNC(MONTHS_BETWEEN(SYSDATE,hiredate)/12), 40, '�ݹ��� ����', '����')
FROM emp;

-- ADD_MONTHS ������ ���ϱ�
SELECT ADD_MONTHS(sysdate, 3) FROM dual;

-- LAST_DAY ������ ��¥ �˷��ֱ�
SELECT LAST_DAY(SYSDATE) FROM dual;


-- ����ȯ �Լ� to_number(), to_char(), to_date()
SELECT 2 + to_number('2') FROM dual;

SELECT to_date('2020/04/01') FROM dual;

-- YYYY MM DD hh mm ss �� �� �� �� �� ��
SELECT to_char(hiredate, 'YYYY-MM-DD:hh:mm') FROM emp;

-- ����Ŭ ���� DAY ����
SELECT to_char(hiredate, 'DAY') FROM emp;

SELECT to_char(1530, '$9999') FROM dual;
SELECT to_char(1530, '$9,999') FROM dual;
SELECT to_char(sal, '$9,999,999') FROM emp;

-- 1. 20�� �μ��� �Ҽӵ� �������� �̸��� 2~3��° ���� '-'���� ���
SELECT REPLACE(ename, substr(ename, 2, 2), '--')
FROM emp
WHERE deptno = 20;

-- 2. 1������ 101���� �л����� �̸���, �ֹε�Ϲ�ȣ�� ����ϵ� �ֹε�Ϲ�ȣ�� �� 7�ڸ��� -�� /�� ǥ��
SELECT name, REPLACE(jumin, substr(jumin, 7, 7), '-/-/-/-')
FROM student
WHERE deptno1 = 101;

-- 3. 1������ 102���� �л����� �̸���, ��ȭ��ȣ, ��ȭ��ȣ�� ������ * ó��. ��, ������ 3�ڸ�
SELECT name, tel, replace(tel, substr(tel, instr(tel, ')')+1, 3), '***')
FROM student
WHERE deptno1 = 102;

-- 4. 1������ 101���� �л����� �̸��� ��ȭ��ȣ�� ��ȭ��ȣ�� ������ȣ, ���� ���� ������ ��ȣ�� * ó��
SELECT name, tel, REPLACE(tel, substr(tel, instr(tel, '-')+1, 4), '****')
FROM student
WHERE deptno1 = 101;


-- 1�� �μ���ȣ�� 10���� �μ��� ��� �� �����ȣ, �̸�, ������ ����϶�.
SELECT empno EMPNO, ename ENAME, sal SAL
FROM emp
WHERE deptno = 10;
-- 2�� �����ȣ�� 7369�� ��� �� �̸�, �Ի���, �μ���ȣ�� ����϶�.
SELECT ename ENAME, TO_char(hiredate, 'YYYY-MM-DD:hh:mm') HIREDATE, deptno DEPNO
FROM emp
WHERE empno = 7369;
-- 3�� �̸��� ALLEN�� ����� ��� ������ ����϶�.
SELECT *
FROM emp
WHERE ename = 'ALLEN';
-- 4�� �Ի����� 80/12/17�� ����� �̸�, �μ���ȣ, ������ ����϶�. ex) HIREDATE = "80/12/17"
SELECT ename ENAME, deptno DEPTNO, sal Sal
FROM emp
WHERE hiredate = '80/12/17';
-- 5�� ������ MANAGER�� �ƴ� ����� ��� ������ ����϶�. ex) !=, <>, not in ('','','')
SELECT *
FROM emp
WHERE job != 'MANAGER';
-- 6�� �Ի����� 81/04/02 ���Ŀ� �Ի��� ����� ������ ����϶�.
SELECT *
FROM emp
WHERE hiredate > '81/04/02';
-- 7�� �޿��� $800 �̻��� ����� �̸�, �޿�, �μ���ȣ�� ����϶�.
SELECT ename, sal, deptno
FROM emp
WHERE sal >= 800;
-- 8�� �μ���ȣ�� 20�� �̻��� ����� ��� ������ ����϶�.
SELECT *
FROM emp
WHERE deptno >= 20;
-- 9�� �Ի����� 81/12/09 ���� ���� �Ի��� ������� ��� ������ ����϶�.
SELECT *
FROM emp
WHERE hiredate < '81/12/09';
-- 10�� �Ի��ȣ�� 7698���� �۰ų� ���� ������� �Ի��ȣ�� �̸��� ����϶�.
SELECT empno, ename
FROM emp
WHERE empno >= 7698;

