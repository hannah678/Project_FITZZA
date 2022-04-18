<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    <link rel="stylesheet" href="/css/adminBoard.css" type="text/css"/>
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<style>
	header, footer {display:none}
	#adminBoard_container {display:none}
</style>
<!-- 카테고리 선택 js-->
 <script>
$(document).ready(function(){
	$('#b_tc_btn').addClass('button_toggled');
	$('#b_rec_btn').addClass('button_normal');
	$('#b_oldb_btn').addClass('button_normal');
	$('#b_rev_btn').addClass('button_normal');
	$('#b_qna_btn').addClass('button_normal');
	$('#b_vote_btn').addClass('button_normal');
	$('#b_todayCodi_box').addClass('report_box_show');
	$('#b_recommend_box').addClass('report_box_hide');
	$('#b_oldBoard_box').addClass('report_box_hide');
	$('#b_review_box').addClass('report_box_hide');
	$('#b_qna_box').addClass('report_box_hide');
	$('#b_vote_box').addClass('report_box_hide');
		$('#b_tc_btn').click( function() {
			$(this).removeClass('button_normal').addClass('button_toggled');
			$('#b_rec_btn').removeClass('button_toggled').addClass('button_normal');
			$('#b_oldb_btn').removeClass('button_toggled').addClass('button_normal');
			$('#b_rev_btn').removeClass('button_toggled').addClass('button_normal');
			$('#b_qna_btn').removeClass('button_toggled').addClass('button_normal');
			$('#b_vote_btn').removeClass('button_toggled').addClass('button_normal');
		    $('#b_todayCodi_box').removeClass('report_box_hide').addClass('report_box_show');
		    $('#b_recommend_box').removeClass('report_box_show').addClass('report_box_hide');
		    $('#b_oldBoard_box').removeClass('report_box_show').addClass('report_box_hide');
		    $('#b_review_box').removeClass('report_box_show').addClass('report_box_hide');
		    $('#b_qna_box').removeClass('report_box_show').addClass('report_box_hide');
		    $('#b_vote_box').removeClass('report_box_show').addClass('report_box_hide');
		});
		$('#b_rec_btn').click( function() {
			$(this).removeClass('button_normal').addClass('button_toggled');
			$('#b_tc_btn').removeClass('button_toggled').addClass('button_normal');
			$('#b_oldb_btn').removeClass('button_toggled').addClass('button_normal');
			$('#b_rev_btn').removeClass('button_toggled').addClass('button_normal');
			$('#b_qna_btn').removeClass('button_toggled').addClass('button_normal');
			$('#b_vote_btn').removeClass('button_toggled').addClass('button_normal');
		    $('#b_todayCodi_box').removeClass('report_box_show').addClass('report_box_hide');
		    $('#b_recommend_box').removeClass('report_box_hide').addClass('report_box_show');
		    $('#b_oldBoard_box').removeClass('report_box_show').addClass('report_box_hide');
		    $('#b_review_box').removeClass('report_box_show').addClass('report_box_hide');
		    $('#b_qna_box').removeClass('report_box_show').addClass('report_box_hide');
		    $('#b_vote_box').removeClass('report_box_show').addClass('report_box_hide');
		});
		$('#b_oldb_btn').click( function() {
			$(this).removeClass('button_normal').addClass('button_toggled');
			$('#b_tc_btn').removeClass('button_toggled').addClass('button_normal');
			$('#b_rec_btn').removeClass('button_toggled').addClass('button_normal');
			$('#b_rev_btn').removeClass('button_toggled').addClass('button_normal');
			$('#b_qna_btn').removeClass('button_toggled').addClass('button_normal');
			$('#b_vote_btn').removeClass('button_toggled').addClass('button_normal');
		    $('#b_todayCodi_box').removeClass('report_box_show').addClass('report_box_hide');
		    $('#b_recommend_box').removeClass('report_box_show').addClass('report_box_hide');
		    $('#b_oldBoard_box').removeClass('report_box_hide').addClass('report_box_show');
		    $('#b_review_box').removeClass('report_box_show').addClass('report_box_hide');
		    $('#b_qna_box').removeClass('report_box_show').addClass('report_box_hide');
		    $('#b_vote_box').removeClass('report_box_show').addClass('report_box_hide');
		});
		$('#b_rev_btn').click( function() {
			$(this).removeClass('button_normal').addClass('button_toggled');
			$('#b_tc_btn').removeClass('button_toggled').addClass('button_normal');
			$('#b_rec_btn').removeClass('button_toggled').addClass('button_normal');
			$('#b_oldb_btn').removeClass('button_toggled').addClass('button_normal');
			$('#b_qna_btn').removeClass('button_toggled').addClass('button_normal');
			$('#b_vote_btn').removeClass('button_toggled').addClass('button_normal');
		    $('#b_todayCodi_box').removeClass('report_box_show').addClass('report_box_hide');
		    $('#b_recommend_box').removeClass('report_box_show').addClass('report_box_hide');
		    $('#b_oldBoard_box').removeClass('report_box_show').addClass('report_box_hide');
		    $('#b_review_box').removeClass('report_box_hide').addClass('report_box_show');
		    $('#b_qna_box').removeClass('report_box_show').addClass('report_box_hide');
		    $('#b_vote_box').removeClass('report_box_show').addClass('report_box_hide');
		});
		$('#b_qna_btn').click( function() {
			$(this).removeClass('button_normal').addClass('button_toggled');
			$('#b_tc_btn').removeClass('button_toggled').addClass('button_normal');
			$('#b_rec_btn').removeClass('button_toggled').addClass('button_normal');
			$('#b_oldb_btn').removeClass('button_toggled').addClass('button_normal');
			$('#b_rev_btn').removeClass('button_toggled').addClass('button_normal');
			$('#b_vote_btn').removeClass('button_toggled').addClass('button_normal');
		    $('#b_todayCodi_box').removeClass('report_box_show').addClass('report_box_hide');
		    $('#b_recommend_box').removeClass('report_box_show').addClass('report_box_hide');
		    $('#b_oldBoard_box').removeClass('report_box_show').addClass('report_box_hide');
		    $('#b_review_box').removeClass('report_box_show').addClass('report_box_hide');
		    $('#b_qna_box').removeClass('report_box_hide').addClass('report_box_show');
		    $('#b_vote_box').removeClass('report_box_show').addClass('report_box_hide');
		});
		$('#b_vote_btn').click( function() {
			$(this).removeClass('button_normal').addClass('button_toggled');
			$('#b_tc_btn').removeClass('button_toggled').addClass('button_normal');
			$('#b_rec_btn').removeClass('button_toggled').addClass('button_normal');
			$('#b_oldb_btn').removeClass('button_toggled').addClass('button_normal');
			$('#b_rev_btn').removeClass('button_toggled').addClass('button_normal');
			$('#b_qna_btn').removeClass('button_toggled').addClass('button_normal');
		    $('#b_todayCodi_box').removeClass('report_box_show').addClass('report_box_hide');
		    $('#b_recommend_box').removeClass('report_box_show').addClass('report_box_hide');
		    $('#b_oldBoard_box').removeClass('report_box_show').addClass('report_box_hide');
		    $('#b_review_box').removeClass('report_box_show').addClass('report_box_hide');
		    $('#b_qna_box').removeClass('report_box_show').addClass('report_box_hide');
		    $('#b_vote_box').removeClass('report_box_hide').addClass('report_box_show');
		});
	
});
</script>
<script>
	function adminBoardReply(href, w, h) {
		var xPos = (window.screen.width/2) - (600/2); // 가운데 정렬
		xPos += window.screenLeft; // 듀얼 모니터일 때
		var yPos = (window.screen.height/2) - (500/2);
	
		window.open("/admin/adminBoardReply", "댓글보기", "width="+600+", height="+300+", left="+xPos+", top="+yPos+", menubar=yes, status=yes, titlebar=yes, resizable=yes");
	}
</script>
 <div id="adminBoard_container">
 	<h1 class="hidden">게시글/댓글 관리</h1>
 	<div id="adminBoard_wrap">
 		<h3>게시글/댓글 관리</h3>
 		<ul class="board_status">
 			<li>오늘의 코디&nbsp;&nbsp; : 
 				<span>xxx개</span>
 			</li>
 			<li>스타일 추천&nbsp;&nbsp; : 
 				<span>xxx개</span>
 			</li>
 			<li>중고거래&nbsp;&nbsp; : 
 				<span>xxx개</span>
 			</li>
 			<li>구매후기&nbsp;&nbsp; : 
 				<span>xxx개</span>
 			</li>
 			<li>QnA&nbsp;&nbsp; : 
 				<span>xxx개</span>
 			</li>
 			<li>오늘 뭐 입지?&nbsp;&nbsp; : 
 				<span>xxx개</span>
 			</li>
 		</ul>
 		<form method="get" action="" id="boardSearchFrm">
			<select name="BoardSearchKey">
		    	<option value="category">게시물 타입</option>
		        <option value="userid">아이디</option>
		        <option value="city">지역</option>
		    </select>
		    <input type="text" name="searchBoard" id="searchBoard"/>
		    <input type="submit" value="검색" id="boardSearch"/>
	     </form>
 		<div class="board_buttons">
 			<button id="b_tc_btn">오늘의 코디</button>
 			<button id="b_rec_btn">스타일 추천</button>
 			<button id="b_oldb_btn">중고거래</button>
 			<button id="b_rev_btn">구매후기</button>
 			<button id="b_qna_btn">QnA</button>
 			<button id="b_vote_btn">오늘 뭐 입지?</button>
 		</div>
 		<div id="b_todayCodi_box" class="board_box">
	 		<ul class="board_box_title">
	 			<li>No.</li>
		 		<li>제목</li>
		 		<li>내용</li>
		 		<li>작성자(id)</li>
		 		<li>등급</li>
		 		<li>댓글 수</li>
		 		<li>신고 수</li>
		 		<li>작성일</li>
		 		<li>삭제</li>
	 		</ul>
	 		<ul class="board_list">
	 			<li>1</li>
		 		<li>111</li>
		 		<li>contentssssssssss</li>
		 		<li>userid</li>
		 		<li>1</li>
		 		<li><a href="javascript:;" onclick="adminBoardReply()">3</a></li>
		 		<li>0</li>
		 		<li>2022-04-18</li>
		 		<li><button>삭제</button></li>
	 		</ul>
 		</div>
 		<div id="b_recommend_box" class="board_box">
	 		<ul class="board_box_title">
	 			<li>No.</li>
		 		<li>제목</li>
		 		<li>내용</li>
		 		<li>작성자(id)</li>
		 		<li>등급</li>
		 		<li>댓글 수</li>
		 		<li>신고 수</li>
		 		<li>작성일</li>
		 		<li>삭제</li>
	 		</ul>
	 		<ul class="board_list">
	 			<li>2</li>
		 		<li>111</li>
		 		<li>contentssssssssss</li>
		 		<li>userid</li>
		 		<li>1</li>
		 		<li><a href="javascript:;" onclick="adminBoardReply()">3</a></li>
		 		<li>0</li>
		 		<li>2022-04-18</li>
		 		<li><button>삭제</button></li>
	 		</ul>
 		</div>
 		<div id="b_oldBoard_box" class="board_box">
	 		<ul class="board_box_title">
	 			<li>No.</li>
		 		<li>제목</li>
		 		<li>내용</li>
		 		<li>작성자(id)</li>
		 		<li>등급</li>
		 		<li>댓글 수</li>
		 		<li>신고 수</li>
		 		<li>작성일</li>
		 		<li>삭제</li>
	 		</ul>
	 		<ul class="board_list">
	 			<li>3</li>
		 		<li>111</li>
		 		<li>contentssssssssss</li>
		 		<li>userid</li>
		 		<li>1</li>
		 		<li><a href="javascript:;" onclick="adminBoardReply()">3</a></li>
		 		<li>0</li>
		 		<li>2022-04-18</li>
		 		<li><button>삭제</button></li>
	 		</ul>
 		</div>
 		<div id="b_review_box" class="board_box">
	 		<ul class="board_box_title">
	 			<li>No.</li>
		 		<li>제목</li>
		 		<li>내용</li>
		 		<li>작성자(id)</li>
		 		<li>등급</li>
		 		<li>댓글 수</li>
		 		<li>신고 수</li>
		 		<li>작성일</li>
		 		<li>삭제</li>
	 		</ul>
	 		<ul class="board_list">
	 			<li>4</li>
		 		<li>111</li>
		 		<li>contentssssssssss</li>
		 		<li>userid</li>
		 		<li>1</li>
		 		<li><a href="javascript:;" onclick="adminBoardReply()">3</a></li>
		 		<li>0</li>
		 		<li>2022-04-18</li>
		 		<li><button>삭제</button></li>
	 		</ul>
 		</div>
 		<div id="b_qna_box" class="board_box">
	 		<ul class="board_box_title">
	 			<li>No.</li>
		 		<li>제목</li>
		 		<li>내용</li>
		 		<li>작성자(id)</li>
		 		<li>등급</li>
		 		<li>댓글 수</li>
		 		<li>신고 수</li>
		 		<li>작성일</li>
		 		<li>삭제</li>
	 		</ul>
	 		<ul class="board_list">
	 			<li>5</li>
		 		<li>111</li>
		 		<li>contentssssssssss</li>
		 		<li>userid</li>
		 		<li>1</li>
		 		<li><a href="javascript:;" onclick="adminBoardReply()">3</a></li>
		 		<li>0</li>
		 		<li>2022-04-18</li>
		 		<li><button>삭제</button></li>
	 		</ul>
 		</div>
 		<div id="b_vote_box" class="board_box">
	 		<ul class="board_box_title">
	 			<li>No.</li>
		 		<li>제목</li>
		 		<li>내용</li>
		 		<li>작성자(id)</li>
		 		<li>등급</li>
		 		<li>댓글 수</li>
		 		<li>신고 수</li>
		 		<li>작성일</li>
		 		<li>삭제</li>
	 		</ul>
	 		<ul class="board_list">
	 			<li>6</li>
		 		<li>111</li>
		 		<li>contentssssssssss</li>
		 		<li>userid</li>
		 		<li>1</li>
		 		<li><a href="javascript:;" onclick="adminBoardReply()">3</a></li>
		 		<li>0</li>
		 		<li>2022-04-18</li>
		 		<li><button>삭제</button></li>
	 		</ul>
 		</div>
 	</div>
 </div>
 
 