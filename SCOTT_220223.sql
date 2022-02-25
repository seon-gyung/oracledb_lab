Create table userInfo (
  id number primary key,
  name varchar(20),
  phone varchar(20)
);
INSERT INTO userinfo(id, name, phone) VALUES(seq_userInfo.nextVal, 'È«±æµ¿', '0102222');
INSERT INTO userinfo(id, name, phone) VALUES(seq_userInfo.nextVal, 'Àåº¸°í', '0105555');
INSERT INTO userinfo(id, name, phone) VALUES(seq_userInfo.nextVal, 'ÀÓ²©Á¤', '0107777');

commit;

drop table userinfo;