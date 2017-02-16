CREATE TABLE BOARD(
board_state	varchar2(100),
Location	varchar2(100),
board_no	varchar2(100),
writer	varchar2(100),
title	varchar2(4000),
content	varchar2(4000),
password	varchar2(100),
board_date	date,
board_reply	varchar2(4000),
start_date	varchar2(100),
end_date varchar2(100),
product	varchar2(100),
board_img0	varchar2(100),
board_img1	varchar2(100),
board_img2	varchar2(100),
board_img3	varchar2(100),
board_img4	varchar2(100),
board_img5	varchar2(100),
board_img6	varchar2(100),
board_img7	varchar2(100),
board_img8	varchar2(100),
board_img9	varchar2(100)
);

CREATE TABLE RESERVECOMPLETE(
Location	varchar2(100),
Board_No varchar2(100),
Board_Date date,
Reserve_Name	varchar2(100),
Room_Name	varchar2(100),
start_date	varchar2(100),
end_date	varchar2(100),
people_number	number,
price	varchar2(100),
product	varchar2(100),
title varchar2(100)
);

CREATE SEQUENCE notice_sequence
INCREMENT BY 1 
MAXVALUE 9999999999999999999999999999 
MINVALUE 1 
NOCACHE;

CREATE SEQUENCE reserveQuestion_sequence
INCREMENT BY 1 
MAXVALUE 9999999999999999999999999999 
MINVALUE 1 
NOCACHE;

CREATE SEQUENCE reserveComplete_sequence
INCREMENT BY 1 
MAXVALUE 9999999999999999999999999999 
MINVALUE 1 
NOCACHE;

CREATE SEQUENCE userBenefit_sequence
INCREMENT BY 1 
MAXVALUE 9999999999999999999999999999 
MINVALUE 1 
NOCACHE;

CREATE SEQUENCE tourInfo_sequence
INCREMENT BY 1 
MAXVALUE 9999999999999999999999999999 
MINVALUE 1 
NOCACHE;

CREATE SEQUENCE review_sequence
INCREMENT BY 1 
MAXVALUE 9999999999999999999999999999 
MINVALUE 1 
NOCACHE;

CREATE SEQUENCE shuttle_sequence
INCREMENT BY 1 
MAXVALUE 9999999999999999999999999999 
MINVALUE 1 
NOCACHE;
CREATE SEQUENCE notice_sequence
INCREMENT BY 1 
MAXVALUE 9999999999999999999999999999 
MINVALUE 1 
NOCACHE;

CREATE SEQUENCE reserveQuestion_sequence
INCREMENT BY 1 
MAXVALUE 9999999999999999999999999999 
MINVALUE 1 
NOCACHE;

CREATE SEQUENCE reserveComplete_sequence
INCREMENT BY 1 
MAXVALUE 9999999999999999999999999999 
MINVALUE 1 
NOCACHE;

CREATE SEQUENCE userBenefit_sequence
INCREMENT BY 1 
MAXVALUE 9999999999999999999999999999 
MINVALUE 1 
NOCACHE;

CREATE SEQUENCE tourInfo_sequence
INCREMENT BY 1 
MAXVALUE 9999999999999999999999999999 
MINVALUE 1 
NOCACHE;

CREATE SEQUENCE review_sequence
INCREMENT BY 1 
MAXVALUE 9999999999999999999999999999 
MINVALUE 1 
NOCACHE;

CREATE SEQUENCE shuttle_sequence
INCREMENT BY 1 
MAXVALUE 9999999999999999999999999999 
MINVALUE 1 
NOCACHE;


drop table board;
drop table reserveComplete;
drop sequence userBenefit_sequence;
drop sequence notice_sequence;
drop sequence reserveQuestion_sequence;
drop sequence reserveComplete_sequence;
drop sequence review_sequence;
drop sequence shuttle_sequence;
drop SEQUENCE tourInfo_sequence;