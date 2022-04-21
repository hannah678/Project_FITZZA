<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    <link rel="stylesheet" href="/css/adminUser.css" type="text/css"/>
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<style>
	header, footer {display:none}
	#memberSearch {height:30px; font-size:16px}
	#memberSearchFrm select {height:30px; font-size:16px}
	#memberSearchFrm input {height:30px;  font-size:16px}
	#left_member_btn {margin-top:40px}
	button {font-size:14px !important}
	#adminUser_wrap {
	position:relative; z-index:2;
}
</style>
<script>
$("#membersearchFrm").submit(function() {
   if ($("#searchWord").val() == "") {
      alert("검색어를 입력하세요");
      return false;
   }
   
});
	
window.onload=function(){
		var startNum = $(".member_list li").length/11; // oldlist안에 li태그의 길이
		var addListHtml = "";
		 console.log(startNum); 
		var url;
		var param;
		const params = new URL(window.location.href).searchParams;
		var key = params.get('searchKey');
		var word = params.get('searchWord');
		var pathname = window.location.pathname;
		var pn = pathname.substring(pathname.lastIndexOf('/')+1);
		console.log(pn);
		if(pn=='adminHome'){
			url = '/admin/member/memberLists';
			param = {
				"startNum" : startNum 
			};
		}else if(pn='search'){
			url = '/admin/member/searchLists';
			param = {
				"startNum" : startNum ,
				"searchKey" : key,
				"searchWord" : word
			};
			console.log(startNum);
		}
		$.ajax({
			url : url,
			type : 'POST',
			dataType : 'json',
			data :param,
			success : function(data){
				for (var i = 0; i < data.length; i++) {
					addListHtml += "<li><ul>"					
			 		addListHtml += "<li><input type='checkbox' name='ChkList' value='"+data[i].email+"' class='chk'></li>"
			 		addListHtml += "<li onclick=\'UserBoard(\""+data[i].user_id+"\")\'>"+data[i].user_id+"</li>"
			 		addListHtml += "<li onclick=\'UserBoard(\""+data[i].user_id+"\")\'>"+data[i].user_name+"</li>"
			 		addListHtml += "<li onclick=\'UserBoard(\""+data[i].user_id+"\")\'>"+data[i].user_nickname+"</li>"
			 		addListHtml += "<li onclick=\'UserBoard(\""+data[i].user_id+"\")\'>"+data[i].email+"</li>"
			 		addListHtml += "<li onclick=\'UserBoard(\""+data[i].user_id+"\")\'>"+data[i].tel+"</li>"
			 		addListHtml += "<li onclick=\'UserBoard(\""+data[i].user_id+"\")\'>level "+data[i].grade+"</li>"
			 		addListHtml += "<li onclick=\'UserBoard(\""+data[i].user_id+"\")\'>"+data[i].report_hit+"</li>"
			 		addListHtml += "<li onclick=\'UserBoard(\""+data[i].user_id+"\")\'>"+data[i].register_date+"</li>"
			 		addListHtml += "<li onclick=\'UserBoard(\""+data[i].user_id+"\")\'>"+data[i].permission+"</li>"
			 		addListHtml += "</ul></li>"
				}
				if(data.length<20){
					$("#moreViewMember01").remove();
				} 
				$(".member_list").append(addListHtml);
				/* console.log(addListHtml); */
			}
		});
}
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
	
	//강제탈퇴
	$("#multiDel").click(function(){
		var cnt = 0;
		$(".chk").each(function(i, obj){
			if(obj.checked){
				cnt++;//checkbox가 체크 상태일 때...
			}
		});
		if(cnt<1){
			alert("탈퇴시킬 회원을 선택하세요.")
			return false;
		}else{
			var answer;
			answer= confirm("탈퇴처리된 회원은 복구할 수 없습니다. \n탈퇴 처리하시겠습니까?");
			if(answer == true){
				var params = $("#DelFrm").serialize();
				
				$.ajax({
					url : '/admin/multiDel',
					type : 'POST',
					dataType : 'text',
					data :params,
					success : function(data){
						alert(data);
						location.reload();
					}
				});
			}
		}
	});
	
	//관리자 권한 부여
	$("#multiAdmin").click(function(){
		var cnt = 0;
		$(".chk").each(function(i, obj){
			if(obj.checked){
				cnt++;//checkbox가 체크 상태일 때...
			}
		});
		if(cnt<1){
			alert("권한을 부여할 회원을 선택하세요.")
			return false;
		}else{
			var answer;
			answer= confirm("선택된 회원에게 관리자 권한을 부여하시겠습니까?");
			if(answer == true){
				var params = $("#DelFrm").serialize();
				
				$.ajax({
					url : '/admin/multiAdmin',
					type : 'POST',
					dataType : 'json',
					data :params,
					success : function(data){
						alert("관리자 권한이 부여되었습니다.");
						location.reload();
					}
				});
			}
		}
	});
	
	$('#moreViewMember01').click(function(){
		
		var startNum = $(".member_list li").length/11; // oldlist안에 li태그의 길이
		var addListHtml = "";
		 console.log(startNum); 
		var url;
		var param;
		const params = new URL(window.location.href).searchParams;
		var key = params.get('searchKey');
		var word = params.get('searchWord');
		var pathname = window.location.pathname;
		var pn = pathname.substring(pathname.lastIndexOf('/')+1);
		console.log(pn);
		if(pn=='adminHome'){
			url = '/admin/member/memberLists';
			param = {
				"startNum" : startNum 
			};
		}else if(pn='search'){
			url = '/admin/member/searchLists';
			param = {
				"startNum" : startNum ,
				"searchKey" : key,
				"searchWord" : word
			};
			console.log(startNum);
		}
		$.ajax({
			url : url,
			type : 'POST',
			dataType : 'json',
			data :param,
			success : function(data){
				for (var i = 0; i < data.length; i++) {
					addListHtml += "<li><ul>"					
				 	addListHtml += "<li><input type='checkbox' name='ChkList' value='"+data[i].email+"' class='chk'></li>"
				 	addListHtml += "<li onclick=\'UserBoard(\""+data[i].user_id+"\")\'>"+data[i].user_id+"</li>"
				 	addListHtml += "<li onclick=\'UserBoard(\""+data[i].user_id+"\")\'>"+data[i].user_name+"</li>"
				 	addListHtml += "<li onclick=\'UserBoard(\""+data[i].user_id+"\")\'>"+data[i].user_nickname+"</li>"
				 	addListHtml += "<li onclick=\'UserBoard(\""+data[i].user_id+"\")\'>"+data[i].email+"</li>"
				 	addListHtml += "<li onclick=\'UserBoard(\""+data[i].user_id+"\")\'>"+data[i].tel+"</li>"
				 	addListHtml += "<li onclick=\'UserBoard(\""+data[i].user_id+"\")\'>level "+data[i].grade+"</li>"
				 	addListHtml += "<li onclick=\'UserBoard(\""+data[i].user_id+"\")\'>"+data[i].report_hit+"</li>"
				 	addListHtml += "<li onclick=\'UserBoard(\""+data[i].user_id+"\")\'>"+data[i].register_date+"</li>"
				 	addListHtml += "<li onclick=\'UserBoard(\""+data[i].user_id+"\")\'>"+data[i].permission+"</li>"
				 	addListHtml += "</ul></li>"
				}
				if(data.length<20){
					$("#moreViewMember01").remove();
				} 
				$(".member_list").append(addListHtml);
				/* console.log(addListHtml); */
			}
		});
	});
});

function adminMemberInsert(href, w, h) {
	var xPos = (window.screen.width/2) - (600/2); // 가운데 정렬
	xPos += window.screenLeft; // 듀얼 모니터일 때
	var yPos = (window.screen.height/2) - (500/2);

	window.open("/admin/adminMemberInsert", "회원 생성", "width="+600+", height="+300+", left="+xPos+", top="+yPos+", menubar=yes, status=yes, titlebar=yes, resizable=yes");
}
function UserBoard(user_id) {
	console.log("userboard!");
	var xPos = (window.screen.width/2) - (1300/2); // 가운데 정렬
	xPos += window.screenLeft; // 듀얼 모니터일 때
	var yPos = (window.screen.height/2) - (900/2);

	window.open("/member/myPage?user_id="+user_id, "회원 페이지", "width="+1300+", height="+800+", left="+xPos+", top="+yPos+", menubar=yes, status=yes, titlebar=yes, resizable=yes");
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
 		
	 	<form method="get" action="/admin/member/search" id="memberSearchFrm">
		 	<select name="searchKey">
		    	<option value="user_id">아이디</option>
		   		<option value="user_name">이름</option>
		   		<option value="user_nickname">닉네임</option>
			</select>
			<input type="text" name="searchWord" id="searchMember"/>
		 	<input type="submit" value="검색" id="memberSearch"/>
	  	</form> 		
 		<div class="member_buttons">
 			<button onclick="adminMemberInsert()">+ 회원 생성</button>
 			<button id="multiAdmin">+ 관리자 권한 부여</button>
 			<button id="multiDel">x 회원 강퇴</button>
 		</div>		
 		<form method="post" id="DelFrm">
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
		 		<ul class="member_list"><!-- 멤버 리스트 출력 -->
		 		</ul>
		 		<a id="moreViewMember01"><img src="/img/더보기.png" style="width:100px;"></a>
	 		</div>
	 	</form>
 		<div id="user_leave">
		 		<h4>탈퇴한 회원 명단</h4>
		 	<ul class="user_left_title">
		 		<li>이메일</li>
		 		<li>분류</li>
		 	</ul>
		 	<ul class="user_left_list">	
		 		<c:forEach var="vo" items="${leaveList}">
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