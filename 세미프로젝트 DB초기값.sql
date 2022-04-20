-- 데이터베이스 지우기
drop database semi_project;

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
values('aaaa', '1111', '곽덕수', '인사동옹기장인', 'moneymoney@naver.com', '010-1111-2222',350, 'profileDefault.png', 'user');
insert into user(user_id, user_pwd, user_name, user_nickname, email, tel, exp, profile_image, permission)
values('bbbb', '1111', '고구마', '고구마조아', 'goguma@naver.com', '010-0000-2222',100, 'profileDefault.png', 'user');
insert into user(user_id, user_pwd, user_name, user_nickname, email, tel, exp, profile_image, permission)
values('cccc', '1111', '김고구마', '구우운고구마', 'goguma12@naver.com', '010-3434-2222', 0, 'profileDefault.png', 'user');
insert into user(user_id, user_pwd, user_name, user_nickname, email, tel, exp, profile_image, permission)
values('dddd', '1111', '홍길동', '홍홍홍홍홍', 'hong01@naver.com', '010-2344-3333', 0, 'profileDefault.png', 'user');
insert into user(user_id, user_pwd, user_name, user_nickname, email, tel, exp, profile_image, permission)
values('eeee', '1111', '김길동', '길동길동이', 'hong02@naver.com', '010-4534-5553', 0, 'profileDefault.png', 'user');
insert into user(user_id, user_pwd, user_name, user_nickname, email, tel, exp, profile_image, permission)
values('ffff', '1111', '이길동', '포인트사냥꾼', 'hong03@naver.com', '010-1111-3663', 0, 'profileDefault.png', 'user');
insert into user(user_id, user_pwd, user_name, user_nickname, email, tel, exp, profile_image, permission)
values('gggg', '1111', '세종대왕', '한글지키미', 'hong04@naver.com', '010-7771-3333', 0, 'profileDefault.png', 'user');
insert into user(user_id, user_pwd, user_name, user_nickname, email, tel, exp, profile_image, permission)
values('hhhh', '1111', '이순신', '뉴비뉴비', 'hong05@naver.com', '010-1888-3333', 0, 'profileDefault.png', 'user');
insert into user(user_id, user_pwd, user_name, user_nickname, email, tel, exp, profile_image, permission)
values('iiii', '1111', '강감찬', '데님쟁이', 'hong06@naver.com', '010-1999-3333', 0, 'profileDefault.png', 'user');
insert into user(user_id, user_pwd, user_name, user_nickname, email, tel, exp, profile_image, permission)
values('jjjj', '1111', '고길동', '릘릐릐야', 'hong07@naver.com', '010-1344-3333', 0, 'profileDefault.png', 'user');
insert into user(user_id, user_pwd, user_name, user_nickname, email, tel, exp, profile_image, permission)
values('kkkk', '1111', '박길동', '보라돌잉', 'hong08@naver.com', '010-1999-3333', 0, 'profileDefault.png', 'user');
insert into user(user_id, user_pwd, user_name, user_nickname, email, tel, exp, profile_image, permission)
values('ㅣㅣㅣㅣ', '1111', '장길동', '숨쉬는NPC', 'hong09@naver.com', '010-3331-3453', 0, 'profileDefault.png', 'user');
insert into user(user_id, user_pwd, user_name, user_nickname, email, tel, exp, profile_image, permission)
values('mmmm', '1111', '심길동', 'o_o_vovo', 'hong10@naver.com', '010-3331-1223', 0, 'profileDefault.png', 'user');
insert into user(user_id, user_pwd, user_name, user_nickname, email, tel, exp, profile_image, permission)
values('nnnn', '1111', '백길동', '개미파워a', 'hong11@naver.com', '010-3351-3453', 0, 'profileDefault.png', 'user');

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
insert into board(type_num, title, content, gender_type, user_id, ip) values (4, '[신발] 아앨랜드 슲리퍼', '아직은 개시 못했음','U','aaaa','0:0:0:0:0:0:0:1');
insert into board(type_num, title, content, gender_type, user_id, ip) values (4, '애플워치 까르띠에 스트랩', '넘 예쁜데 갤럭시를 쓰는 나..ㅋㅋ','U','bbbb','0:0:0:0:0:0:0:1');

-- 파일명 중복 안됨(upload에 이미지파일 넣기
-- 구매후기 게시판 이미지
insert into board_common_image(board_num, file1, file2, file3, file4, file5) values(1, 'island01.jpg', 'island02.jpg', null,  null,  null);
insert into board_common_image(board_num, file1, file2, file3, file4, file5) values(2, 'cartier01.jpg', null, null, null, null);

-- 댓글
insert into reply(board_num, coment, user_id) values(2, '갤럭시에 애플워치 쓰심??', 'cccc');
insert into reply(board_num, coment, user_id) values(2, '고급스럽네요 ㅎㅎㅎ', 'dddd');

