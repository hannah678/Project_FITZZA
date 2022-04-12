<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<link rel="stylesheet" href="/css/mypage.css" type="text/css"/>
<script>
	window.onload=function(){
		var exp = ${vo.exp};
		var x = document.getElementById("user_grade");
		var y = document.getElementById("level_frame");
		
		x.innerText="level "+ ${vo.grade};
		y.src="${vo.frame_img}";
	}
</script>
<input type="hidden" name="user_id" value="${vo.user_id}"/>
<div id="mypage_wrap">
	<ul id="profile">
		<li>
			<img src="${vo.profile_image}" alt="프로필 이미지">
			<img id="level_frame" alt="등급 프레임 이미지">
			<p><a href="">프로필 이미지<br/>바꾸기</a></p>
		</li>
		<li class="userid">${vo.user_nickname} (${vo.user_id})</li>
		<li class="grade">
			<span id="user_grade"></span>
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
				<li>${vo.exp}</li>
			</ul>
			<ul>
				<li>받은 추천</li>
				<li>xxx</li>
			</ul>
			<ul>
				<li>신고 누적</li>
				<li>${vo.report_hit}</li>
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
					<!-- 게시물 리스트-->
        			<c:forEach var="vo1" items="${lst1}">
						<a href="/board/todayCodi/todayCodiView?board_num=${vo1.board_num}">
							<li>${vo1.title}</li>
							<li>${vo1.content}</li>
							<li>${vo1.hit}</li>
							<li>${vo1.write_date}</li>
						</a>
					</c:forEach>
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
					<!-- 게시물 리스트-->
        			<c:forEach var="vo2" items="${lst2}">
						<li><a href="/board/recommend/recommendView?board_num=${vo2.board_num}">
							${vo2.title}</a></li>
							<li>${vo2.content}</li>
							<li>${vo2.hit}</li>
							<li>${vo2.write_date}</li>
						
					</c:forEach>
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
					<!-- 게시물 리스트-->
        			<c:forEach var="vo3" items="${lst3}">
						<li><a href="/board/old/oldView?board_num=${vo3.board_num}">
							${vo3.title}</a></li>
							<li>${vo3.content}</li>
							<li>${vo3.hit}</li>
							<li>${vo3.write_date}</li>
						
					</c:forEach>
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
					<!-- 게시물 리스트-->
        			<c:forEach var="vo4" items="${lst4}">
						<a href="/board/review/reviewView?board_num=${vo4.board_num}">
							<li>${vo4.title}</li>
							<li>${vo4.content}</li>
							<li>${vo4.hit}</li>
							<li>${vo4.write_date}</li>
						</a>
					</c:forEach>
				</ul>
			</div>
		</li>
		<li>
			<input type="radio" name="tab" id="tab5">
			<label for="tab5">QnA</label>
			<div>
				<ul class="my_list_title">
					<li>게시물 제목</li>
					<li>내용</li>
					<li>조회수</li>
					<li>작성날짜</li>
				</ul>
				<ul class="my_list_contents">
					<!-- 게시물 리스트-->
        			<c:forEach var="vo5" items="${lst5}">
						<a href="/board/qna/qnaView?board_num=${vo5.board_num}">
							<li>${vo5.title}</li>
							<li>${vo5.content}</li>
							<li>${vo5.hit}</li>
							<li>${vo5.write_date}</li>
						</a>
					</c:forEach>
				</ul>
			</div>
		</li>
		<li>
			<input type="radio" name="tab" id="tab6">
			<label for="tab6">오늘 뭐입지?</label>
			<div>
				<ul class="my_list_title">
					<li>게시물 제목</li>
					<li>내용</li>
					<li>조회수</li>
					<li>작성날짜</li>
				</ul>
				<ul class="my_list_contents">
					<!-- 게시물 리스트-->
        			<c:forEach var="vo6" items="${lst6}">
						<a href="/board/vote/oldView?board_num=${vo6.board_num}">
							<li>${vo6.title}</li>
							<li>${vo6.content}</li>
							<li>${vo6.hit}</li>
							<li>${vo6.write_date}</li>
						</a>
					</c:forEach>
				</ul>
			</div>
		</li>
		<li>
			<input type="radio" name="tab" id="tab7">
			<label for="tab7">옷입히기</label>
			<div>
				
			</div>
		</li>
		<li>
			<input type="radio" name="tab" id="tab8">
			<label for="tab8">댓글</label>
			<div>
				<ul class="my_list_title">
					<li>게시물 타입</li>
					<li>내용</li>
					<li>작성날짜</li>
				</ul>
				<ul class="my_list_contents">
					<a href="">
						<li>게시물 타입</li>
						<li>내용</li>
						<li>작성날짜</li>
					</a>
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