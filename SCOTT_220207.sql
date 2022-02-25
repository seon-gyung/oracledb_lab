SELECT *
FROM emp;

SELECT *
FROM student;

SELECT LOWER('Ssar')
FROM dual;

-- 길이 4 = 4자
SELECT length('ABCD')
FROM dual;

SELECT length('가나다라')
FROM dual;

-- 영어 1Byte (UTF-8)
SELECT lengthb('ABCD')
FROM dual;

-- 한글 3Byte (UTF-8)
SELECT lengthb('가나다라')
FROM dual;

-- 앞에 인수는 인덱스 번호 (시작 번호는 1), 두번째 인수는 개수
SELECT substr ('가나다라', 1, 3)
FROM dual;

-- 주민번호 6자리 골라내기
SELECT name, SUBSTR(jumin,1,7) || '******'
FROM student;

-- 주민번호 751023-1******
SELECT name, substr(jumin, 1, 6) || '-' || substr(jumin, 7, 1) || '******'
FROM student;

-- 지역번호 추출하기
SELECT '-)$'
FROM dual;

SELECT instr('-)$', '$')
FROM dual;

SELECT instr(tel, ')')-1
FROM student;

SELECT SUBSTR(tel, 1, instr(tel, ')')-1)
FROM student;