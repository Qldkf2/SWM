-- SYSTEM �������� �ϼž��մϴ� ������ !!
CREATE USER SWM IDENTIFIED BY SWM;
-- SYSTEM �������� �ϼž��մϴ� ������ !!
GRANT CONNECT, RESOURCE TO SWM;
-- ȸ�� ���
CREATE TABLE MEMBER (
    USERNO NUMBER PRIMARY KEY ,
    USERID VARCHAR2(30)  UNIQUE ,
    USERNAME VARCHAR2(20) NOT NULL,
    NICKNAME VARCHAR2(20) NOT NULL ,
    PASSWORD VARCHAR2(100) NOT NULL ,
    EMAIL VARCHAR2(30) NOT NULL , 
    PHONE1 VARCHAR2(20) NOT NULL , 
    PHONE2 VARCHAR2(20) NOT NULL , 
    PHONE3 VARCHAR2(20) NOT NULL , 
    STATUS CHAR DEFAULT 'N' CHECK(STATUS IN('Y','N')),
    SESSIONKEY VARCHAR2(80 BYTE) DEFAULT 'NONE' NOT NULL ENABLE, 
    SESSIONLIMIT DATE 
);

SELECT * FROM MEMBER;


--ȸ����ȣ ������
CREATE SEQUENCE SEQ_MEM; 

-- ���͵�ī�� ���
CREATE TABLE STUDYCAFE (
    STUDYCAFE_NO NUMBER PRIMARY KEY , 
    STUDYCAFE_NAME VARCHAR2(100) NOT NULL ,
    STUDYCAFE_ADDRESS VARCHAR2(100) NOT NULL,
    STUDYCAFE_PHONE  VARCHAR2(50) NOT NULL ,
    STUDYCAFE_OPEN VARCHAR2(30) ,
    STUDYCAFE_END VARCHAR2(30) ,
    STUDYCAFE_CONTENT VARCHAR2(2000) 
    ); 


-- ���͵�ī�� ��ȣ ������
CREATE SEQUENCE SEQ_STUDYCAFE;

-- ���͵� ī�� ���� ���
CREATE TABLE STUDYCAFE_FILE(
    IDX NUMBER PRIMARY KEY,
    STUDYCAFE_NO NUMBER ,
    ORIGINAL_FILE_NAME VARCHAR2(260 BYTE) NOT NULL, 
    STORED_FILE_NAME VARCHAR2(36 BYTE) NOT NULL, 
    FILE_SIZE NUMBER , 
    ROOM_NAME VARCHAR2(100)
);

-- ���͵� ī�� ���� ��� ������
CREATE SEQUENCE STUDYCAFE_FILE_SEQ;

-- ���͵�ī�� �������̺�
  CREATE TABLE STUDYCAFE_BOOK
   (   "BOOK_NO" NUMBER, 
   "STUDYCAFE_NAME" VARCHAR2(100 BYTE), 
   "STUDYCAFE_NO" NUMBER, 
   "BOOKER_NO" NUMBER, 
   "STUDYCAFE_ROOM" VARCHAR2(100 BYTE), 
   "PERMIT_LIMIT" NUMBER, 
   "BOOK_DATE" DATE, 
   "START_TIME" VARCHAR2(10 BYTE), 
   "END_TIME" VARCHAR2(10 BYTE), 
   "PAY" NUMBER DEFAULT 0, 
   "STATUS" VARCHAR2(300 BYTE) DEFAULT '����');

-- ���� ������
CREATE SEQUENCE SEQ_BOOK_NO;

-- ���� 
CREATE TABLE MEETING (
    MEETING_NO NUMBER PRIMARY KEY ,
    MEETING_LEADER NUMBER ,
    MEETING_AGE VARCHAR2(20) ,
    MEETING_TITLE VARCHAR2(300) NOT NULL ,
    MEETING_CONTENT VARCHAR2(2000) NOT NULL ,
    MEETING_ADDRESS VARCHAR2(20) ,
    MEETING_SUBJECT VARCHAR2(20) ,
    MEETING_LIMIT NUMBER ,
    STATUS CHAR DEFAULT 'N' CHECK(STATUS IN('Y','N')),
    MEETING_DATE DATE DEFAULT SYSDATE,
    MEETING_HIT NUMBER 
);

-- ���� �Խñ� ������
CREATE SEQUENCE SEQ_MEETING;

-- ���� �Խñ� ���� ���
CREATE TABLE MEETING_PERMIT(
    MEETING_NO NUMBER  ,
    USERNO NUMBER ,
    ABOUTME VARCHAR2(200) ,
    PERMIT CHAR(1) DEFAULT 'N' CHECK(PERMIT IN('Y','N')) 
);

-- ���� �� �Խñ� 
CREATE TABLE MEETING_BOARD (
    MEETING_BOARD_NO NUMBER PRIMARY KEY ,
    MEETING_NO NUMBER ,
    MEETING_BOARD_WRITER NUMBER ,
    MEETING_BOARD_TITLE VARCHAR2(300) NOT NULL ,
    MEETING_BOARD_CONTENT VARCHAR2(2000) NOT NULL ,
    MEETING_BOARD_DATE DATE DEFAULT SYSDATE ,
    MEETING_BOARD_HIT NUMBER ,
    STATUS CHAR DEFAULT 'N' CHECK(STATUS IN('Y','N'))
);

-- ���� �� �Խñ� ������
CREATE SEQUENCE SEQ_MEETING_BOARD;

-- ���� �� �Խñ� ��� ���
CREATE TABLE MEETING_BOARD_COMMENT(
    MEETING_BOARD_COMMENT_NO NUMBER  PRIMARY KEY,
    MEETING_BOARD_NO NUMBER ,
    USERNO NUMBER ,
    MEETING_BOARD_COMMENT_CONTENT VARCHAR2(300) ,
    MEETING_BOARD_COMMENT_DATE DATE DEFAULT SYSDATE ,
    MEETING_BOARD_COMMENT_LEVEL NUMBER ,
    MEETING_BOARD_COMMENT_REFNO NUMBER ,
    STATUS CHAR DEFAULT 'N' CHECK(STATUS IN('Y','N'))
);

-- ���� �� �Խ��� ��� ������
CREATE SEQUENCE SEQ_MEETING_BOARD_COMMENT;

-- ���� �� �Խ��� ����
CREATE TABLE MEETING_BOARD_FILE ( 
    IDX NUMBER, 
    MEETING_BOARD_NO NUMBER NOT NULL, 
    ORIGINAL_FILE_NAME VARCHAR2(260 BYTE) NOT NULL, 
    STORED_FILE_NAME VARCHAR2(36 BYTE) NOT NULL, 
    FILE_SIZE NUMBER, 
    DEL_GB VARCHAR2(1 BYTE) DEFAULT 'N' NOT NULL, 
    PRIMARY KEY (IDX) 
    );

-- ���� �Խ���
CREATE TABLE FREE_BOARD (
    FREE_NO NUMBER PRIMARY KEY ,
    USERNO NUMBER ,
    FREE_TITLE VARCHAR2(300) NOT NULL ,
    FREE_CONTENT VARCHAR2(3000) NOT NULL ,
    FREE_DATE DATE DEFAULT SYSDATE ,
    FREE_HIT NUMBER ,
    STATUS CHAR DEFAULT 'N' CHECK(STATUS IN('Y','N')) 
);

-- ���� �Խ��� ������
CREATE SEQUENCE SEQ_FREE_BOARD;

-- �����Խ��� ���
CREATE TABLE FREE_COMMENT(
    FREE_COMMENT_NO NUMBER  PRIMARY KEY,
    FREE_NO NUMBER ,
    USERNO NUMBER ,
    FREE_COMMENT_CONTENT VARCHAR2(300) ,
    FREE_COMMENT_DATE DATE DEFAULT SYSDATE ,
    FREE_COMMENT_LEVEL NUMBER ,
    FREE_COMMENT_REFNO NUMBER ,
    STATUS CHAR DEFAULT 'N' CHECK(STATUS IN('Y','N')) 
);


-- Ŀ�´�Ƽ �Խ��� ��� ��ȣ
CREATE SEQUENCE SEQ_FREE_COMMENT;
-- �����Խ��� ���� ���
CREATE TABLE FREE_BOARD_FILE( 
    IDX NUMBER, 
    FREE_NO NUMBER NOT NULL, 
    ORIGINAL_FILE_NAME VARCHAR2(260 BYTE) NOT NULL, 
    STORED_FILE_NAME VARCHAR2(36 BYTE) NOT NULL, 
    FILE_SIZE NUMBER, 
    DEL_GB VARCHAR2(1 BYTE) DEFAULT 'N' NOT NULL, 
    PRIMARY KEY (IDX) 
);
-- �����Խñ� ���ϵ�� ������
CREATE SEQUENCE FREE_BOARD_FILE_SEQ;

-- 1:1 ���� ���̺�
CREATE TABLE ASK(
    ASK_NO NUMBER PRIMARY KEY ,
    USERNO NUMBER ,
    ASK_TITLE VARCHAR2(300) ,
    ASK_CONTENT VARCHAR2(300) ,
    ASK_DATE DATE DEFAULT SYSDATE
);

-- 1:1 ���� ��ȣ ������
CREATE SEQUENCE SEQ_ASK;

-- 1:1 ���� ��� ���̺�
CREATE TABLE ASK_COMMENT(
    ASK_COMMENT_NO NUMBER PRIMARY KEY,
    ASK_NO NUMBER ,
    USERNO NUMBER ,
    ASK_COMMENT_CONTENT VARCHAR2(300) ,
    ASK_COMMENT_DATE DATE DEFAULT SYSDATE 
);
CREATE SEQUENCE seq_ask_comment;

-- ������ ���̺�
CREATE TABLE ADMIN (
    ADMIN_ID VARCHAR2(30) ,
    ADMIN_PASSWORD VARCHAR2(30)
);

--  �Ű�ȸ�� ���� ���̺�
CREATE TABLE REPORT(
    REPORT_NO NUMBER PRIMARY KEY ,
    REPORTER_NICKNAME VARCHAR2(30) NOT NULL ,
    REPORTED_NICKNAME VARCHAR2(30) NOT NULL ,
    REASON VARCHAR2(300) NOT NULL,
    REPORT_DATE DATE DEFAULT SYSDATE ,
    STATUS CHAR DEFAULT 'N' CHECK(STATUS IN('Y','N')) 
);

-- ���� ���̺�
CREATE TABLE LOCATION(
    SI VARCHAR2(30) NOT NULL ,
    GU VARCHAR2(30) NOT NULL
);
insert into location values('����','���α�');
insert into location values('����','�߱�');
insert into location values('����','��걸');
insert into location values('����','������');
insert into location values('����','������');
insert into location values('����','���빮��');
insert into location values('����','�߶���');
insert into location values('����','���ϱ�');
insert into location values('����','���ϱ�');
insert into location values('����','������');
insert into location values('����','�����');
insert into location values('����','����');
insert into location values('����','���빮��');
insert into location values('����','������');
insert into location values('����','��õ��');
insert into location values('����','������');
insert into location values('����','���α�');
insert into location values('����','��õ��');
insert into location values('����','��������');
insert into location values('����','���۱�');
insert into location values('����','���Ǳ�');
insert into location values('����','���ʱ�');
insert into location values('����','������');
insert into location values('����','���ı�');
insert into location values('����','������');

-- ���� ���� ���̺�
  CREATE TABLE PAY_STATUS
   (	"BOOK_NO" NUMBER, 
	"STATUS" VARCHAR2(100 BYTE)
);

-- ���͵�ī�� ���� �ð����
  CREATE TABLE STUDYCAFE_BOOK_TIME
   (	"STUDYCAFE_NO" NUMBER, 
	"STUDYCAFE_ROOM" VARCHAR2(100 BYTE), 
	"BOOK_DATE" DATE, 
	"BOOK_TIME" VARCHAR2(300 BYTE)
);


-- ���͵�ī�� ���� ���
  CREATE TABLE STUDYCAFE_REVIEW
   (	"REVIEW_NO" NUMBER, 
	"STUDYCAFE_NO" NUMBER, 
	"REVIEW_CONTENT" VARCHAR2(500 BYTE), 
	"REVIEW_GRADE" NUMBER, 
	"USERNO" NUMBER, 
	"REVIEW_DATE" DATE DEFAULT sysdate
);


CREATE SEQUENCE SEQ_studycafe_review_no;


    