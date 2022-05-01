-- 데이터베이스 지우기
-- drop database semi_project;

-- 여기부터 실행
use semi_project;

select * from user;
select * from user_leave;
select * from board;
select * from board_old;
select * from board_type;
select * from board_common_image;
select * from gender;
select * from like_clicker;

insert into user(user_id, user_pwd, user_name, user_nickname, email, tel, exp, profile_image, permission)
values('admin', '1111', '관리자', '관리자', 'admin@naver.com', '010-0000-0000', 1000, 'adminImg.jpg', 'admin');
insert into user(user_id, user_pwd, user_name, user_nickname, email, tel, exp, profile_image, permission)
values('aaaa', '1111', '곽덕수', '인사동옹기장인', 'moneymoney@naver.com', '010-1111-2222',350, 'profile01.jpg', 'user');
insert into user(user_id, user_pwd, user_name, user_nickname, email, tel, exp, profile_image, permission)
values('bbbb', '1111', '고구마', '고구마조아', 'goguma@naver.com', '010-0000-2222',100, 'profile02.jpg', 'user');
insert into user(user_id, user_pwd, user_name, user_nickname, email, tel, exp, profile_image, permission)
values('cccc', '1111', '김고구마', '구우운고구마', 'goguma12@naver.com', '010-3434-2222', 0, 'profile03.jpg', 'user');
insert into user(user_id, user_pwd, user_name, user_nickname, email, tel, exp, profile_image, permission)
values('dddd', '1111', '홍길동', '홍홍홍홍홍', 'hong01@naver.com', '010-2344-3333', 0, 'profile04.jpg', 'user');
insert into user(user_id, user_pwd, user_name, user_nickname, email, tel, exp, profile_image, permission)
values('eeee', '1111', '김길동', '길동길동이', 'hong02@naver.com', '010-4534-5553', 0, 'profile05.jpg', 'user');
insert into user(user_id, user_pwd, user_name, user_nickname, email, tel, exp, profile_image, permission)
values('ffff', '1111', '이길동', '포인트사냥꾼', 'hong03@naver.com', '010-1111-3663', 0, 'profile06.jpg', 'user');
insert into user(user_id, user_pwd, user_name, user_nickname, email, tel, exp, profile_image, permission)
values('gggg', '1111', '세종대왕', '한글지키미', 'hong04@naver.com', '010-7771-3333', 0, 'profile07.jpg', 'user');
insert into user(user_id, user_pwd, user_name, user_nickname, email, tel, exp, profile_image, permission)
values('hhhh', '1111', '이순신', '뉴비뉴비', 'hong05@naver.com', '010-1888-3333', 0, 'profile08.jpg', 'user');
insert into user(user_id, user_pwd, user_name, user_nickname, email, tel, exp, profile_image, permission)
values('iiii', '1111', '강감찬', '데님쟁이', 'hong06@naver.com', '010-1999-3333', 0, 'profile09.jpg', 'user');
insert into user(user_id, user_pwd, user_name, user_nickname, email, tel, exp, profile_image, permission)
values('jjjj', '1111', '고길동', '릘릐릐야', 'hong07@naver.com', '010-1344-3333', 0, 'profile10.jpg', 'user');
insert into user(user_id, user_pwd, user_name, user_nickname, email, tel, exp, profile_image, permission)
values('kkkk', '1111', '박길동', '보라돌잉', 'hong08@naver.com', '010-1999-3443', 0, 'profile11.jpg', 'user');
insert into user(user_id, user_pwd, user_name, user_nickname, email, tel, exp, profile_image, permission)
values('ㅣㅣㅣㅣ', '1111', '장길동', '숨쉬는NPC', 'hong09@naver.com', '010-3331-3453', 0, 'profile12.jpg', 'user');
insert into user(user_id, user_pwd, user_name, user_nickname, email, tel, exp, profile_image, permission)
values('mmmm', '1111', '심길동', 'o_o_vovo', 'hong10@naver.com', '010-3331-1223', 0, 'profile13.jpg', 'user');
insert into user(user_id, user_pwd, user_name, user_nickname, email, tel, exp, profile_image, permission)
values('nnnn', '1111', '백길동', '개미파워a', 'hong11@naver.com', '010-3351-3453', 0, 'profile14.jpg', 'user');
insert into user(user_id, user_pwd, user_name, user_nickname, email, tel, exp, profile_image, permission)
values('oooo', '1111', '나길동', '앙뇽뇽뇽', 'hong134@naver.com', '010-3378-3453', 0, 'profile15.jpg', 'user');


insert into board_type (type_num, type_name) values(1, '오늘의코디');
insert into board_type (type_num, type_name) values(2, '스타일추천');
insert into board_type (type_num, type_name) values(3, '중고거래');
insert into board_type (type_num, type_name) values(4, '구매후기');
insert into board_type (type_num, type_name) values(5, 'QnA');
insert into board_type (type_num, type_name) values(6, '오늘뭐입지?');

insert into gender (gender_type, gender_name) values('W', '여성의류');
insert into gender (gender_type, gender_name) values('M', '남성의류');
insert into gender (gender_type, gender_name) values('U', '남녀공용');

insert into trade_state(state_num, state_name) values(1, '판매중');
insert into trade_state(state_num, state_name) values(2, '예약중');
insert into trade_state(state_num, state_name) values(3, '거래완료');

insert into report_category(category_num, category_name) values(1, '광고');
insert into report_category(category_num, category_name) values(2, '사기거래');
insert into report_category(category_num, category_name) values(3, '욕설/비방');
insert into report_category(category_num, category_name) values(4, '사칭');

insert into user_grade(grade, exp_min, exp_max, frame_img) values(1, 0, 99, '/img/level1.png');
insert into user_grade(grade, exp_min, exp_max, frame_img) values(2, 100, 199, '/img/level2.png');
insert into user_grade(grade, exp_min, exp_max, frame_img) values(3, 200, 299, '/img/level3.png');
insert into user_grade(grade, exp_min, exp_max, frame_img) values(4, 300, 399, '/img/level4.png');
insert into user_grade(grade, exp_min, exp_max, frame_img) values(5, 400, 1000000, '/img/level5.png');
-- 사진 안넣어서 안 됨
-- 구매후기 게시판
insert into board(type_num, title, content, gender_type, user_id, ip) values (4, '[신발] 아일랜드 슬리퍼', '아직은 개시 못했음','U','aaaa','0:0:0:0:0:0:0:1');
insert into board(type_num, title, content, gender_type, user_id, ip) values (4, '애플워치 까르띠에 스트랩', '넘 예쁜데 갤럭시를 쓰는 나..ㅋㅋ','U','bbbb','0:0:0:0:0:0:0:1');
insert into board(type_num, title, content, gender_type, user_id, ip) values (4, '너무 이쁜 수아레 니트 리뷰!', '스펙
키 : 180
몸무게 : 62
피부색 : 21호 쿨톤

이번에 수아레 니트 체험단에 당첨되어서 리뷰를 해볼까합니다~ 일단 정말 소재가 가볍고 부드러웠습니다 또한 지금처럼 봄에 입기 딱 좋은 니트였습니다 ! 두껍지 않고 정말 얇은 니트입니다
초여름까지도 입을수 있는? 정도입니다
마감처리도 깔끔하게 잘 되어있고 일단 핏이 너무 예쁩니다 특히 저처럼 하의를 베이지색 슬랙스입어주고 아이보리색 수아레 니트를 착용해주면 정말 깔끔하고 훈남 스타일로 연출 가능합니다
거기에 플러스로 검정색 블레이져도 입어주면 완벽합니다!!
색깔 같은 경우는 흰색 아이보리 느낌입니다!!
사이즈 같은 경우는 한사이즈 업해서 선택하시는걸 추천드려요 그래야 더 완벽한 스타일링 연출 가능하다고 생각이듭니다!
정핏을 원하시면 정핏 그대로 선택하시면 될 것 같아요
하지만 한사이즈업해도 너무 오버사이즈 하지가 않다는걸 감안하시면 될 것 같습니다

이번 체험단 리뷰는 여기까지 적도록 하겠습니다!
감사합니당
','M','cccc','0:0:0:0:0:0:0:1');
insert into board(type_num, title, content, gender_type, user_id, ip) values (4, '신상 버닝스톰 후기/리뷰', '키 176 /70 이며 제품은 30사이즈 선택하였습니다.

기장이 조금 길게 나와 기장은 2cm 정도 수선 진행했습니다.

허리는 딱 좋게 맞습니다.

동체형에서 조금 더 타이트하게 입으시려면 29까진 괜찮을 듯 합니다 !

그 부분 참고해서 봐주시면 감사하겠습니다.

색감은 중청과 은은한 그레이쉬빛 도는 연청 사이로 보시면 될 것 같습니다.

개체차이가 있을진 모르겠으나,
제가 수령한 제품은 워싱도 정말 예쁘게 잘 들어가 있습니다.

데님 명가 답게 퀄리티는 의심할 부분이 없었습니다.

핏은 와이드 스트레이트 핏이며,

브랜디드의 와이드스트레이트 ~ 슈퍼와이드 스트레이트 핏 사이 정도로 보시면 됩니다.

색감과 핏이 워낙 범용성 좋게 나와,

어느 옷에나 잘 받으며 사실상 흰 티만 입어도 코디 끝입니다.

두께감이 그리 두껍지 않아 사계절 모두 가능합니다.','U','dddd','0:0:0:0:0:0:0:1');
insert into board(type_num, title, content, gender_type, user_id, ip) values (4, '시그니처 스웨트셔츠 체험단 리뷰', '상품 사이즈: XL
신체 사이즈: 178cm / 65kg

1. 컬러
착용한 색상은 스카이블루입니다.
피부톤에 상관없이 누구나 소화 할 수 있으며
색의 톤은 채도와 광도가 살짝 빠진 느낌으로,
맑게 갠 푸른 하늘에 빈티지 필터를 씌운듯한 매력적인 색상입니다.

2. 디자인
프린팅 로고가 너무 커버리면 자칫 촌스러울 수 있는데 적당한 크기로 자리 잡아 스타일에 따라 다양한 매력을 보여줄 수 있는 예쁜 포인트가 될 거 같습니다. 그리고 일반 실사 인쇄는 간혹 프린팅이 벗겨지는 일이 있는데 자수 인쇄로 제작되어 벗겨질 염려도 없어 보이고 훨씬 고급스러워 보였습니다.
밑단 시보리는 탄성력이 좋아서 레이어드룩을 연출해도 흐트러지지 않는 핏을 유지할 수 있었습니다.

3. 연출
스카이블루 색상을 돋보이게 하기 위해 팬츠를 화이트로 선택하였고, 전체적인 컬러 밸런스를 화이트와 블루 계열에 맞춰서 연출해 보았습니다.
볼캡은 컬러에 따라 느낌이 달라지는 거 같아서 화이트와 스카이 두 가지 버전으로 촬영하였습니다.','M','eeee','0:0:0:0:0:0:0:1');
insert into board(type_num, title, content, gender_type, user_id, ip) values (4, '보이핏 오버셔츠 체험단 리뷰 :)', '후아유 보이핏 오버셔츠 

 ■ 소재 / 디테일
소재는 일반 옥스포드 셔츠와 비슷한 느낌이었구, 두께감이 살짝있어서 요즘같은 환절기에 아우터로 걸치기 좋은 정도의 두께였어요
한여름, 한겨울만빼면 아우터로 입고 다니기 좋을거같아요
이 셔츠 최고디테일은 뭐니뭐니해두 곰돌이 자수
넘귀여워서 입고 사진찍으면 곰돌이가 시선강탈이었습니다
친구들도 다 보고 귀엽다고 칭찬해줬어요!


 ■ 착용감 / 사이즈  - 160cm / 53kg
키가 160이라 L사이즈는 진짜 제몸에 많이 크긴했지만, 완전 크게 입구 싶어서 L로 신청한거라 감안하구 입었습니다.
제가 딱 원하던 진짜 남자친구 옷 뺏어입은 핏이어서 넘 맘에 들었어요!
안에 타이트하게 입구 셔츠 걸치니까 넘 예뻐서 대만족!


 ■ 코디
셔츠가 완전 오버핏이라 안에는 딱붙게 입어봤어요. 키가 작은편이라 안에두 방방하게 입었더니 너무 아빠옷 입고나온 느낌이라ㅠㅠ
안에 크롭탑이랑 핫팬츠입구 롱부츠 신었더니 최고이뻤어요!
셔츠 색두 깔끔한 흰색이라 블랙이랑 코디하니까 잘맞았습니다','U','ffff','0:0:0:0:0:0:0:1');
insert into board(type_num, title, content, gender_type, user_id, ip) values (4, '로맨틱크라운 더블 버튼 옥스포드 셔츠_블루 리뷰', '안녕하세요. 이번에 로맨틱크라운 더블 버튼 옥스포드 셔츠 후기를 솔직하게 전달하겠습니다.



전체적인 느낌은 일반 옥스포드 셔츠와 비슷하다고 보시면 될 것 같습니다. 하지만 여기서 기존 옥스포드 셔츠와 차이점은 원색이 아닌 블루와 그레이 혼합이라는 점과 더블 버튼이라는 점이 이 제품의 가장 큰 디테일이라고 생각합니다. 그럼 요목조목 리뷰를 해보겠습니다.



- 체형 : 174/71 상의:100~105/L



1. 핏 : 먼저 핏입니다!! 셔츠는 이너 혹은 단품으로 착용하는 제품인데 이너로  착용할지 혹은 단품으로 착용할지에 따라 핏을 결정하는게 중요하죠!! 저는 주로 L사이즈를 착용하는데 이 제품의 경우 오버핏까지는 아니지만 품이 조금 크게 나왔다고 생각이 들어서 M사이즈를 신청했는데 살짝 기장이 짧은거 말고는 잘 맞더라고요. 그래서 주로 이너로 활용하거나 단품으로 활용할 때는 바지핏을 같이 고려해서 착용해야 할 것 같습니다. 핏은 옥스포드 셔츠 처럼 단정하면서 편안한 느낌으로 입을 수 있게 나온 제품인거 같아요.



2. 색감 : 제품명에는 블루라고 되어 있지만 약간은 소라색에 조금 더 가까운 제품이라고 생각합니다. 제품에서도 보이지만 그레이 색상과 혼합하여 제작된 제품이라 셔츠에서는 자주 보이는 디테일은 아니라고 생각이 들어서 호불호가 갈릴 수 있다고 생각합니다. 그래도 셔츠에서는 흔히 보이는 패턴은 아니니 한번쯤 고민해보셔도 좋을 것 같습니다, 색감은 부담스럽지 않을 정도 그리고 간절기에 입기 좋은 색감으로 나온거 같아서 제품 받고 여러차례 착용했습니다.



3. 디테일 : 제품 디테일에는 먼저 더블 버튼이라는 점!!!! 더블 버튼을 통해서 연출이 다양하게 나올 수 있는게 제품 특성인 것 같습니다. 저는 M사이즈라 더블 버튼을 제대로 활용하지 못했지만 한 사이즈 오버하게 입으시면 더블 버튼을 통해서 조금 더 타이트하게 대신 핏하게 입을 수 있을 것 같습니다. 그리고 로맨틱크라운의 로고가 들어가 있는 점, 그리고 사이드에 트임을 통한 셔츠 이너를 들어낼 수 있는 부분이 이 제품의 가장 대표적인 디테일이라고 생각합니다.



4. 그 외 부분 : 핏, 색감, 디테일 외에 원단감이나 봉재, 마감 등은 좋은 편입니다. 봉재와 마감에서 사실 놀랐는데 정말 깔끔하게 처리되어 있습니다. 받아보시는 제품마다 다를 수 있지만 제가 받은 제품의 경우 상당히 깔끔하게 처리되어 있었습니다.(실밥이 진짜 하나도 없었음)



5. 스타일링 : 제가 생각하는 이 제품의 스타일링은 약간 시티보이 스타일 혹은 이지캐주얼 느낌의 제품들과 매칭하는 것이 가장 잘 어울리는 것 같습니다. 색감에서 나오는 느낌, 디테일에서 보이는 느낌이 캐주얼 제품들과 잘 어울릴 것 같다고 생각했습니다. 그래서 저는 요즘 같은 간절기에 잘 어울리는 가디건과 함께 매칭하여 스타일링을 해보았습니다.



이것으로 리뷰 마치겠습니다. 감사합니다.','M','gggg','0:0:0:0:0:0:0:1');
insert into board(type_num, title, content, gender_type, user_id, ip) values (4, '아키텍트 백팩 리뷰', 
'먼저 저의 스펙은 170/43 으로 키에 비해 비교적 왜소한 몸집을 지니고 있습니다 그렇기에 가방이 크진 않을까?? 하고 걱정했었는데 그런 걱정이 전혀 필요 없었습니다 ㅎㅎ 사진에서 볼 수 있듯이 적당한 크기의 가방으로 착용감이 좋아보이는 것을 확인할 수 있습니다 !
가방 자체가 이쁜 것도 있지만 이 가방의 매력을 하나 꼽으라고 한다면 ‘실용성’ 이라고 말씀드릴 수 있을 것 같아요 가방을 배송받고 처음 열어보는 순간 곳곳에 달린 지퍼들과 수납공간을 보고 감동 받았습니다… 저는 학생이라 들고다닐 것이 정말 많은데 수납공간을 딱딱 나눠서 넣고 다닐 생각에 행복하기 까지 …
심지어 옆에 텀블러를 수납할 수 있는 주머니도 장착되어있어 여름이나 겨울이나 계절에 관계없이 잘 쓸 수 있을 것 같아요 ㅎㅎ 방수도 되는 재질이라 실수로 물을 쏟아도 내용물이 젖을 걱정은 전혀 필요 없어요 !
색은 무난한 블랙이지만 마크 부분 등 곳곳에 흰색 포인트가 있어 세련된 가방입니다 ! ( 색 덕분에 오래오래 사용해도 새 제품 같을 것 같아요 ) 저는 여러가지 코디를 고민하던 중 데일리룩에 매치해보았어요 ㅎㅎ 아무래도 학생이다보니 학원이나 독서실에 갈 때 자주 사용할 것 같아서요 !

통이 넓고 기장이 긴 청바지에 아디다스 상의를 매치해주었어요 ! 상의는 화이트 포인트가 있는 거라 가방이 잘 보일 수 있게 입었습니다 ㅎㅎ 모두 청바지 하나씩은 있지 않나요?! 통 큰 바지를 입어주면 상반신이 슬립해보이는 효과를 얻을 수 있으니 추천드려요 ! 이 외에도 청자켓이나 화이트 계열의 카고바지와도 잘 어울릴 것 같다는 생각이 들었습니다 가방의 색과 대비되는 색의 코디를 입거나 여성분들에게 가방은 조금 클 수 있으니 슬림한 착장을 입어주신다면 완벽할 것 같아요

예일 브랜드 제품은 처음인데 세련된 가방으로 체험해 볼 수 있어서 좋았어요 ㅎㅎ 덕분에 예일 브랜드의 다른 제품들도 검색해보게 되었고 찜도 해두었네요 ! 가방 정말 실용성이 굿굿이라 당장 학교에 들고다니려구요! 다시 한 번 체험할 수 있는 기회 주셔서 감사드립니다 ','U','hhhh','0:0:0:0:0:0:0:1');
insert into board(type_num, title, content, gender_type, user_id, ip) values (4, '[수아레] 세미 오버 무톤 자켓 리뷰', '저는 겨울에 입기 좋은 컬러감인
브라운색을 선택 하였습니다.
사진을 잘 못찍은 점 이해 부탁드리겠습니다.

우선 첫번째로 제품 디테일 입니다.
배송 왔을 때 색감 보고 너무 놀랐습니다. 사진 보다 실물이 더 이쁜 제품입니다.. 말 그대로 실물깡패!!!
또한 무스탕의 제일 중요한 재질인데요.. 정말 싸구려 소재가 아닙니다!! 실제로 가죽 같은 소재 여서 또 놀랐습니다.. 친구도 재질 너무 좋다고 어디서 샀냐고 물어봤을 정도로요!!!
그리고 핏은 정말.. 그냥 미쳤습니다 요즘 또 미니멀룩이 트렌드 아니겠습니까?? 미니멀 그 정석 입니다 세미 오버핏 으로 입으면 그냥 어깡 됩니다.. 남자분들.. 이거 입고 강남 가시면 번호 따입니다 실제로 겪었어요!!

우선 제 스펙은 184/70 입니다 L 사이즈 착용했구요!! 다들 흔히 가지고 있으신 데님,슬랙스 바지로 쉽게 코디가 가능하고 무지티, 여러 니트 옷으로 이쁘게 코디 가능합니다 숏으로 나오다 보니 키도 다리도 엄청 길어 보여요!! 조금 단점 이라면 이너로 두꺼운 옷을 입게 되면 조금 불편하실 수 있어요!! 그리고 숏 이다 보니 주머니 넣은 것이 불편합니다 하지만 충분히 멋쟁이 분들은 핏,재질,색감 만으로 이런 것들은 감수 하고 입을 수 있잖아요~~

이 가격대에 가성비 좋은 제품 찾기 어렵습니다!! 하나씩 구매 하시면 좋을것 같아요^^','M','iiii','0:0:0:0:0:0:0:1');
insert into board(type_num, title, content, gender_type, user_id, ip) values (4, '휘게 언더웨어 베스티 체크 파자마 세트 리뷰', '일단 저의 키는 160에 53키로 입니다
제가 입기에 m사이즈는 조금 넉넉히 컸구요!
몸에 피부가 예민하지 않다는 것도 있지만
순면이라 그런지 꺼칠꺼칠 한 느낌이 전혀 없었어요! 오히려 착용감이 너무 좋아서 같이 사는 룸메이트도 저에게
"와 너 잠옷 진짜 예쁘다 좋아보인다 얼마야?"하며
관심을 보였고 사진에 모델이 입은 아이보리 컬러와 약간의 베이지 빨간색이 조화를 이루면서 체크가 너무너무 예뻤어요! 다른 잠옷들 보면 소재와 잠옷 색이 미묘하게 다른곳이 많은데
그대로 출고 되어서 좋았습니다! 하지만 가격에 비해 실밥 같은 마감처리 부분이 완벽하지는
않아서 다소 아쉬운 면도 있었지만 싸구려 잠옷보다 훨신 오래 많이 입을 것 같습니다! 너무 예쁜 잠옷 보내주신 휘게!!감사합니다❤️','W','jjjj','0:0:0:0:0:0:0:1');
insert into board(type_num, title, content, gender_type, user_id, ip) values (4, '라퍼지스토어 다운퀄팅 자켓 크림색 리뷰', '제 체형과 비슷하신분들에게는 기장과 핏감 모두 오버핏이 아닌 적당한 정핏이 나올것이라고 생각됩니다!  디자인은 다른 프린팅이나 그런것들이 없는 앞뒤다 무지형태로 되어있었습니다.
색감은 아이보리와 비슷한 육안으로 봤을때 굉장히 예쁜 크림색입니다. 
옆구리쪽? 쪽에 있는 사이트 포켓 두개의 위치는 추울때 손을 넣기 쉬운 위치에 만들어져있었고, 두께감 또한 영하로 내려가는 겨울온도가 아닌이상, 봄,가을,겨울(이너로) 코디하여 입을수 있을것 같았습니다.
옷중심부에는 지퍼대신 단추가 아래부터 위까지 달려있는 형태입니다.
디자인이 유니크하진 않아서 캐쥬얼,미니멀 코디를 하실때 구매해서 착용하시면 굉장히 요긴하게 사용될수 있을거라고 생각됩니다. 
안감도 싸지않고 좋은걸 쓰셨는지 상당히 따뜻하고, 가벼운 제품이였습니다','M','kkkk','0:0:0:0:0:0:0:1');


-- 파일명 중복 안됨(upload에 이미지파일 넣기
-- 구매후기 게시판 이미지
insert into board_common_image(board_num, file1, file2, file3, file4, file5) values(1, 'island01.jpg', 'island02.jpg', null,  null,  null);
insert into board_common_image(board_num, file1, file2, file3, file4, file5) values(2, 'cartier01.jpg', null, null, null, null);
insert into board_common_image(board_num, file1, file2, file3, file4, file5) values(3, 'knit01.jpg', 'knit02.jpg', 'knit03.jpg', 'knit04.jpg', 'knit05.jpg');
insert into board_common_image(board_num, file1, file2, file3, file4, file5) values(4, 'mod01.jpg', 'mode02.jpg', 'mode03.jpg', 'mode04.jpg', null);
insert into board_common_image(board_num, file1, file2, file3, file4, file5) values(5, 'img01.jpg', 'img02.jpg', 'img03.jpg', 'img04.jpg', 'img05.jpg');
insert into board_common_image(board_num, file1, file2, file3, file4, file5) values(6, 'img06.jpg', 'img07.jpg', null, null, null);
insert into board_common_image(board_num, file1, file2, file3, file4, file5) values(7, 'img08.jpg', 'img09.jpg', null, null, null);
insert into board_common_image(board_num, file1, file2, file3, file4, file5) values(8, 'img10.jpg', 'img11.jpg', 'img12.jpg', null, null);
insert into board_common_image(board_num, file1, file2, file3, file4, file5) values(9, 'img13.jpg', 'img14.jpg', 'img15.jpg', 'img16.jpg', 'img17.jpg');
insert into board_common_image(board_num, file1, file2, file3, file4, file5) values(10, 'img18.jpg', 'img19.jpg', 'img20.jpg', null, null);
insert into board_common_image(board_num, file1, file2, file3, file4, file5) values(11, 'img21.jpg', 'img22.jpg', 'img23.jpg', null, null);


-- 댓글
insert into reply(board_num, coment, user_id) values(2, '갤럭시에 애플워치 쓰심??', 'cccc');
insert into reply(board_num, coment, user_id) values(2, '고급스럽네요 ㅎㅎㅎ', 'dddd');
insert into reply(board_num, coment, user_id) values(3, '180/62 정도는 되야 어울리는 룩 기억 하겠습니당 ㅠ ㅠ', 'eeee');
insert into reply(board_num, coment, user_id) values(4, '다 덮는 핏인데도 다리가 디게 길어보이는 느낌이네요!', 'ffff');
insert into reply(board_num, coment, user_id) values(5, '밝은곳에서 찍어서 그렇지 실제 색감은 어두운 편이죠?', 'gggg');
insert into reply(board_num, coment, user_id) values(5, '그렇게 밝지도 어둡지도 않습니다 톤은 딱 적당해 보입니다 무광의 스카이블루라 보시면 될거같습니다^^', 'eeee');
insert into reply(board_num, coment, user_id) values(5, '코디 넘 예뿐거 같아요 색상 존예', 'hhhh');
insert into reply(board_num, coment, user_id) values(8, '요즘 유행하는 빅백팩이 맞네요', 'iiii');
insert into reply(board_num, coment, user_id) values(11, '색감이 아주 좋네요 귀엽습니당', 'jjjj');



