SELECT *
FROM emp;

SELECT *
FROM student;

SELECT LOWER('Ssar')
FROM dual;

-- ���� 4 = 4��
SELECT length('ABCD')
FROM dual;

SELECT length('�����ٶ�')
FROM dual;

-- ���� 1Byte (UTF-8)
SELECT lengthb('ABCD')
FROM dual;

-- �ѱ� 3Byte (UTF-8)
SELECT lengthb('�����ٶ�')
FROM dual;

-- �տ� �μ��� �ε��� ��ȣ (���� ��ȣ�� 1), �ι�° �μ��� ����
SELECT substr ('�����ٶ�', 1, 3)
FROM dual;

-- �ֹι�ȣ 6�ڸ� ��󳻱�
SELECT name, SUBSTR(jumin,1,7) || '******'
FROM student;

-- �ֹι�ȣ 751023-1******
SELECT name, substr(jumin, 1, 6) || '-' || substr(jumin, 7, 1) || '******'
FROM student;

-- ������ȣ �����ϱ�
SELECT '-)$'
FROM dual;

SELECT instr('-)$', '$')
FROM dual;

SELECT instr(tel, ')')-1
FROM student;

SELECT SUBSTR(tel, 1, instr(tel, ')')-1)
FROM student;