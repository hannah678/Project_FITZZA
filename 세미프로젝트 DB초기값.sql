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

-- delete from board where user_id='aaaa';

insert into user(user_id, user_pwd, user_name, user_nickname, email, tel, permission)
values('aaaa', '1111', '곽덕수', '인사동옹기장인', 'moneymoney@naver.com', '010-1111-2222', 'user');
insert into user(user_id, user_pwd, user_name, user_nickname, email, tel, permission)
values('bbbb', '1111', '고구마', '고구마조아', 'goguma@naver.com', '010-0000-2222', 'user');
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

