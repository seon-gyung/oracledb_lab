SELECT *
FROM userTbl;

-- Ʈ����� (insert, insert) = ����
insert into userTbl(id, username, password, gender)
VALUES(4, 'hong', '1234', '��');

commit;

insert into userTbl(id, username, password, gender)
VALUES(4, 'yang', '1234', '��');

commit;

-- Ʈ����� ����
insert into userTbl(id, username, password, gender)
VALUES(5, 'yang', '1234', '��');

insert into userTbl(id, username, password, gender)
VALUES(6, 'kong', '1234', '��');

-- if ���࿡ �� �� �����ϸ�
commit;

-- else ���߿� �ϳ��� �����ϸ�
rollback;