<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    <link rel="stylesheet" href="/css/adminUser.css" type="text/css"/>
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<style>
	header, footer {display:none}
	#adminUser_container {width:80vw; height:100vh}
</style>
<script>

</script>
 <div id="adminUser_container">
 	<h1 class="hidden">회원관리</h1>
 	<div id="adminUser_wrap">
 		<ul>
 			<li>총 회원 수 : <span>${user_num} 명</span></li>
 			
 		</ul>
 		<h3>회원 명단</h3>
 		<ul>
 		<li>아이디</li>
 		<li>이름</li>
 		<li>닉네임</li>
 		<li>이메일</li>
 		<li>전화번호</li>
 		<li>포인트</li>
 		<li>신고받은 횟수</li>
 		<li>가입일</li>
 		<!-- <li>총 게시물 수</li>
 		<li>총 댓글 수</li> -->
 		<c:forEach var="vo" items="${userList}">
	 		<li>${vo.user_id}</li>
	 		<li>${vo.user_name}</li>
	 		<li>${vo.user_nickname}</li>
	 		<li>${vo.email}</li>
	 		<li>${vo.tel}</li>
	 		<li>${vo.exp}</li>
	 		<li>${vo.report_hit}</li>
	 		<li>${vo.register_date}</li>
 		</c:forEach>

 		</ul>
 	</div>
 </div>
