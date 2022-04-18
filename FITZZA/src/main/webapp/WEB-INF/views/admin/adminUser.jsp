<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    <link rel="stylesheet" href="/css/adminUser.css" type="text/css"/>
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<style>
	header, footer {display:none}
</style>
<script>
/*토글 메뉴*/
$(document).ready(function(){
	$('#left_member_btn').addClass('button_normal');
	$('#user_leave').addClass('user_leave');
	$('#left_member_btn').click( function() {
		if($(this).hasClass('button_normal')) {
	        $(this).removeClass('button_normal').addClass('button_toggled');
	        $('#user_leave').removeClass('user_leave').addClass('leave_user_show');
	    } else {
	        $(this).removeClass('button_toggled').addClass('button_normal');
	        $('#user_leave').removeClass('leave_user_show').addClass('user_leave');
	    }
      } );
});
</script>
<script>
function adminMemberInsert(href, w, h) {
	var xPos = (window.screen.width/2) - (600/2); // 가운데 정렬
	xPos += window.screenLeft; // 듀얼 모니터일 때
	var yPos = (window.screen.height/2) - (500/2);

	window.open("/admin/adminMemberInsert", "회원 생성", "width="+600+", height="+300+", left="+xPos+", top="+yPos+", menubar=yes, status=yes, titlebar=yes, resizable=yes");
}

</script>
 <div id="adminUser_container">
 	<h1 class="hidden">회원관리</h1>
 	<div id="adminUser_wrap">
 		<h3>회원 관리</h3>
	 	<!-- 남은일: 회원 클릭 시 창 띄우기(게시물,댓글확인(마이페이지가져오기)) -->
	 	<ul class="member_status">
 			<li>총 회원 수&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : 
 				<span>${user_num} 명</span>
 			</li>
 			<li>탈퇴한 회원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : 
 				<span>${user_leave_num}명</span>
 				<button id="left_member_btn">명단보기</button>
 			</li>
 		</ul>
	 	<form method="get" action="" id="memberSearchFrm">
		 	<select name="memberSearchKey">
		    	<option value="title">아이디</option>
		   		<option value="content">이름</option>
		   		<option value="city">닉네임</option>
			</select>
			<input type="text" name="searchMember" id="searchMember"/>
		 	<input type="submit" value="검색" id="memberSearch"/>
	  	</form> 		
 		<div class="member_buttons">
 			<button onclick="adminMemberInsert()">+ 회원 생성</button>
 			<button>x 회원 삭제</button>
 			<button>x 회원 강퇴</button>
 		</div>
 		<div class="member_list_box">
	 		<ul class="member_title">
	 			<li>a</li>
	 			<li>아이디</li>
		 		<li>이름</li>
		 		<li>닉네임</li>
		 		<li>이메일</li>
		 		<li>전화번호</li>
		 		<li>등급</li>
		 		<li>신고</li>
		 		<li>가입일</li>
		 		<li>권한</li>
	 		</ul>
	 		<ul class="member_list">
	 			<c:forEach var="vo" items="${userList}">
	 				<li>
			 			<ul>		
			 				<li><input type="checkbox" name="adminMemberSelect"></li>
					 		<li><a href="/admin/adminUserBoard?user_id=${vo.user_id}">${vo.user_id}</a></li>
					 		<li>${vo.user_name}</li>
					 		<li>${vo.user_nickname}</li>
					 		<li>${vo.email}</li>
					 		<li>${vo.tel}</li>
					 		<li>level ${vo.grade}</li>
		 					<li>${vo.report_hit}</li>
		 					<li>${vo.register_date}</li>
		 					<li>${vo.permission}</li>
					 	</ul>
					 </li>
				</c:forEach>
	 		</ul>
 		</div>
 		<div id="user_leave">
		 		<h4>탈퇴한 회원 명단</h4>
		 		<ul>
		 			
		 			<li>아이디</li>
		 			<li>이메일</li>
		 			<li>분류</li>
		 			
		 			<c:forEach var="vo" items="${leaveList}">
		 			<li>${vo.user_id}</li>
		 			<li>${vo.email}</li>
		 			<li>
		 				<c:choose>
							<c:when test="${vo.leave_forced eq 'Y'}">강제탈퇴</c:when>
							<c:when test="${vo.leave_forced eq 'N'}">자진탈퇴</c:when>
						</c:choose>
					</li>
		 			</c:forEach>
		 		</ul>
	 		</div>
 	</div>
 </div>
