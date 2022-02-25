CREATE TABLE Hospital
(	
    addr VARCHAR2(300 BYTE),
	mgtStaDd VARCHAR2(20 BYTE), 
    pcrPsblYn CHAR (2 BYTE),
    ratPsblYn CHAR (2 BYTE), 
    recuClCd NUMBER,
    rprtWorpClicFndtTgtYn CHAR (2 BYTE),
    sgguCdNm VARCHAR2(50 BYTE),
    sidoCdNm VARCHAR2(50 BYTE),
    telno VARCHAR2 (20 BYTE),
    Xpos NUMBER,
    XPosWgs84 VARCHAR2(20 BYTE),
    Ypos NUMBER,
    YPosWgs84 VARCHAR2(20 BYTE),
    yadmNm CLOB,
    ykihoEnc CLOB
);

DROP TABLE HOSPITAL;

SELECT yadmNm �����̸�, addr �ּ�, telno ��ȭ��ȣ, pcrPsblYn PCR�˻簡�ɿ���
FROM hospital
WHERE sgguCdNm = '������' AND pcrPsblYn = 'Y';