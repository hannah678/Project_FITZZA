<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    <link rel="stylesheet" href="/css/adminOld.css" type="text/css"/>
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<style>
	header, footer {display:none}
	#adminOld_container {display:none}
	#tradeSearch {height:30px; font-size:16px}
	#tradeSearchFrm select {height:30px; font-size:16px}
	#tradeSearchFrm input {height:30px; font-size:16px}
	a:link {color:#222; text-decoration: none;}
	a:visited {color:#222 }	
</style>
 <div id="adminOld_container">
 	<h1 class="hidden">회원관리</h1>
 	<div id="adminOld_wrap">
 		<h3>중고거래 관리</h3>
	 	<ul class="trade_total_status">
 			<li>총 게시물 수&nbsp;&nbsp;&nbsp;&nbsp; : 
 				<span>${allOldList } 개</span>
 			</li>
 			<li>판매중&nbsp;&nbsp;&nbsp;&nbsp; : 
 				<span>${saleOldList } 개</span>
 			</li>
 			<li>예약중&nbsp;&nbsp;&nbsp;&nbsp; : 
 				<span>${reserveOldList } 개</span>
 			</li>
 			<li>거래완료&nbsp;&nbsp;&nbsp;&nbsp; : 
 				<span>${completeOldList } 개</span>
 			</li>
 		</ul>
	 	<form method="get" action="" id="tradeSearchFrm">
		 	<select name="tradeSearchKey">
		    	<option value="board_title">제목</option>
		   		<option value="status">상태</option>
		   		<option value="userid">아이디</option>
			</select>
			<input type="text" name="searchTrade" id="searchTrade"/>
		 	<input type="submit" value="검색" id="tradeSearch"/>
	  	</form> 		
 		<div class="trade_buttons">
 			<button>게시글 삭제</button>
 		</div>
 		<div class="trade_list_box">
	 		<ul class="trade_title">
	 			<li>a</li>
	 			<li>제목</li>
	 			<li>내용</li>
		 		<li>작성자(id)</li>
		 		<li>작성일</li>
		 		<li>거래 완료일</li>
		 		<li>상태</li>
	 		</ul>
	 		<ul class="trade_list">
	 			<c:forEach var="vo" items="${adminOldList}">
					<li><ul>
						<li><input type="checkbox" name="adminTradeSelect"></li>
						<li><a href="/board/old/oldView?board_num=${vo.board_num}">${vo.title }</a></li>
						<li><a href="/board/old/oldView?board_num=${vo.board_num}">${vo.content}</a></li>
						<li>${vo.user_id}</li>
						<li>${vo.write_date}</li>
						<li>${vo.trade_date}</li>
						<li>${vo.state_name }</li>
					</li></ul>
				</c:forEach>
		 	</ul>
 		</div>
 	</div>
 </div>