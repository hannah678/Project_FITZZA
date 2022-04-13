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
select * from board_report;

delete from user where user_id='aaaa';
delete from board where type_num=3;

insert into user(user_id, user_pwd, user_name, user_nickname, email, tel, exp, profile_image, permission)
values('aaaa', '1111', '곽덕수', '인사동옹기장인', 'moneymoney@naver.com', '010-1111-2222', 150, 'profileDefault.png', 'user');
insert into user(user_id, user_pwd, user_name, user_nickname, email, tel, exp, profile_image, permission)
values('bbbb', '1111', '고구마', '고구마조아', 'goguma@naver.com', '010-0000-2222', 350, 'profileDefault.png', 'user');
insert into user(user_id, user_pwd, user_name, user_nickname, email, tel, exp, profile_image, permission)
values('cccc', '1111', '홍길동', '홍홍홍홍홍', 'hong@naver.com', '010-1111-3333', 0, 'profileDefault.png', 'user');
insert into user(user_id, user_pwd, user_name, user_nickname, email, tel, exp, profile_image, permission)
values('admin', '1111', '관리자', '관리자', 'admin@naver.com', '010-0000-0000', 1000, 'adminImg.jpg', 'admin');

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
insert into board(type_num, title, content, gender_type, user_id, ip) values (4, '111옷 리뷰', '이 옷 좋음','W','aaaa','0:0:0:0:0:0:0:1');
insert into board(type_num, title, content, gender_type, user_id, ip) values (4, '222옷 리뷰', '이 옷 별루','M','bbbb','0:0:0:0:0:0:0:1');
insert into board(type_num, title, content, gender_type, user_id, ip) values (4, '333옷 리뷰', '이 옷 좋음','U','cccc','0:0:0:0:0:0:0:1');
insert into board(type_num, title, content, gender_type, user_id, ip) values (4, '444옷 리뷰', '이 옷 별루','W','aaaa','0:0:0:0:0:0:0:1');
insert into board(type_num, title, content, gender_type, user_id, ip) values (4, '555옷 리뷰', '이 옷 좋음','M','bbbb','0:0:0:0:0:0:0:1');
insert into board(type_num, title, content, gender_type, user_id, ip) values (4, '666옷 리뷰', '이 옷 별루','U','cccc','0:0:0:0:0:0:0:1');
insert into board(type_num, title, content, gender_type, user_id, ip) values (4, '777옷 리뷰', '이 옷 좋음','W','aaaa','0:0:0:0:0:0:0:1');
insert into board(type_num, title, content, gender_type, user_id, ip) values (4, '888옷 리뷰', '이 옷 별루','M','bbbb','0:0:0:0:0:0:0:1');
insert into board(type_num, title, content, gender_type, user_id, ip) values (4, '999옷 리뷰', '이 옷 좋음','W','cccc','0:0:0:0:0:0:0:1');
insert into board(type_num, title, content, gender_type, user_id, ip) values (4, '1010옷 리뷰', '이 옷 별루','U','aaaa','0:0:0:0:0:0:0:1');
insert into board(type_num, title, content, gender_type, user_id, ip) values (4, '1111옷 리뷰', '이 옷 좋음','W','bbbb','0:0:0:0:0:0:0:1');
insert into board(type_num, title, content, gender_type, user_id, ip) values (4, '1212옷 리뷰', '이 옷 별루','M','cccc','0:0:0:0:0:0:0:1');
insert into board(type_num, title, content, gender_type, user_id, ip) values (4, '1313옷 리뷰', '이 옷 좋음','U','aaaa','0:0:0:0:0:0:0:1');
insert into board(type_num, title, content, gender_type, user_id, ip) values (4, '1414옷 리뷰', '이 옷 별루','W','bbbb','0:0:0:0:0:0:0:1');
insert into board(type_num, title, content, gender_type, user_id, ip) values (4, '1515옷 리뷰', '이 옷 좋음','M','cccc','0:0:0:0:0:0:0:1');
insert into board(type_num, title, content, gender_type, user_id, ip) values (4, '1616옷 리뷰', '이 옷 별루','U','aaaa','0:0:0:0:0:0:0:1');
insert into board(type_num, title, content, gender_type, user_id, ip) values (4, '1717옷 리뷰', '이 옷 별루','W','bbbb','0:0:0:0:0:0:0:1');
insert into board(type_num, title, content, gender_type, user_id, ip) values (4, '1818옷 리뷰', '이 옷 좋음','M','cccc','0:0:0:0:0:0:0:1');
insert into board(type_num, title, content, gender_type, user_id, ip) values (4, '1919옷 리뷰', '이 옷 별루','U','aaaa','0:0:0:0:0:0:0:1');
insert into board(type_num, title, content, gender_type, user_id, ip) values (4, '2020옷 리뷰', '이 옷 별루','W','bbbb','0:0:0:0:0:0:0:1');
insert into board(type_num, title, content, gender_type, user_id, ip) values (4, '2121옷 리뷰', '이 옷 좋음','M','cccc','0:0:0:0:0:0:0:1');
insert into board(type_num, title, content, gender_type, user_id, ip) values (4, '2222옷 리뷰', '이 옷 별루','U','aaaa','0:0:0:0:0:0:0:1');
-- 파일명 중복 안됨
insert into board_common_image(board_num, file1, file2, file3, file4, file5) values(1, 'codi_book_img1.png', 'codi_book_img2.png', 'codi_book_img3.png', 'codi_book_img4.png', 'codi_book_img5.png');
insert into board_common_image(board_num, file1, file2, file3, file4, file5) values(2, 'codi_book_img1.png', 'codi_book_img2.png', 'codi_book_img3.png', 'codi_book_img4.png', 'codi_book_img5.png');
insert into board_common_image(board_num, file1, file2, file3, file4, file5) values(3, 'codi_book_img1.png', 'codi_book_img2.png', 'codi_book_img3.png', 'codi_book_img4.png', 'codi_book_img5.png');
insert into board_common_image(board_num, file1, file2, file3, file4, file5) values(4, 'codi_book_img1.png', 'codi_book_img2.png', 'codi_book_img3.png', 'codi_book_img4.png', 'codi_book_img5.png');
insert into board_common_image(board_num, file1, file2, file3, file4, file5) values(5, 'codi_book_img1.png', 'codi_book_img2.png', 'codi_book_img3.png', 'codi_book_img4.png', 'codi_book_img5.png');
insert into board_common_image(board_num, file1, file2, file3, file4, file5) values(6, 'codi_book_img1.png', 'codi_book_img2.png', 'codi_book_img3.png', 'codi_book_img4.png', 'codi_book_img5.png');
insert into board_common_image(board_num, file1, file2, file3, file4, file5) values(7, 'codi_book_img1.png', 'codi_book_img2.png', 'codi_book_img3.png', 'codi_book_img4.png', 'codi_book_img5.png');
insert into board_common_image(board_num, file1, file2, file3, file4, file5) values(8, 'codi_book_img1.png', 'codi_book_img2.png', 'codi_book_img3.png', 'codi_book_img4.png', 'codi_book_img5.png');
insert into board_common_image(board_num, file1, file2, file3, file4, file5) values(9, 'codi_book_img1.png', 'codi_book_img2.png', 'codi_book_img3.png', 'codi_book_img4.png', 'codi_book_img5.png');
insert into board_common_image(board_num, file1, file2, file3, file4, file5) values(10, 'codi_book_img1.png', 'codi_book_img2.png', 'codi_book_img3.png', 'codi_book_img4.png', 'codi_book_img5.png');
insert into board_common_image(board_num, file1, file2, file3, file4, file5) values(11, 'codi_book_img1.png', 'codi_book_img2.png', 'codi_book_img3.png', 'codi_book_img4.png', 'codi_book_img5.png');
insert into board_common_image(board_num, file1, file2, file3, file4, file5) values(12, 'codi_book_img1.png', 'codi_book_img2.png', 'codi_book_img3.png', 'codi_book_img4.png', 'codi_book_img5.png');
insert into board_common_image(board_num, file1, file2, file3, file4, file5) values(13, 'codi_book_img1.png', 'codi_book_img2.png', 'codi_book_img3.png', 'codi_book_img4.png', 'codi_book_img5.png');
insert into board_common_image(board_num, file1, file2, file3, file4, file5) values(14, 'codi_book_img1.png', 'codi_book_img2.png', 'codi_book_img3.png', 'codi_book_img4.png', 'codi_book_img5.png');
insert into board_common_image(board_num, file1, file2, file3, file4, file5) values(15, 'codi_book_img1.png', 'codi_book_img2.png', 'codi_book_img3.png', 'codi_book_img4.png', 'codi_book_img5.png');
insert into board_common_image(board_num, file1, file2, file3, file4, file5) values(16, 'codi_book_img1.png', 'codi_book_img2.png', 'codi_book_img3.png', 'codi_book_img4.png', 'codi_book_img5.png');
insert into board_common_image(board_num, file1, file2, file3, file4, file5) values(17, 'codi_book_img1.png', 'codi_book_img2.png', 'codi_book_img3.png', 'codi_book_img4.png', 'codi_book_img5.png');
insert into board_common_image(board_num, file1, file2, file3, file4, file5) values(18, 'codi_book_img1.png', 'codi_book_img2.png', 'codi_book_img3.png', 'codi_book_img4.png', 'codi_book_img5.png');
insert into board_common_image(board_num, file1, file2, file3, file4, file5) values(19, 'codi_book_img1.png', 'codi_book_img2.png', 'codi_book_img3.png', 'codi_book_img4.png', 'codi_book_img5.png');
insert into board_common_image(board_num, file1, file2, file3, file4, file5) values(20, 'codi_book_img1.png', 'codi_book_img2.png', 'codi_book_img3.png', 'codi_book_img4.png', 'codi_book_img5.png');
