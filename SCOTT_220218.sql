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

SELECT yadmNm 병원이름, addr 주소, telno 전화번호, pcrPsblYn PCR검사가능여부
FROM hospital
WHERE sgguCdNm = '여수시' AND pcrPsblYn = 'Y';