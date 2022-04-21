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
	 	<form method="get" action="/admin/adminOld/searchLists" id="oldSearchFrm">
		 	<select name="tradeSearchKey">
		    	<option value="title">제목</option>
		   		<option value="content">내용</option>
		   		<option value="user_id">아이디</option>
			</select>
			<input type="text" name="searchTrade" id="searchTrade"/>
		 	<input type="submit" value="검색" id="oldSearch"/>
	  	</form> 		
 		<div class="trade_buttons">
 			<button id="adminOldDel">게시글 삭제</button>
 		</div>
 		<form method="post" id="oldFrm">
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
	 			<li>
			 		<ul>
			 			<c:forEach var="vo" items="${adminOldList}">
				 			<li><input type="checkbox" name="adminOldSelect" value="${vo.board_num}"  class="oldchk"></li>
							<li class="oldboardlink"><input type="hidden" value="${vo.board_num}"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${vo.title }</li>
							<li class="oldboardlink"><input type="hidden" value="${vo.board_num}"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${vo.content}</li><li>${vo.user_id}</li>
							<li>${vo.write_date}</li>
							<c:if test="${vo.state_num eq 1 || vo.state_num eq 2}">
								<li>-</li>
							</c:if>
							<c:if test="${vo.state_num eq 3}">
								<li>${vo.trade_date}</li>
							</c:if>
							<li>
								${vo.state_name }
							</li>
							</ul></li>
						</c:forEach>
		 			</ul>
				</li>
	 		</ul>
 		</div>
 		</form>
 	</div>
 </div>
 
 <script>
 $(".oldboardlink").click(function(){
		var board_num = $(this).children().first().val();
		var xPos = (window.screen.width/2) - (1300/2); // 가운데 정렬
		xPos += window.screenLeft; // 듀얼 모니터일 때
		var yPos = (window.screen.height/2) - (900/2);
		
		console.log(board_num);
		
		window.open("/board/old/oldView?board_num="+board_num, '중고 게시글 확인', "width="+1300+", height="+800+", left="+xPos+", top="+yPos+", menubar=yes, status=yes, titlebar=yes, resizable=yes");
		
	});
 
 $("#membersearchFrm").submit(function() {
	   if ($("#searchWord").val() == "") {
	      alert("검색어를 입력하세요");
	      return false;
	   }
	   
	});
 
 window.onload=function(){
		var startNumOld = 0
		var addListHtmlOld = "";
		var urlOld = '/admin/adminOld/searchLists';
		var paramOld;
		const paramsOld = new URL(window.location.href).searchParams;
		var keyOld = paramsOld.get('searchKey');
		var wordOld = paramsOld.get('searchWord');
		var pathnameOld = window.location.pathname;
		var pnOld = 'search'
		
		paramOld = {
			"startNum" : startNumOld ,
			"searchKey" : keyOld,
			"searchWord" : wordOld
		};
			console.log(startNumOld);
		}
 		$.ajax({
			url : urlOld,
			type : 'POST',
			dataType : 'json',
			data :paramOld,
			success : function(data){
				for (var i = 0; i < data.length; i++) {
						addListHtmlOld += "<li><ul>"
						addListHtmlOld += "<li><input type='checkbox' name='adminOldSelect' value='"+data[i].board_num+"'  class='oldchk'></li>"					
				 		addListHtmlOld += "<li><a href='/board/old/oldView?board_num='"+data[i].board_num+">"+data[i].title"</a></li>"
				 		addListHtmlOld += "<li><a href='/board/old/oldView?board_num='"+data[i].board_num+">"+data[i].content"</a></li>"
				 		addListHtmlOld += "<li>"+data[i].user_id+"</li>"
				 		addListHtmlOld += "<li>"+data[i].trade_date+"</li>"
				 		addListHtmlOld += "<li>"+data[i].state_name+"</li>"
				 		addListHtmlOld += "</ul></li>"
					}
					$(".trade_list").append(addListHtmlOld);
					/* console.log(addListHtml); */
				}
			});
 
 $(document).ready(function(){
	 $("#adminOldDel").click(function(){
		var cnt = 0;
		$(".oldchk").each(function(i, obj){
			if(obj.checked){
				cnt++;//checkbox가 체크 상태일 때...
			}
		});
	if(cnt<1){
		alert("삭제 할 게시물을 선택하세요.")
		return false;
	}else{
		var answer;
		var params = $("#oldFrm").serialize();
		answer= confirm("선택한 게시물을 삭제합니다. \n게시물은 복구 할 수 없습니다.");
		console.log(params);
		if(answer == true){
			$.ajax({
				url : '/admin/adminOldDel',
				type : 'post',
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
	 })
 </script>