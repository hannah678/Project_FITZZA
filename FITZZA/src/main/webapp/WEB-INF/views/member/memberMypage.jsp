<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="/css/mypage.css" type="text/css"/>

<div id="mypage_wrap">
	<ul id="profile">
		<li>
			<img src="/img/이미지 없음.png" alt="프로필 이미지">
			<p><a href="">프로필 이미지<br/>바꾸기</a></p>
		</li>
		<li class="userid">userid</li>
		<li class="grade">
			<span>level 1</span>
			<p id="grade_menual">
				<br/>
				&nbsp;&nbsp;&nbsp; level 1 : point 0 ~ 90<br/>
				&nbsp;&nbsp;&nbsp; level 2 : point 100 ~ 190<br/>
				&nbsp;&nbsp;&nbsp; level 3 : point 200 ~ 290<br/>
				&nbsp;&nbsp;&nbsp; level 4 : point 300 ~ 390<br/>
				&nbsp;&nbsp;&nbsp; level 5 : point 400 ~<br/>
				<br/>
				&nbsp;&nbsp;&nbsp; 게시물 1개 - 10 point<br/>
				&nbsp;&nbsp;&nbsp; 댓글 1개 - 3 point
			</p>
		</li>
		<li id="my_count">
			<ul>
				<li>내 포인트</li>
				<li>0</li>
			</ul>
			<ul>
				<li>받은 추천</li>
				<li>0</li>
			</ul>
			<ul>
				<li>신고 누적</li>
				<li>0</li>
			</ul>
		</li>
		<li><button><a href="/member/pwdCheck">회원정보수정</a></button></li>
		<li><button><a href="/member/byeCheck">회원탈퇴</a></button></li>
	</ul>
	<ul id="my_list">
		<li>
			<input type="radio" name="tab" id="tab1" checked>
			<label for="tab1">오늘의 코디</label>
			<div>
				<ul class="my_list_title">
					<li>게시물 제목</li>
					<li>내용</li>
					<li>조회수</li>
					<li>작성날짜</li>
				</ul>
				<ul class="my_list_contents">
					<li>게시물 제목</li>
					<li>내용</li>
					<li>조회수</li>
					<li>작성날짜</li>
				</ul>
			</div>
		</li>
		<li>
			<input type="radio" name="tab" id="tab2">
			<label for="tab2">스타일 추천</label>
			<div>
				<ul class="my_list_title">
					<li>게시물 제목</li>
					<li>내용</li>
					<li>조회수</li>
					<li>작성날짜</li>
				</ul>
				<ul class="my_list_contents">
					<li>게시물 제목</li>
					<li>내용</li>
					<li>조회수</li>
					<li>작성날짜</li>
				</ul>
			</div>
		</li>
		<li>
			<input type="radio" name="tab" id="tab3">
			<label for="tab3">중고거래</label>
			<div>
				<ul class="my_list_title">
					<li>게시물 제목</li>
					<li>내용</li>
					<li>조회수</li>
					<li>작성날짜</li>
				</ul>
				<ul class="my_list_contents">
					<li>게시물 제목</li>
					<li>내용</li>
					<li>조회수</li>
					<li>작성날짜</li>
				</ul>
			</div>
		</li>
		<li>
			<input type="radio" name="tab" id="tab4">
			<label for="tab4">구매후기</label>
			<div>
				<ul class="my_list_title">
					<li>게시물 제목</li>
					<li>내용</li>
					<li>조회수</li>
					<li>작성날짜</li>
				</ul>
				<ul class="my_list_contents">
					<li>게시물 제목</li>
					<li>내용</li>
					<li>조회수</li>
					<li>작성날짜</li>
				</ul>
			</div>
		</li>
		<li>
			<input type="radio" name="tab" id="tab5">
			<label for="tab5">QnA</label>
			<div>
				<ul class="my_list_title">
					<li>게시물 타입...?</li>
					<li>게시물 제목</li>
					<li>내용</li>
					<li>조회수</li>
					<li>작성날짜</li>
				</ul>
				<ul class="my_list_contents">
					<li>게시물 제목</li>
					<li>내용</li>
					<li>조회수</li>
					<li>작성날짜</li>
				</ul>
			</div>
		</li>
		<li>
			<input type="radio" name="tab" id="tab6">
			<label for="tab6">오늘 뭐입지?</label>
			<div>
				<ul class="my_list_title">
					<li>게시물 타입</li>
					<li>게시물 제목</li>
					<li>내용</li>
					<li>조회수</li>
					<li>작성날짜</li>
				</ul>
				<ul class="my_list_contents">
					<li>게시물 타입</li>
					<li>게시물 제목</li>
					<li>내용</li>
					<li>조회수</li>
					<li>작성날짜</li>
				</ul>
			</div>
		</li>
		<li>
			<input type="radio" name="tab" id="tab7">
			<label for="tab7">옷입히기</label>
			<div>
				<ul class="my_list_title">
					<li>게시물 타입</li>
					<li>게시물 제목</li>
					<li>내용</li>
					<li>조회수</li>
					<li>작성날짜</li>
				</ul>
				<ul class="my_list_contents">
					<li>게시물 타입</li>
					<li>게시물 제목</li>
					<li>내용</li>
					<li>조회수</li>
					<li>작성날짜</li>
				</ul>
			</div>
		</li>
	</ul>
	<!-- 게시물 리스트 페이징 -->
    <ul class="paging">
      
            <!-- 삭제 -->
            <li><a href="">이전</a></li>
            <li style="background-color:#fff58c; border-radius:360px; font-weight:bold;">1</li>
            <li>2</li>
            <li>3</li>
            <li>4</li>
            <li>5</li>
            <li><a href="">다음</a></li>
            <!-- 삭제 -->

     </ul>
</div>