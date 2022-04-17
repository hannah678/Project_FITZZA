<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    <link rel="stylesheet" href="/css/adminUser.css" type="text/css"/>
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<style>
	header, footer {display:none}
	#user_all,#user_leaved{left:0;position:absolute;}
	#user_all li{float:left; width:10%;}
	
	#user_leaved li{float:left; width:33.33%;}
	#memberSearchFrm {
	   float:right;
	   margin:30px 50px 0 0
	}
</style>
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
	 	<!-- 남은일: 회원 클릭 시 모달창 띄우기(게시물,댓글확인(마이페이지가져오기)/ 블랙리스트 추가하기(DB??)button/ 강제탈퇴button/ 관리자 지정button) -->
	 	<ul class="member_status">
 			<li>총 회원 수&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : 
 				<span>${user_num} 명</span>
 			</li>
 			<li>강제탈퇴 된 회원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : 
 				<span>${user_leave_num}명</span>
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
					 		<li>${vo.user_id}</li>
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
	 		<h3>탈퇴한 회원 명단</h3>
	 		<ul id="user_leaved" style="bottom:100px;position:absolute;width:100%;"><!-- 데이터 테스트용 임시style -->
	 			
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
