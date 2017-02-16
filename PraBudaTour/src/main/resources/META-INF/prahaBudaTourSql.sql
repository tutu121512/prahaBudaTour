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
phone	varchar2(100),
kakao_id	varchar2(100),
board_img0	varchar2(100),
board_img1	varchar2(100),
board_img2	varchar2(100),
board_img3	varchar2(100)
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
phone	varchar2(100),
kakao_id	varchar2(100)
);


CREATE TABLE admin(
ID varchar2(100),
PASSWORD varchar2(100)
);
INSERT INTO admin(ID,PASSWORD) VALUES('favicontour','min337337');

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



INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,phone,kakao_id) values('notice','P',notice_sequence.nextval,'writer1','title1','content1',sysdate,01011111111,'kakaoid1');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,phone,kakao_id) values('notice','P',notice_sequence.nextval,'writer2','title2','content2',sysdate,01011111112,'kakaoid2');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,phone,kakao_id) values('notice','P',notice_sequence.nextval,'writer3','title3','content3',sysdate,01011111113,'kakaoid3');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,phone,kakao_id) values('notice','P',notice_sequence.nextval,'writer4','title4','content4',sysdate,01011111114,'kakaoid4');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,phone,kakao_id) values('notice','P',notice_sequence.nextval,'writer5','title5','content5',sysdate,01011111115,'kakaoid5');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,phone,kakao_id) values('notice','P',notice_sequence.nextval,'writer6','title6','content6',sysdate,01011111116,'kakaoid6');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,phone,kakao_id) values('notice','P',notice_sequence.nextval,'writer7','title7','content7',sysdate,01011111117,'kakaoid7');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,phone,kakao_id) values('notice','P',notice_sequence.nextval,'writer8','title8','content8',sysdate,01011111118,'kakaoid8');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,phone,kakao_id) values('notice','P',notice_sequence.nextval,'writer9','title9','content9',sysdate,01011111119,'kakaoid9');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,phone,kakao_id) values('notice','P',notice_sequence.nextval,'writer10','title10','content10',sysdate,01011111110,'kakaoid10');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,phone,kakao_id) values('notice','P',notice_sequence.nextval,'writer11','title11','content11',sysdate,01011111111,'kakaoid11');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,phone,kakao_id) values('notice','P',notice_sequence.nextval,'writer12','title12','content12',sysdate,01011111112,'kakaoid12');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,phone,kakao_id) values('notice','P',notice_sequence.nextval,'writer13','title13','content13',sysdate,01011111113,'kakaoid13');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,phone,kakao_id) values('notice','P',notice_sequence.nextval,'writer14','title14','content14',sysdate,01011111114,'kakaoid14');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,phone,kakao_id) values('notice','P',notice_sequence.nextval,'writer15','title15','content15',sysdate,01011111115,'kakaoid15');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,phone,kakao_id) values('notice','P',notice_sequence.nextval,'writer16','title16','content16',sysdate,01011111116,'kakaoid16');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,phone,kakao_id) values('notice','P',notice_sequence.nextval,'writer17','title17','content17',sysdate,01011111117,'kakaoid17');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,phone,kakao_id) values('notice','P',notice_sequence.nextval,'writer18','title18','content18',sysdate,01011111118,'kakaoid18');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,phone,kakao_id) values('notice','P',notice_sequence.nextval,'writer19','title19','content19',sysdate,01011111119,'kakaoid19');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,phone,kakao_id) values('notice','P',notice_sequence.nextval,'writer20','title20','content20',sysdate,01011111120,'kakaoid20');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,phone,kakao_id) values('notice','P',notice_sequence.nextval,'writer21','title21','content21',sysdate,01011111121,'kakaoid21');


INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('reserveQuestion','P',reserveQuestion_sequence.nextval,'writer1','title1','content1',sysdate,1234,01011111111,'kakaoid1');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('reserveQuestion','P',reserveQuestion_sequence.nextval,'writer2','title2','content2',sysdate,1234,01011111112,'kakaoid2');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('reserveQuestion','P',reserveQuestion_sequence.nextval,'writer3','title3','content3',sysdate,1234,01011111113,'kakaoid3');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('reserveQuestion','P',reserveQuestion_sequence.nextval,'writer4','title4','content4',sysdate,1234,01011111114,'kakaoid4');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('reserveQuestion','P',reserveQuestion_sequence.nextval,'writer5','title5','content5',sysdate,1234,01011111115,'kakaoid5');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('reserveQuestion','P',reserveQuestion_sequence.nextval,'writer6','title6','content6',sysdate,1234,01011111116,'kakaoid6');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('reserveQuestion','P',reserveQuestion_sequence.nextval,'writer7','title7','content7',sysdate,1234,01011111117,'kakaoid7');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('reserveQuestion','P',reserveQuestion_sequence.nextval,'writer8','title8','content8',sysdate,1234,01011111118,'kakaoid8');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('reserveQuestion','P',reserveQuestion_sequence.nextval,'writer9','title9','content9',sysdate,1234,01011111119,'kakaoid9');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('reserveQuestion','P',reserveQuestion_sequence.nextval,'writer10','title10','content10',sysdate,1234,01011111110,'kakaoid10');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('reserveQuestion','P',reserveQuestion_sequence.nextval,'writer11','title11','content11',sysdate,1234,01011111111,'kakaoid11');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('reserveQuestion','P',reserveQuestion_sequence.nextval,'writer12','title12','content12',sysdate,1234,01011111112,'kakaoid12');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('reserveQuestion','P',reserveQuestion_sequence.nextval,'writer13','title13','content13',sysdate,1234,01011111113,'kakaoid13');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('reserveQuestion','P',reserveQuestion_sequence.nextval,'writer14','title14','content14',sysdate,1234,01011111114,'kakaoid14');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('reserveQuestion','P',reserveQuestion_sequence.nextval,'writer15','title15','content15',sysdate,1234,01011111115,'kakaoid15');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('reserveQuestion','P',reserveQuestion_sequence.nextval,'writer16','title16','content16',sysdate,1234,01011111116,'kakaoid16');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('reserveQuestion','P',reserveQuestion_sequence.nextval,'writer17','title17','content17',sysdate,1234,01011111117,'kakaoid17');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('reserveQuestion','P',reserveQuestion_sequence.nextval,'writer18','title18','content18',sysdate,1234,01011111118,'kakaoid18');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('reserveQuestion','P',reserveQuestion_sequence.nextval,'writer19','title19','content19',sysdate,1234,01011111119,'kakaoid19');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('reserveQuestion','P',reserveQuestion_sequence.nextval,'writer20','title20','content20',sysdate,1234,01011111120,'kakaoid20');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('reserveQuestion','P',reserveQuestion_sequence.nextval,'writer21','title21','content21',sysdate,1234,01011111121,'kakaoid21');

INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('shuttle','P',shuttle_sequence.nextval,'writer1','title1','content1',sysdate,1234,01011111111,'kakaoid1');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('shuttle','P',shuttle_sequence.nextval,'writer2','title2','content2',sysdate,1234,01011111112,'kakaoid2');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('shuttle','P',shuttle_sequence.nextval,'writer3','title3','content3',sysdate,1234,01011111113,'kakaoid3');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('shuttle','P',shuttle_sequence.nextval,'writer4','title4','content4',sysdate,1234,01011111114,'kakaoid4');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('shuttle','P',shuttle_sequence.nextval,'writer5','title5','content5',sysdate,1234,01011111115,'kakaoid5');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('shuttle','P',shuttle_sequence.nextval,'writer6','title6','content6',sysdate,1234,01011111116,'kakaoid6');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('shuttle','P',shuttle_sequence.nextval,'writer7','title7','content7',sysdate,1234,01011111117,'kakaoid7');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('shuttle','P',shuttle_sequence.nextval,'writer8','title8','content8',sysdate,1234,01011111118,'kakaoid8');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('shuttle','P',shuttle_sequence.nextval,'writer9','title9','content9',sysdate,1234,01011111119,'kakaoid9');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('shuttle','P',shuttle_sequence.nextval,'writer10','title10','content10',sysdate,1234,01011111110,'kakaoid10');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('shuttle','P',shuttle_sequence.nextval,'writer11','title11','content11',sysdate,1234,01011111111,'kakaoid11');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('shuttle','P',shuttle_sequence.nextval,'writer12','title12','content12',sysdate,1234,01011111112,'kakaoid12');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('shuttle','P',shuttle_sequence.nextval,'writer13','title13','content13',sysdate,1234,01011111113,'kakaoid13');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('shuttle','P',shuttle_sequence.nextval,'writer14','title14','content14',sysdate,1234,01011111114,'kakaoid14');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('shuttle','P',shuttle_sequence.nextval,'writer15','title15','content15',sysdate,1234,01011111115,'kakaoid15');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('shuttle','P',shuttle_sequence.nextval,'writer16','title16','content16',sysdate,1234,01011111116,'kakaoid16');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('shuttle','P',shuttle_sequence.nextval,'writer17','title17','content17',sysdate,1234,01011111117,'kakaoid17');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('shuttle','P',shuttle_sequence.nextval,'writer18','title18','content18',sysdate,1234,01011111118,'kakaoid18');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('shuttle','P',shuttle_sequence.nextval,'writer19','title19','content19',sysdate,1234,01011111119,'kakaoid19');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('shuttle','P',shuttle_sequence.nextval,'writer20','title20','content20',sysdate,1234,01011111120,'kakaoid20');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('shuttle','P',shuttle_sequence.nextval,'writer21','title21','content21',sysdate,1234,01011111121,'kakaoid21');



INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('review','P',review_sequence.nextval,'writer1','title1','content1',sysdate,1234,01011111111,'kakaoid1');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('review','P',review_sequence.nextval,'writer2','title2','content2',sysdate,1234,01011111112,'kakaoid2');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('review','P',review_sequence.nextval,'writer3','title3','content3',sysdate,1234,01011111113,'kakaoid3');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('review','P',review_sequence.nextval,'writer4','title4','content4',sysdate,1234,01011111114,'kakaoid4');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('review','P',review_sequence.nextval,'writer5','title5','content5',sysdate,1234,01011111115,'kakaoid5');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('review','P',review_sequence.nextval,'writer6','title6','content6',sysdate,1234,01011111116,'kakaoid6');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('review','P',review_sequence.nextval,'writer7','title7','content7',sysdate,1234,01011111117,'kakaoid7');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('review','P',review_sequence.nextval,'writer8','title8','content8',sysdate,1234,01011111118,'kakaoid8');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('review','P',review_sequence.nextval,'writer9','title9','content9',sysdate,1234,01011111119,'kakaoid9');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('review','P',review_sequence.nextval,'writer10','title10','content10',sysdate,1234,01011111110,'kakaoid10');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('review','P',review_sequence.nextval,'writer11','title11','content11',sysdate,1234,01011111111,'kakaoid11');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('review','P',review_sequence.nextval,'writer12','title12','content12',sysdate,1234,01011111112,'kakaoid12');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('review','P',review_sequence.nextval,'writer13','title13','content13',sysdate,1234,01011111113,'kakaoid13');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('review','P',review_sequence.nextval,'writer14','title14','content14',sysdate,1234,01011111114,'kakaoid14');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('review','P',review_sequence.nextval,'writer15','title15','content15',sysdate,1234,01011111115,'kakaoid15');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('review','P',review_sequence.nextval,'writer16','title16','content16',sysdate,1234,01011111116,'kakaoid16');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('review','P',review_sequence.nextval,'writer17','title17','content17',sysdate,1234,01011111117,'kakaoid17');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('review','P',review_sequence.nextval,'writer18','title18','content18',sysdate,1234,01011111118,'kakaoid18');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('review','P',review_sequence.nextval,'writer19','title19','content19',sysdate,1234,01011111119,'kakaoid19');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('review','P',review_sequence.nextval,'writer20','title20','content20',sysdate,1234,01011111120,'kakaoid20');
INSERT INTO board(board_state,Location,board_no,writer,title,content,board_date,password,phone,kakao_id) values('review','P',review_sequence.nextval,'writer21','title21','content21',sysdate,1234,01011111121,'kakaoid21');

 INSERT INTO reserveComplete(location,board_no,board_date,reserve_name,room_name,start_date,end_date,people_number,price,phone,kakao_id) 
 values('P',reserveComplete_Sequence.nextVal,sysdate,'정영재','프라하성','2017-02-14','2017-02-17','3','60000','01027901708','jyj93kr');
  
 INSERT INTO reserveComplete(location,board_no,board_date,reserve_name,room_name,start_date,end_date,people_number,price,phone,kakao_id) 
 values('P',reserveComplete_Sequence.nextVal,sysdate,'장준영','바츨라프','2017-02-03','2017-02-10','2','80000','01084123017','tutu1215');
  
 INSERT INTO reserveComplete(location,board_no,board_date,reserve_name,room_name,start_date,end_date,people_number,price,phone,kakao_id) 
 values('P',reserveComplete_Sequence.nextVal,sysdate,'이은길','까를르교','2017-03-1','2017-03-02','1','450000','01073358389','geeLoveIRENE');


drop table board;
drop table reserveComplete;
drop sequence notice_sequence;
drop sequence reserveQuestion_sequence;
drop sequence reserveComplete_sequence;
drop sequence review_sequence;
drop sequence shuttle_sequence;