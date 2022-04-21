<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    <link rel="stylesheet" href="/css/adminReport.css" type="text/css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<style>
	header, footer {display:none}
	#adminReport_container {display:none}
	#reportSearch {height:30px; font-size:16px}
	#reportSearchFrm select {height:30px; font-size:16px}
	#reportSearchFrm input {height:30px; font-size:16px}
	a:link {color:#222; text-decoration: none;}
	a:visited {color:#222 }
</style>
<!-- 카테고리 선택 js-->
 <script>
$(document).ready(function(){
	$('#todayCodi_box').addClass('report_box_show');
});	
</script>

 <div id="adminReport_container">
 	<h1 class="hidden">신고 관리</h1>
 	<div id="adminReport_wrap">
 		<h3>신고 관리</h3>
 		<ul class="ad_report_status">
 			<li>전체 신고&nbsp;&nbsp; : 
 				<span>${reportCount }건</span>
 			</li>
 			<li>미처리 신고&nbsp;&nbsp; : 
 				<span>${reportNoCount }건</span>
 			</li>
 			<li>처리된 신고&nbsp;&nbsp; : 
 				<span>${reportYesCount }건</span>
 			</li>
 		</ul>
 		<form method="get" action="" id="reportSearchFrm">
			<select name="ReportSearchKey">
		    	<option value="category">게시물 타입</option>
		        <option value="userid">아이디</option>
		        <option value="rep_status">처리상태</option>
		        <option value="blackList">회원분류</option>
		    </select>
		    <input type="text" name="searchReport" id="searchReport"/>
		    <input type="submit" value="검색" id="reportSearch"/>
	     </form>
 		
 		<div id="todayCodi_box" class="Report_box">
	 		<ul class="report_box_title">
	 			<li>신고분류</li>
	 			<li>신고내용</li>
	 			<li>게시판</li>
	 			<li>신고<br/>게시물 제목</li>
	 			<li>게시자<br/> 아이디</li>
		 		<li>신고자<br/>아이디</li>
		 		<li>신고일</li>
		 		<li>처리상태</li>
	 		</ul>
	 		<ul class="report_list">
	 			<c:forEach var="vo" items="${reportList}">
	 				<li><ul>
			 			<li class="repoName">${vo.category_name}</li>
			 			<li><input type="hidden" value="${vo.report_content}"/><input type="button" class="reportModalList" data-target="#reportModal" data-toggle="modal" value="상세"/></li>
			 			<li>${vo.type_name}</li>
			 			<li class="report_title"><input type="hidden" value="${vo.type_num}"/><input type="hidden" value="${vo.board_num}"/>${vo.title }</li>
				 		<li>${vo.reported_id }</li>
			 			<li>${vo.user_id }</li>			 		
				 		<li>${vo.report_time }</li>
				 		
				 		<c:if test="${vo.state !='Y'}">
				 			<li id="repo_state"><button class="report_off">처리확인</button><input type="hidden" name="${vo.report_num}" value="${vo.report_num}"></li>
				 		</c:if>
				 			<c:if test="${vo.state == 'Y'}">
				 		<li>처리 완료</li>
				 		</c:if>
			 		</ul></li>
		 		</c:forEach>
	 		</ul>
	 		
 		</div>
 		
 	</div>
 	
 </div>
 <script>
 $(".report_title").click(function(){
		var repo_type = $(this).children().first().val();
		var board_num = $(this).children().last().val();
		var xPos = (window.screen.width/2) - (1300/2); // 가운데 정렬
		xPos += window.screenLeft; // 듀얼 모니터일 때
		var yPos = (window.screen.height/2) - (900/2);
		var board_size = "width="+1300+", height="+800+", left="+xPos+", top="+yPos+", menubar=yes, status=yes, titlebar=yes, resizable=yes";
		console.log(repo_type);
		console.log(board_num);
		console.log(board_size);
		if(repo_type == 1){
			window.open("/board/todayCodi/todayCodiView?board_num="+board_num, '신고된 게시글 확인', board_size);
		}else if(repo_type == 2){
			window.open("/board/recommend/recommendView?board_num="+board_num, '신고된 게시글 확인', board_size);
		}else if(repo_type == 3){
			window.open("/board/old/oldView?board_num="+board_num, '신고된 게시글 확인', board_size);
		}else if(repo_type == 4){
			window.open("/board/review/reviewView?board_num="+board_num, '신고된 게시글 확인', board_size);
		}else if(repo_type == 5){
			window.open("/board/qna/qnaView?board_num="+board_num, '신고된 게시글 확인', board_size);
		}else if(repo_type == 6){
			window.open("/board/vote/voteCodiView?board_num="+board_num, '신고된 게시글 확인', board_size);
		}
	});
 $(".report_off").click(function(){
		var repo_num = $(this).next().val();
	 	var reportOffOk = confirm("신고 내용을 확인처리 하시겠습니까?");
		
		if(reportOffOk == true){
			$.ajax({
				url : "/admin/adminReportOff",
				type : "get",
				data : {"report_num" : repo_num},
				dataType : "json",
				success : function(result){
					alert('신고 처리가 완료되었습니다.');
					$("#repo_state").text('처리 완료');
				}
			})
		}
		
	});
 $(".reportModalList").click(function(){
	 var Rtype = $(this).parent().prev().text();
	 var Rcontent = $(this).prev().val();
	 $("#report_type").text("분류: "+Rtype);
	 $("#report_content").text(Rcontent);
 });
 </script>
 