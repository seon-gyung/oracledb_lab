Create table userInfo (
  id number primary key,
  name varchar(20),
  phone varchar(20)
);
INSERT INTO userinfo(id, name, phone) VALUES(seq_userInfo.nextVal, 'ȫ�浿', '0102222');
INSERT INTO userinfo(id, name, phone) VALUES(seq_userInfo.nextVal, '�庸��', '0105555');
INSERT INTO userinfo(id, name, phone) VALUES(seq_userInfo.nextVal, '�Ӳ���', '0107777');

commit;

drop table userinfo;