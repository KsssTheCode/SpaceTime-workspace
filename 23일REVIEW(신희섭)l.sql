--------------------------------------------------------
--  파일이 생성됨 - 금요일-12월-23-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table REVIEW
--------------------------------------------------------

  CREATE TABLE "SPACETIME"."REVIEW" 
   (	"REVIEW_NO" NUMBER, 
	"REVIEW_CONT" VARCHAR2(1000 BYTE), 
	"REVIEW_ENROLL_DATE" DATE DEFAULT SYSDATE, 
	"RATING" NUMBER DEFAULT 10, 
	"REVIEW_STATUS" CHAR(1 BYTE) DEFAULT 'N', 
	"REVIEW_ATTACH1" VARCHAR2(255 BYTE), 
	"REVIEW_ATTACH2" VARCHAR2(255 BYTE), 
	"REVIEW_ATTACH3" VARCHAR2(255 BYTE), 
	"HOST_ANSWER" VARCHAR2(300 BYTE), 
	"RESERVE_NO" NUMBER, 
	"MEM_NO" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "SPACETIME"."REVIEW"."REVIEW_NO" IS '리뷰PK 시퀀스SEQ_RVNO로 채번';
   COMMENT ON COLUMN "SPACETIME"."REVIEW"."REVIEW_CONT" IS '리뷰내용';
   COMMENT ON COLUMN "SPACETIME"."REVIEW"."REVIEW_ENROLL_DATE" IS '등록일';
   COMMENT ON COLUMN "SPACETIME"."REVIEW"."RATING" IS '평점';
   COMMENT ON COLUMN "SPACETIME"."REVIEW"."REVIEW_STATUS" IS '삭제여부';
   COMMENT ON COLUMN "SPACETIME"."REVIEW"."REVIEW_ATTACH1" IS '첨부파일1';
   COMMENT ON COLUMN "SPACETIME"."REVIEW"."REVIEW_ATTACH2" IS '첨부파일2';
   COMMENT ON COLUMN "SPACETIME"."REVIEW"."REVIEW_ATTACH3" IS '첨부파일3';
   COMMENT ON COLUMN "SPACETIME"."REVIEW"."HOST_ANSWER" IS '호스트의 리뷰 답글';
   COMMENT ON COLUMN "SPACETIME"."REVIEW"."RESERVE_NO" IS '예약번호FK';
   COMMENT ON COLUMN "SPACETIME"."REVIEW"."MEM_NO" IS '회원번호FK';
REM INSERTING into SPACETIME.REVIEW
SET DEFINE OFF;
Insert into SPACETIME.REVIEW (REVIEW_NO,REVIEW_CONT,REVIEW_ENROLL_DATE,RATING,REVIEW_STATUS,REVIEW_ATTACH1,REVIEW_ATTACH2,REVIEW_ATTACH3,HOST_ANSWER,RESERVE_NO,MEM_NO) values (274,'깔끔하고 좋았어요! 앞으로 자주 이용할것같습니다 :)',to_date('22/07/21','RR/MM/DD'),10,'N','null','null','null','감사합니다. 발전하는 사업장이 되겠습니다.',13,11);
Insert into SPACETIME.REVIEW (REVIEW_NO,REVIEW_CONT,REVIEW_ENROLL_DATE,RATING,REVIEW_STATUS,REVIEW_ATTACH1,REVIEW_ATTACH2,REVIEW_ATTACH3,HOST_ANSWER,RESERVE_NO,MEM_NO) values (275,'조용히 혼자 운동갑니다.너무 좋아요.집중 풀가동했어요!!',to_date('22/07/24','RR/MM/DD'),10,'N','null','null','null','건강해지신것같아서 보기좋네요 ㅎㅎ 또 방문해주세요',14,12);
Insert into SPACETIME.REVIEW (REVIEW_NO,REVIEW_CONT,REVIEW_ENROLL_DATE,RATING,REVIEW_STATUS,REVIEW_ATTACH1,REVIEW_ATTACH2,REVIEW_ATTACH3,HOST_ANSWER,RESERVE_NO,MEM_NO) values (276,'시설도 정말 깨끗하고 뷰도 좋고 분위기도 좋고.. 최고였어요! 배달시켜먹기도 좋아요 ㅎㅎ 공간 자체가 너무 편하고 좋아서 잘 놀다가 갑니다 ???',to_date('22/01/08','RR/MM/DD'),7,'N','null','null','null','미리내일님 소중한 후기 감사드립니다 ?',15,13);
Insert into SPACETIME.REVIEW (REVIEW_NO,REVIEW_CONT,REVIEW_ENROLL_DATE,RATING,REVIEW_STATUS,REVIEW_ATTACH1,REVIEW_ATTACH2,REVIEW_ATTACH3,HOST_ANSWER,RESERVE_NO,MEM_NO) values (277,'카페 넓구 사장님 친절하시구 동호회 모임하기 정말 좋네요 ㅎㅎ 다음 정모도 여기서 할 예정',to_date('22/01/11','RR/MM/DD'),10,'N','null','null','null','좋은 후기 감사합니다.',16,14);
Insert into SPACETIME.REVIEW (REVIEW_NO,REVIEW_CONT,REVIEW_ENROLL_DATE,RATING,REVIEW_STATUS,REVIEW_ATTACH1,REVIEW_ATTACH2,REVIEW_ATTACH3,HOST_ANSWER,RESERVE_NO,MEM_NO) values (278,'피아노가 있어서 분위기가 있어요 피아노근처 조명은 인생사진가능~ ',to_date('22/01/26','RR/MM/DD'),10,'N','null','null','null','저도 기분이 좋습니다!! 또 찾아주세요 감사합니다!',17,15);
Insert into SPACETIME.REVIEW (REVIEW_NO,REVIEW_CONT,REVIEW_ENROLL_DATE,RATING,REVIEW_STATUS,REVIEW_ATTACH1,REVIEW_ATTACH2,REVIEW_ATTACH3,HOST_ANSWER,RESERVE_NO,MEM_NO) values (279,'공연연습 잘하고 갑니다.',to_date('22/01/25','RR/MM/DD'),10,'N','null','null','null','성공적인 공연 응원합니다!',18,16);
Insert into SPACETIME.REVIEW (REVIEW_NO,REVIEW_CONT,REVIEW_ENROLL_DATE,RATING,REVIEW_STATUS,REVIEW_ATTACH1,REVIEW_ATTACH2,REVIEW_ATTACH3,HOST_ANSWER,RESERVE_NO,MEM_NO) values (280,'시설이 깔끔하고 제공되는 베이킹 도구들이 다양해서 몸도 마음도 편-안하게 공방 잘 사용 했네요',to_date('22/01/27','RR/MM/DD'),10,'N','null','null','null','안녕하세요! 쿠키 많이 만드셨네요 ?? 편안하게 잘 사용하셨다니 다행입니다ㅎㅎ 다음에 또 이용해주세요!!??',19,17);
Insert into SPACETIME.REVIEW (REVIEW_NO,REVIEW_CONT,REVIEW_ENROLL_DATE,RATING,REVIEW_STATUS,REVIEW_ATTACH1,REVIEW_ATTACH2,REVIEW_ATTACH3,HOST_ANSWER,RESERVE_NO,MEM_NO) values (281,'소중한 사람들과 소소하게 우리만의 시간을 보낼 수 있는 곳이었어요',to_date('22/02/11','RR/MM/DD'),10,'N','null','null','null','편안한 시간 되셨다니 넘 좋네요~ 정성스런 후기에 감사챤스로 다음 이용시 1시간 무료 진행해드리겠습니다! 좋은 주말 보내세요~',20,18);
Insert into SPACETIME.REVIEW (REVIEW_NO,REVIEW_CONT,REVIEW_ENROLL_DATE,RATING,REVIEW_STATUS,REVIEW_ATTACH1,REVIEW_ATTACH2,REVIEW_ATTACH3,HOST_ANSWER,RESERVE_NO,MEM_NO) values (282,'전시를 진행한 저희도 방문해주신 손님들도 공간을 정말 마음에 들어했습니다.',to_date('22/02/04','RR/MM/DD'),10,'N','null','null','null','공간이 마음에 드셨다니 더할 나위 없는 칭찬이네요? 정성스런 후기 감사합니다????',21,19);
Insert into SPACETIME.REVIEW (REVIEW_NO,REVIEW_CONT,REVIEW_ENROLL_DATE,RATING,REVIEW_STATUS,REVIEW_ATTACH1,REVIEW_ATTACH2,REVIEW_ATTACH3,HOST_ANSWER,RESERVE_NO,MEM_NO) values (283,'또 이용하려고요.',to_date('22/02/06','RR/MM/DD'),10,'N','null','null','null','후기 감사합니다! 더욱쾌적하고 좋은 공간이 되겠습니다!!',22,20);
Insert into SPACETIME.REVIEW (REVIEW_NO,REVIEW_CONT,REVIEW_ENROLL_DATE,RATING,REVIEW_STATUS,REVIEW_ATTACH1,REVIEW_ATTACH2,REVIEW_ATTACH3,HOST_ANSWER,RESERVE_NO,MEM_NO) values (284,'급하게 회의실이 필요했는데 생각보다 좋았습니다.',to_date('22/02/21','RR/MM/DD'),10,'N','null','null','null','회의는 잘 마무리하셨을까요?또 방문해주세요',23,21);
Insert into SPACETIME.REVIEW (REVIEW_NO,REVIEW_CONT,REVIEW_ENROLL_DATE,RATING,REVIEW_STATUS,REVIEW_ATTACH1,REVIEW_ATTACH2,REVIEW_ATTACH3,HOST_ANSWER,RESERVE_NO,MEM_NO) values (285,'말도 안되는 가격과 ㅠ 진짜 깨끗해요. 친절하시고. 정말 잘 사용했습니다! 다음에도 또 방문하겠습니다',to_date('22/08/24','RR/MM/DD'),10,'N','null','null','null','안녕하세요:) 저희 스튜디오 이용해 주셔서 정말 감사합니다^^',24,22);
Insert into SPACETIME.REVIEW (REVIEW_NO,REVIEW_CONT,REVIEW_ENROLL_DATE,RATING,REVIEW_STATUS,REVIEW_ATTACH1,REVIEW_ATTACH2,REVIEW_ATTACH3,HOST_ANSWER,RESERVE_NO,MEM_NO) values (286,'간만에 운동했는데 좋네요.',to_date('22/07/25','RR/MM/DD'),10,'N','null','null','null','득근하셨을까요?ㅎㅎ 감사합니다',25,23);
Insert into SPACETIME.REVIEW (REVIEW_NO,REVIEW_CONT,REVIEW_ENROLL_DATE,RATING,REVIEW_STATUS,REVIEW_ATTACH1,REVIEW_ATTACH2,REVIEW_ATTACH3,HOST_ANSWER,RESERVE_NO,MEM_NO) values (287,'신박하게 장난감,인형이 많더라구욥',to_date('22/08/11','RR/MM/DD'),10,'N','null','null','null','아이들도 올수 있게 구성했습니다.ㅎㅎ 감사합니다',26,24);
Insert into SPACETIME.REVIEW (REVIEW_NO,REVIEW_CONT,REVIEW_ENROLL_DATE,RATING,REVIEW_STATUS,REVIEW_ATTACH1,REVIEW_ATTACH2,REVIEW_ATTACH3,HOST_ANSWER,RESERVE_NO,MEM_NO) values (288,'낮에 깔끔한 공간에서 팀원들과 편하게 작업하다 가요ㅎㅎ',to_date('22/08/13','RR/MM/DD'),7,'N','null','null','null','정성스런 정말 감사합니다',27,25);
Insert into SPACETIME.REVIEW (REVIEW_NO,REVIEW_CONT,REVIEW_ENROLL_DATE,RATING,REVIEW_STATUS,REVIEW_ATTACH1,REVIEW_ATTACH2,REVIEW_ATTACH3,HOST_ANSWER,RESERVE_NO,MEM_NO) values (289,'좋아용 깔끔하고 분위기도 괜찮고 다음에 또 이용 할 거 같습니다!!',to_date('22/12/23','RR/MM/DD'),10,'N','null','null','null','프라이빗한 모임이나 카페 컨셉 촬영 하기에도 좋으니 자주 이용해주세요. 감사합니다!',28,26);
Insert into SPACETIME.REVIEW (REVIEW_NO,REVIEW_CONT,REVIEW_ENROLL_DATE,RATING,REVIEW_STATUS,REVIEW_ATTACH1,REVIEW_ATTACH2,REVIEW_ATTACH3,HOST_ANSWER,RESERVE_NO,MEM_NO) values (290,'정말 깔끔하고 주인분께서 디테일하게 궁금한것들도 잘 알려주시고 챙겨주셨답니다. 친구들도 1박하고 싶다고 극찬했어용! 진짜 이뻐요',to_date('22/08/26','RR/MM/DD'),10,'N','null','null','null','앞으로 기회될 때 언제든 이용해주세요. 다시 한 번 감사드려요!',29,27);
Insert into SPACETIME.REVIEW (REVIEW_NO,REVIEW_CONT,REVIEW_ENROLL_DATE,RATING,REVIEW_STATUS,REVIEW_ATTACH1,REVIEW_ATTACH2,REVIEW_ATTACH3,HOST_ANSWER,RESERVE_NO,MEM_NO) values (291,'사장님도 친절하시고 공간도 너무 예쁘고 접시랑 식기가 다 준비되어있어서 좋았어요!!! 다음에 또 방문할게요?',to_date('22/07/28','RR/MM/DD'),10,'N','null','null','null','소중한 후기도 감사합니다. 언제든 또 기회가 되면 찾아주세요 :)!',30,28);
Insert into SPACETIME.REVIEW (REVIEW_NO,REVIEW_CONT,REVIEW_ENROLL_DATE,RATING,REVIEW_STATUS,REVIEW_ATTACH1,REVIEW_ATTACH2,REVIEW_ATTACH3,HOST_ANSWER,RESERVE_NO,MEM_NO) values (262,'득근하고갑니다',to_date('22/08/09','RR/MM/DD'),10,'N','null','null','null','오운완 고생하셨어요 ㅎㅎ 또 방문해주세요',1,2);
Insert into SPACETIME.REVIEW (REVIEW_NO,REVIEW_CONT,REVIEW_ENROLL_DATE,RATING,REVIEW_STATUS,REVIEW_ATTACH1,REVIEW_ATTACH2,REVIEW_ATTACH3,HOST_ANSWER,RESERVE_NO,MEM_NO) values (263,'오랜만에 전시회를 열었는데 분위기 완전 굿~!',to_date('22/07/03','RR/MM/DD'),10,'N','null','null','null','성공적인 전시회를 하셨다니 다행입니다.감사합니다.',2,2);
Insert into SPACETIME.REVIEW (REVIEW_NO,REVIEW_CONT,REVIEW_ENROLL_DATE,RATING,REVIEW_STATUS,REVIEW_ATTACH1,REVIEW_ATTACH2,REVIEW_ATTACH3,HOST_ANSWER,RESERVE_NO,MEM_NO) values (264,'좋습니다 최곱니다 아늑합니다 화장실 문만 조금 더 잘 고정되면 완벽 그 자체입니다',to_date('22/12/17','RR/MM/DD'),7,'N','null','null','null','몇달 동안 여러번 문 균형 맞춰서 수리를 진행하고 있으나, 감사히도 많은 분들이 이용해주시는 만큼 문이 자주 그러는 것 같습니다. 주신 말씀 더 보완해서 완벽 그잡채가 될 수 있도록 부응하도록 하겠습니다',3,3);
Insert into SPACETIME.REVIEW (REVIEW_NO,REVIEW_CONT,REVIEW_ENROLL_DATE,RATING,REVIEW_STATUS,REVIEW_ATTACH1,REVIEW_ATTACH2,REVIEW_ATTACH3,HOST_ANSWER,RESERVE_NO,MEM_NO) values (265,'졸업전시회 장소를 찾다가 이곳으로 했는데 저의 작품이랑 너무 잘맞아서 감동이였어용:)',to_date('22/07/08','RR/MM/DD'),10,'N','null','null','null','졸업축하해요^^많은 홍보 부탁드려요',4,3);
Insert into SPACETIME.REVIEW (REVIEW_NO,REVIEW_CONT,REVIEW_ENROLL_DATE,RATING,REVIEW_STATUS,REVIEW_ATTACH1,REVIEW_ATTACH2,REVIEW_ATTACH3,HOST_ANSWER,RESERVE_NO,MEM_NO) values (266,'너무너무 예쁘고 다 갖춰져 있어서 놀기가 너무 좋았어요! 뷰도 탁 트여있어서 좋았고 사진도 정말 잘나오더라구요',to_date('22/12/23','RR/MM/DD'),10,'N','null','null','null','오늘 다녀가시고 바로 후기 까지 남겨주시다니~ 너무 감사드려요!',5,3);
Insert into SPACETIME.REVIEW (REVIEW_NO,REVIEW_CONT,REVIEW_ENROLL_DATE,RATING,REVIEW_STATUS,REVIEW_ATTACH1,REVIEW_ATTACH2,REVIEW_ATTACH3,HOST_ANSWER,RESERVE_NO,MEM_NO) values (267,'사장님이 너무친절하시고 미술일을 하시는듯..정말 잘 꾸밈',to_date('22/07/12','RR/MM/DD'),10,'N','null','null','null','안녕하세요 ㅎㅎ 미술종사자 입니다.이용해주셔서감사합니다.',6,4);
Insert into SPACETIME.REVIEW (REVIEW_NO,REVIEW_CONT,REVIEW_ENROLL_DATE,RATING,REVIEW_STATUS,REVIEW_ATTACH1,REVIEW_ATTACH2,REVIEW_ATTACH3,HOST_ANSWER,RESERVE_NO,MEM_NO) values (268,'공간도 넓고, 호스트 분도 정말 친절하셨습니다! 다시 한번 감사합니다 :)',to_date('22/07/26','RR/MM/DD'),10,'N','null','null','null','좋은 말씀 감사합니다. ^^ 다음번에도 뵙으면 좋겠습니다.',7,5);
Insert into SPACETIME.REVIEW (REVIEW_NO,REVIEW_CONT,REVIEW_ENROLL_DATE,RATING,REVIEW_STATUS,REVIEW_ATTACH1,REVIEW_ATTACH2,REVIEW_ATTACH3,HOST_ANSWER,RESERVE_NO,MEM_NO) values (269,'가게가 깨끗해서 잘 이용했습니다~!! 사장님도 너무 친절하셔서 감사했어요~!!^^ 다음에 필요하게 되면 꼭 다시 이용할 것 같습니다^^ 번창하세요^^',to_date('22/07/24','RR/MM/DD'),10,'N','null','null','null','잘 이용하셨다니 감사합니다. 평범한 밥집 공간이 새로워진 느낌이었습니다. 또 이용해 주세요. 고맙습니다. :)',8,6);
Insert into SPACETIME.REVIEW (REVIEW_NO,REVIEW_CONT,REVIEW_ENROLL_DATE,RATING,REVIEW_STATUS,REVIEW_ATTACH1,REVIEW_ATTACH2,REVIEW_ATTACH3,HOST_ANSWER,RESERVE_NO,MEM_NO) values (270,'소리가 많이 울릴까봐 걱정했는데 걱정놉!!',to_date('22/07/27','RR/MM/DD'),10,'N','null','null','null','소리울림은 걱정 안하셔도 됩니다.!!',9,7);
Insert into SPACETIME.REVIEW (REVIEW_NO,REVIEW_CONT,REVIEW_ENROLL_DATE,RATING,REVIEW_STATUS,REVIEW_ATTACH1,REVIEW_ATTACH2,REVIEW_ATTACH3,HOST_ANSWER,RESERVE_NO,MEM_NO) values (271,'오운완!!!!',to_date('22/07/11','RR/MM/DD'),10,'N','null','null','null','득근하시고 가시나요?ㅎㅎ방문해주셔서 감사합니다',10,8);
Insert into SPACETIME.REVIEW (REVIEW_NO,REVIEW_CONT,REVIEW_ENROLL_DATE,RATING,REVIEW_STATUS,REVIEW_ATTACH1,REVIEW_ATTACH2,REVIEW_ATTACH3,HOST_ANSWER,RESERVE_NO,MEM_NO) values (272,'친구 세명이랑 총 네명이서 놀았는데 아기자기하고 아늑해서 엄청 재밌게 놀았어요 인테리어도 되게 밤이 되면 분위기가 있어서 좋았습니다',to_date('22/07/04','RR/MM/DD'),10,'N','null','null','null','리뷰 정말 감사드립니다?? 행복하고 특별한 시간 되셨길 바라며 다음번에 또 방문해주시면 감사하겠습니다 적게 일하시고 많이 버세요???',11,9);
Insert into SPACETIME.REVIEW (REVIEW_NO,REVIEW_CONT,REVIEW_ENROLL_DATE,RATING,REVIEW_STATUS,REVIEW_ATTACH1,REVIEW_ATTACH2,REVIEW_ATTACH3,HOST_ANSWER,RESERVE_NO,MEM_NO) values (273,'룸 컨디션 매우 좋았고 넓고 대관 시간에 비해 가성비가 너무 좋았어요!',to_date('22/07/06','RR/MM/DD'),10,'N','null','null','null','사진과 더불어 소중한 후기 너무 감사드립니다! 여러 손님들이 오가는 곳이라, 행사 익일에는 파티룸 컨디션에 상관없이 무조건 전문 청소업체의 청소와 소독을 진행하고있습니다.',12,10);
Insert into SPACETIME.REVIEW (REVIEW_NO,REVIEW_CONT,REVIEW_ENROLL_DATE,RATING,REVIEW_STATUS,REVIEW_ATTACH1,REVIEW_ATTACH2,REVIEW_ATTACH3,HOST_ANSWER,RESERVE_NO,MEM_NO) values (292,'파티룸 정말 크고 예뻐요!',to_date('22/08/15','RR/MM/DD'),10,'N','null','null','null','주변에 언하만큼 높은 건물이 없어서 여기서 노을지는거나 해가 떠오르는걸 보고 있으면 뭔가 마음속 한켠이 몽글몽글해지는 경험을 할 수 있습니다',31,29);
Insert into SPACETIME.REVIEW (REVIEW_NO,REVIEW_CONT,REVIEW_ENROLL_DATE,RATING,REVIEW_STATUS,REVIEW_ATTACH1,REVIEW_ATTACH2,REVIEW_ATTACH3,HOST_ANSWER,RESERVE_NO,MEM_NO) values (293,'너무 좋은 분위기였고 다양한 조리도구가 구비되어 있어서 맛있게 먹고 잘 놀고갑니다!! 다음에 또 되면 들리고 싶습니당',to_date('22/08/28','RR/MM/DD'),10,'N','null','null','null','우와~! 감사합니다',32,30);
Insert into SPACETIME.REVIEW (REVIEW_NO,REVIEW_CONT,REVIEW_ENROLL_DATE,RATING,REVIEW_STATUS,REVIEW_ATTACH1,REVIEW_ATTACH2,REVIEW_ATTACH3,HOST_ANSWER,RESERVE_NO,MEM_NO) values (294,'오랜만에 파티열었는데 완전 대박!!!분위기 넘 좋앙',to_date('22/08/17','RR/MM/DD'),10,'N','null','null','null','분위기 맛집입니다.감사합니다',33,31);
Insert into SPACETIME.REVIEW (REVIEW_NO,REVIEW_CONT,REVIEW_ENROLL_DATE,RATING,REVIEW_STATUS,REVIEW_ATTACH1,REVIEW_ATTACH2,REVIEW_ATTACH3,HOST_ANSWER,RESERVE_NO,MEM_NO) values (295,'광화문에서 정말 잘 구한거같습니다. 너무 좋았어요 ㅋㅋ',to_date('22/07/29','RR/MM/DD'),10,'N','null','null','null','또 놀러와주세요',34,32);
Insert into SPACETIME.REVIEW (REVIEW_NO,REVIEW_CONT,REVIEW_ENROLL_DATE,RATING,REVIEW_STATUS,REVIEW_ATTACH1,REVIEW_ATTACH2,REVIEW_ATTACH3,HOST_ANSWER,RESERVE_NO,MEM_NO) values (296,'스튜디오 색상이 제가 딱 좋아하는 톤이라 너무 맘에 들고 이뻤어요!',to_date('22/08/30','RR/MM/DD'),10,'N','null','null','null','저도 이색을 제일좋아해요>< 또 오세요',35,33);
Insert into SPACETIME.REVIEW (REVIEW_NO,REVIEW_CONT,REVIEW_ENROLL_DATE,RATING,REVIEW_STATUS,REVIEW_ATTACH1,REVIEW_ATTACH2,REVIEW_ATTACH3,HOST_ANSWER,RESERVE_NO,MEM_NO) values (297,'운동끝나고 주변에 맛집도 많아서 ㄱㅇㄷ이네용',to_date('22/09/01','RR/MM/DD'),10,'N','null','null','null','맛있게먹으면 0칼로리~~ ㅇㅈ?',36,34);
Insert into SPACETIME.REVIEW (REVIEW_NO,REVIEW_CONT,REVIEW_ENROLL_DATE,RATING,REVIEW_STATUS,REVIEW_ATTACH1,REVIEW_ATTACH2,REVIEW_ATTACH3,HOST_ANSWER,RESERVE_NO,MEM_NO) values (298,'복잡하지 않은 동네에 넓고 깔끔하고 쾌적합니다! 퀄리티에 비해 가격도 합리적이라고 생각합니다',to_date('22/07/31','RR/MM/DD'),10,'N','null','null','null','감쟈합니당',37,35);
Insert into SPACETIME.REVIEW (REVIEW_NO,REVIEW_CONT,REVIEW_ENROLL_DATE,RATING,REVIEW_STATUS,REVIEW_ATTACH1,REVIEW_ATTACH2,REVIEW_ATTACH3,HOST_ANSWER,RESERVE_NO,MEM_NO) values (299,'호스트님 너무 친절하시고 편의봐주셔서 너무감사했습니다',to_date('22/08/18','RR/MM/DD'),10,'N','null','null','null','좋은 후기 작성해 주신 점 감사드립니다~:)',38,36);
Insert into SPACETIME.REVIEW (REVIEW_NO,REVIEW_CONT,REVIEW_ENROLL_DATE,RATING,REVIEW_STATUS,REVIEW_ATTACH1,REVIEW_ATTACH2,REVIEW_ATTACH3,HOST_ANSWER,RESERVE_NO,MEM_NO) values (300,'일반회사회의실보다 더 좋았습니다.',to_date('22/08/26','RR/MM/DD'),7,'N','null','null','null','제가 직접 회사회의실 돌아다니면서 보고 디자인한것입니다.감사합니다',39,37);
Insert into SPACETIME.REVIEW (REVIEW_NO,REVIEW_CONT,REVIEW_ENROLL_DATE,RATING,REVIEW_STATUS,REVIEW_ATTACH1,REVIEW_ATTACH2,REVIEW_ATTACH3,HOST_ANSWER,RESERVE_NO,MEM_NO) values (301,'여기 정말 대박입니다 10명이들어가도 넉넉할 정도로 굉장히 넓고 가구랑 소품 생화꽃장식까지 하나하나가 고급스럽고 좋았습니다',to_date('22/08/03','RR/MM/DD'),10,'N','null','null','null','재방문 해주세요^^',40,38);
Insert into SPACETIME.REVIEW (REVIEW_NO,REVIEW_CONT,REVIEW_ENROLL_DATE,RATING,REVIEW_STATUS,REVIEW_ATTACH1,REVIEW_ATTACH2,REVIEW_ATTACH3,HOST_ANSWER,RESERVE_NO,MEM_NO) values (302,'주자창이 너무 넉넉해서 굿굿',to_date('22/09/03','RR/MM/DD'),10,'N','null','null','null','편안하게 오셔서 다행입니다 ㅎㅎ',41,39);
Insert into SPACETIME.REVIEW (REVIEW_NO,REVIEW_CONT,REVIEW_ENROLL_DATE,RATING,REVIEW_STATUS,REVIEW_ATTACH1,REVIEW_ATTACH2,REVIEW_ATTACH3,HOST_ANSWER,RESERVE_NO,MEM_NO) values (303,'개인 필라테스 잘 하구왔습니다. 여기 계속 이용해보려구요. 시설 깔끔하고 QR코드 확실히 찍고 넘 깨끗하네용',to_date('22/08/20','RR/MM/DD'),10,'N','null','null','null','네 감사합니다^^ 많은 이용 부탁드려요',42,40);
Insert into SPACETIME.REVIEW (REVIEW_NO,REVIEW_CONT,REVIEW_ENROLL_DATE,RATING,REVIEW_STATUS,REVIEW_ATTACH1,REVIEW_ATTACH2,REVIEW_ATTACH3,HOST_ANSWER,RESERVE_NO,MEM_NO) values (304,'공연이있어서 급하게 잡은 연습실인데 굿~!',to_date('22/08/04','RR/MM/DD'),10,'N','null','null','null','감사합니다.공연 화이팅입니다!',43,41);
Insert into SPACETIME.REVIEW (REVIEW_NO,REVIEW_CONT,REVIEW_ENROLL_DATE,RATING,REVIEW_STATUS,REVIEW_ATTACH1,REVIEW_ATTACH2,REVIEW_ATTACH3,HOST_ANSWER,RESERVE_NO,MEM_NO) values (305,'조명,음악,커피향 카페를 뒤집어놓았다!!',to_date('22/09/04','RR/MM/DD'),10,'N','null','null','null','뭘 아시는분이군요!컨셉을 정확히 알고계시네용',44,42);
Insert into SPACETIME.REVIEW (REVIEW_NO,REVIEW_CONT,REVIEW_ENROLL_DATE,RATING,REVIEW_STATUS,REVIEW_ATTACH1,REVIEW_ATTACH2,REVIEW_ATTACH3,HOST_ANSWER,RESERVE_NO,MEM_NO) values (306,'회의실이 아니라 호텔같은느낌;;',to_date('22/08/21','RR/MM/DD'),10,'N','null','null','null','딱딱한분위기보다는 편안한분위기로 컨셉을 잡았습니다!감사합니다.',45,43);
Insert into SPACETIME.REVIEW (REVIEW_NO,REVIEW_CONT,REVIEW_ENROLL_DATE,RATING,REVIEW_STATUS,REVIEW_ATTACH1,REVIEW_ATTACH2,REVIEW_ATTACH3,HOST_ANSWER,RESERVE_NO,MEM_NO) values (307,'깔끔하고, 밝고 화사합니다. 좋아요',to_date('22/08/06','RR/MM/DD'),10,'N','null','null','null','이용해 주셔서 감사합니다 ? ',46,44);
Insert into SPACETIME.REVIEW (REVIEW_NO,REVIEW_CONT,REVIEW_ENROLL_DATE,RATING,REVIEW_STATUS,REVIEW_ATTACH1,REVIEW_ATTACH2,REVIEW_ATTACH3,HOST_ANSWER,RESERVE_NO,MEM_NO) values (308,'방음 잘되고 카페도 맛있네용.',to_date('22/09/06','RR/MM/DD'),10,'N','null','null','null','네 감사합니다^^ 보다 더 손님들의 쾌적함에 신경 쓰도록 하겠습니다~ 재 이용 해주시면 너무너무 감사할 따름 입니다 ^^',47,45);
Insert into SPACETIME.REVIEW (REVIEW_NO,REVIEW_CONT,REVIEW_ENROLL_DATE,RATING,REVIEW_STATUS,REVIEW_ATTACH1,REVIEW_ATTACH2,REVIEW_ATTACH3,HOST_ANSWER,RESERVE_NO,MEM_NO) values (309,'조용하고 좋았어요:) 핫도그도 맛있더라구요 굿굿',to_date('22/08/08','RR/MM/DD'),10,'N','null','null','null','이용에 감사합니다~ 좋은 공간이 되도록 앞으로도 잘 관리하겠습니다^^',48,46);
Insert into SPACETIME.REVIEW (REVIEW_NO,REVIEW_CONT,REVIEW_ENROLL_DATE,RATING,REVIEW_STATUS,REVIEW_ATTACH1,REVIEW_ATTACH2,REVIEW_ATTACH3,HOST_ANSWER,RESERVE_NO,MEM_NO) values (310,'개인 공부공간과 룸이 분리가되어있어 떠들어도되고 진짜깔끔하고 합리적인 가격에 이용자 편의도 너무잘 되어있어서 너무만족했습니다',to_date('22/09/07','RR/MM/DD'),10,'N','null','null','null','한번 오신 분들의 재방문율이 높으신 것같고, 정기적으로 기간을 선예약하시는 분들도 늘고 있습니다.',49,47);
Insert into SPACETIME.REVIEW (REVIEW_NO,REVIEW_CONT,REVIEW_ENROLL_DATE,RATING,REVIEW_STATUS,REVIEW_ATTACH1,REVIEW_ATTACH2,REVIEW_ATTACH3,HOST_ANSWER,RESERVE_NO,MEM_NO) values (311,'재밌게 놀다 가요',to_date('22/08/22','RR/MM/DD'),10,'N','null','null','null','감사합니다^^재방문 해주세요',50,48);
Insert into SPACETIME.REVIEW (REVIEW_NO,REVIEW_CONT,REVIEW_ENROLL_DATE,RATING,REVIEW_STATUS,REVIEW_ATTACH1,REVIEW_ATTACH2,REVIEW_ATTACH3,HOST_ANSWER,RESERVE_NO,MEM_NO) values (312,'촬영하는데 조명이 너무 좋아요',to_date('22/08/23','RR/MM/DD'),10,'N','null','null','null','조명맛집입니다.',51,49);
Insert into SPACETIME.REVIEW (REVIEW_NO,REVIEW_CONT,REVIEW_ENROLL_DATE,RATING,REVIEW_STATUS,REVIEW_ATTACH1,REVIEW_ATTACH2,REVIEW_ATTACH3,HOST_ANSWER,RESERVE_NO,MEM_NO) values (313,'스튜디오 컨디션이 너무 좋네요',to_date('22/09/08','RR/MM/DD'),10,'Y','null','null','null','관리를 열심히하고있어요 ㅎㅎ',52,50);
--------------------------------------------------------
--  DDL for Index REVIEW_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SPACETIME"."REVIEW_PK" ON "SPACETIME"."REVIEW" ("REVIEW_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table REVIEW
--------------------------------------------------------

  ALTER TABLE "SPACETIME"."REVIEW" ADD CONSTRAINT "REVIEW_PK" PRIMARY KEY ("REVIEW_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SPACETIME"."REVIEW" ADD CONSTRAINT "REVIEW_STATUS_CK" CHECK (REVIEW_STATUS IN ('Y', 'N')) ENABLE;
  ALTER TABLE "SPACETIME"."REVIEW" MODIFY ("MEM_NO" NOT NULL ENABLE);
  ALTER TABLE "SPACETIME"."REVIEW" MODIFY ("RESERVE_NO" NOT NULL ENABLE);
  ALTER TABLE "SPACETIME"."REVIEW" MODIFY ("REVIEW_STATUS" NOT NULL ENABLE);
  ALTER TABLE "SPACETIME"."REVIEW" MODIFY ("RATING" NOT NULL ENABLE);
  ALTER TABLE "SPACETIME"."REVIEW" MODIFY ("REVIEW_ENROLL_DATE" NOT NULL ENABLE);
  ALTER TABLE "SPACETIME"."REVIEW" MODIFY ("REVIEW_CONT" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table REVIEW
--------------------------------------------------------

  ALTER TABLE "SPACETIME"."REVIEW" ADD CONSTRAINT "REVIEW_MEM_NO_FK" FOREIGN KEY ("MEM_NO")
	  REFERENCES "SPACETIME"."MEMBER" ("MEM_NO") ENABLE;
  ALTER TABLE "SPACETIME"."REVIEW" ADD CONSTRAINT "REVIEW_RESERVE_NO_FK" FOREIGN KEY ("RESERVE_NO")
	  REFERENCES "SPACETIME"."RESERVE" ("RESERVE_NO") ENABLE;
