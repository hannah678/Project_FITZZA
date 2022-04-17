<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    <link rel="stylesheet" href="/css/adminReport.css" type="text/css"/>
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<style>
	header, footer {display:none}
	#adminReport_container {display:none}
</style>
<!-- 카테고리 선택 js-->
 <script>
$(document).ready(function(){
	$('#tc_btn').addClass('button_toggled');
	$('#rec_btn').addClass('button_normal');
	$('#oldb_btn').addClass('button_normal');
	$('#rev_btn').addClass('button_normal');
	$('#qna_btn').addClass('button_normal');
	$('#vote_btn').addClass('button_normal');
	$('#todayCodi_box').addClass('report_box_show');
	$('#recommend_box').addClass('report_box_hide');
	$('#oldBoard_box').addClass('report_box_hide');
	$('#review_box').addClass('report_box_hide');
	$('#qna_box').addClass('report_box_hide');
	$('#vote_box').addClass('report_box_hide');
		$('#tc_btn').click( function() {
			$(this).removeClass('button_normal').addClass('button_toggled');
			$('#rec_btn').removeClass('button_toggled').addClass('button_normal');
			$('#oldb_btn').removeClass('button_toggled').addClass('button_normal');
			$('#rev_btn').removeClass('button_toggled').addClass('button_normal');
			$('#qna_btn').removeClass('button_toggled').addClass('button_normal');
			$('#vote_btn').removeClass('button_toggled').addClass('button_normal');
		    $('#todayCodi_box').removeClass('report_box_hide').addClass('report_box_show');
		    $('#recommend_box').removeClass('report_box_show').addClass('report_box_hide');
		    $('#oldBoard_box').removeClass('report_box_show').addClass('report_box_hide');
		    $('#review_box').removeClass('report_box_show').addClass('report_box_hide');
		    $('#qna_box').removeClass('report_box_show').addClass('report_box_hide');
		    $('#vote_box').removeClass('report_box_show').addClass('report_box_hide');
		});
		$('#rec_btn').click( function() {
			$(this).removeClass('button_normal').addClass('button_toggled');
			$('#tc_btn').removeClass('button_toggled').addClass('button_normal');
			$('#oldb_btn').removeClass('button_toggled').addClass('button_normal');
			$('#rev_btn').removeClass('button_toggled').addClass('button_normal');
			$('#qna_btn').removeClass('button_toggled').addClass('button_normal');
			$('#vote_btn').removeClass('button_toggled').addClass('button_normal');
		    $('#todayCodi_box').removeClass('report_box_show').addClass('report_box_hide');
		    $('#recommend_box').removeClass('report_box_hide').addClass('report_box_show');
		    $('#oldBoard_box').removeClass('report_box_show').addClass('report_box_hide');
		    $('#review_box').removeClass('report_box_show').addClass('report_box_hide');
		    $('#qna_box').removeClass('report_box_show').addClass('report_box_hide');
		    $('#vote_box').removeClass('report_box_show').addClass('report_box_hide');
		});
		$('#oldb_btn').click( function() {
			$(this).removeClass('button_normal').addClass('button_toggled');
			$('#tc_btn').removeClass('button_toggled').addClass('button_normal');
			$('#rec_btn').removeClass('button_toggled').addClass('button_normal');
			$('#rev_btn').removeClass('button_toggled').addClass('button_normal');
			$('#qna_btn').removeClass('button_toggled').addClass('button_normal');
			$('#vote_btn').removeClass('button_toggled').addClass('button_normal');
		    $('#todayCodi_box').removeClass('report_box_show').addClass('report_box_hide');
		    $('#recommend_box').removeClass('report_box_show').addClass('report_box_hide');
		    $('#oldBoard_box').removeClass('report_box_hide').addClass('report_box_show');
		    $('#review_box').removeClass('report_box_show').addClass('report_box_hide');
		    $('#qna_box').removeClass('report_box_show').addClass('report_box_hide');
		    $('#vote_box').removeClass('report_box_show').addClass('report_box_hide');
		});
		$('#rev_btn').click( function() {
			$(this).removeClass('button_normal').addClass('button_toggled');
			$('#tc_btn').removeClass('button_toggled').addClass('button_normal');
			$('#rec_btn').removeClass('button_toggled').addClass('button_normal');
			$('#oldb_btn').removeClass('button_toggled').addClass('button_normal');
			$('#qna_btn').removeClass('button_toggled').addClass('button_normal');
			$('#vote_btn').removeClass('button_toggled').addClass('button_normal');
		    $('#todayCodi_box').removeClass('report_box_show').addClass('report_box_hide');
		    $('#recommend_box').removeClass('report_box_show').addClass('report_box_hide');
		    $('#oldBoard_box').removeClass('report_box_show').addClass('report_box_hide');
		    $('#review_box').removeClass('report_box_hide').addClass('report_box_show');
		    $('#qna_box').removeClass('report_box_show').addClass('report_box_hide');
		    $('#vote_box').removeClass('report_box_show').addClass('report_box_hide');
		});
		$('#qna_btn').click( function() {
			$(this).removeClass('button_normal').addClass('button_toggled');
			$('#tc_btn').removeClass('button_toggled').addClass('button_normal');
			$('#rec_btn').removeClass('button_toggled').addClass('button_normal');
			$('#oldb_btn').removeClass('button_toggled').addClass('button_normal');
			$('#rev_btn').removeClass('button_toggled').addClass('button_normal');
			$('#vote_btn').removeClass('button_toggled').addClass('button_normal');
		    $('#todayCodi_box').removeClass('report_box_show').addClass('report_box_hide');
		    $('#recommend_box').removeClass('report_box_show').addClass('report_box_hide');
		    $('#oldBoard_box').removeClass('report_box_show').addClass('report_box_hide');
		    $('#review_box').removeClass('report_box_show').addClass('report_box_hide');
		    $('#qna_box').removeClass('report_box_hide').addClass('report_box_show');
		    $('#vote_box').removeClass('report_box_show').addClass('report_box_hide');
		});
		$('#vote_btn').click( function() {
			$(this).removeClass('button_normal').addClass('button_toggled');
			$('#tc_btn').removeClass('button_toggled').addClass('button_normal');
			$('#rec_btn').removeClass('button_toggled').addClass('button_normal');
			$('#oldb_btn').removeClass('button_toggled').addClass('button_normal');
			$('#rev_btn').removeClass('button_toggled').addClass('button_normal');
			$('#vote_btn').removeClass('button_toggled').addClass('button_normal');
		    $('#todayCodi_box').removeClass('report_box_show').addClass('report_box_hide');
		    $('#recommend_box').removeClass('report_box_show').addClass('report_box_hide');
		    $('#oldBoard_box').removeClass('report_box_show').addClass('report_box_hide');
		    $('#review_box').removeClass('report_box_show').addClass('report_box_hide');
		    $('#qna_box').removeClass('report_box_show').addClass('report_box_hide');
		    $('#vote_box').removeClass('report_box_hide').addClass('report_box_show');
		});
	
});
</script>

 <div id="adminReport_container">
 	<h1 class="hidden">신고 관리</h1>
 	<div id="adminReport_wrap">
 		<h3>신고 관리</h3>
 		<ul class="ad_report_status">
 			<li>오늘의 코디&nbsp;&nbsp; : 
 				<span>xxx건</span>
 			</li>
 			<li>스타일 추천&nbsp;&nbsp; : 
 				<span>xxx건</span>
 			</li>
 			<li>중고거래&nbsp;&nbsp; : 
 				<span>xxx건</span>
 			</li>
 			<li>구매후기&nbsp;&nbsp; : 
 				<span>xxx건</span>
 			</li>
 			<li>QnA&nbsp;&nbsp; : 
 				<span>xxx건</span>
 			</li>
 			<li>오늘 뭐 입지?&nbsp;&nbsp; : 
 				<span>xxx건</span>
 			</li>
 		</ul>
 		<form method="get" action="" id="reportSearchFrm">
			<select name="ReportSearchKey">
		    	<option value="todayCodi">오늘의 코디</option>
		        <option value="styleRecom">스타일 추천</option>
		        <option value="trade">중고거래</option>
		        <option value="review">구매후기</option>
		        <option value="qna">QnA</option>
		        <option value="vote">오늘 뭐 입지?</option>
		    </select>
		    <input type="text" name="searchMember" id="searchReport"/>
		    <input type="submit" value="검색" id="reportSearch"/>
	     </form>
 		<div class="report_cate_buttons">
 			<button id="tc_btn">오늘의 코디</button>
 			<button id="rec_btn">스타일 추천</button>
 			<button id="oldb_btn">중고거래</button>
 			<button id="rev_btn">구매후기</button>
 			<button id="qna_btn">QnA</button>
 			<button id="vote_btn">오늘 뭐 입지?</button>
 		</div>
 		<div id="todayCodi_box" class="Report_box" style="background-color:red">
	 		<ul class="report_box_title">
	 			<li>신고받은<br/>회원 아이디</li>
		 		<li>신고자<br/>아이디</li>
		 		<li>신고분류</li>
		 		<li>신고사유</li>
		 		<li>상세내용</li>
		 		<li>글<br/>공개여부</li>
		 		<li>회원분류</li><!-- 블랙리스트 처리 -->
		 		<li>신고일</li>
		 		<li>처리상태</li>
	 		</ul>
	 		<ul class="report_list">
	 		
	 		</ul>
 		</div>
 		<div id="recommend_box" class="Report_box" style="background-color:pink">
	 		<ul class="report_box_title">
	 			<li>신고받은<br/>회원 아이디</li>
		 		<li>신고자<br/>아이디</li>
		 		<li>신고분류</li>
		 		<li>신고사유</li>
		 		<li>상세내용</li>
		 		<li>글<br/>공개여부</li>
		 		<li>회원분류</li><!-- 블랙리스트 처리 -->
		 		<li>신고일</li>
		 		<li>처리상태</li>
	 		</ul>
	 		<ul class="report_list">
	 		
	 		</ul>
 		</div>
 		<div id="oldBoard_box" class="Report_box" style="background-color:blue">
	 		<ul class="report_box_title">
	 			<li>신고받은<br/>회원 아이디</li>
		 		<li>신고자<br/>아이디</li>
		 		<li>신고분류</li>
		 		<li>신고사유</li>
		 		<li>상세내용</li>
		 		<li>글<br/>공개여부</li>
		 		<li>회원분류</li><!-- 블랙리스트 처리 -->
		 		<li>신고일</li>
		 		<li>처리상태</li>
	 		</ul>
	 		<ul class="report_list">
	 		
	 		</ul>
 		</div>
 		<div id="review_box" class="Report_box" style="background-color:black">
	 		<ul class="report_box_title">
	 			<li>신고받은<br/>회원 아이디</li>
		 		<li>신고자<br/>아이디</li>
		 		<li>신고분류</li>
		 		<li>신고사유</li>
		 		<li>상세내용</li>
		 		<li>글<br/>공개여부</li>
		 		<li>회원분류</li><!-- 블랙리스트 처리 -->
		 		<li>신고일</li>
		 		<li>처리상태</li>
	 		</ul>
	 		<ul class="report_list">
	 		
	 		</ul>
 		</div>
 		<div id="qna_box" class="Report_box" style="background-color:purple">
	 		<ul class="report_box_title">
	 			<li>신고받은<br/>회원 아이디</li>
		 		<li>신고자<br/>아이디</li>
		 		<li>신고분류</li>
		 		<li>신고사유</li>
		 		<li>상세내용</li>
		 		<li>글<br/>공개여부</li>
		 		<li>회원분류</li><!-- 블랙리스트 처리 -->
		 		<li>신고일</li>
		 		<li>처리상태</li>
	 		</ul>
	 		<ul class="report_list">
	 		
	 		</ul>
 		</div>
 		<div id="vote_box" class="Report_box" style="background-color:yellow">
	 		<ul class="report_box_title">
	 			<li>신고받은<br/>회원 아이디</li>
		 		<li>신고자<br/>아이디</li>
		 		<li>신고분류</li>
		 		<li>신고사유</li>
		 		<li>상세내용</li>
		 		<li>글<br/>공개여부</li>
		 		<li>회원분류</li><!-- 블랙리스트 처리 -->
		 		<li>신고일</li>
		 		<li>처리상태</li>
	 		</ul>
	 		<ul class="report_list">
	 		
	 		</ul>
 		</div>
 	</div>
 </div>
 
 