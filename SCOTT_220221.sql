DROP TABLE HOSPITAL2;

SELECT count(*) from hospital2;

create table hospital2 (
    id number,
    addr varchar2(200),
    mgtStaDd number,
    pcrPsblYn varchar2(100),
    ratPsblYn varchar2(100),
    recuClCd number,
    rprtWorpClicFndtTgtYn varchar2(100),
    sgguCdNm varchar2(100),
    sidoCdNm varchar2(100),
    telno varchar2(100),
    XPos number,
    XPosWgs84 number,
    YPos number,
    YPosWgs84 number,
    yadmNm varchar2(100),
    ykihoEnc varchar2(100),
    CONSTRAINT "hospital2_pk" PRIMARY KEY (id)
);

CREATE SEQUENCE SEQ_HOSPITAL INCREMENT BY 1 START WITH 1;