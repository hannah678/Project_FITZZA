<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/adminHome.css" type="text/css"/>
<style>
	header, footer {display:none}
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function(){
	$("#adminUser").click(function(){ 
		$("#adminUser_container").css('display','block');
		$("#adminReport_container").css('display','none');
		$("#adminOld_container").css('display','none');
		$("#adminBoard_container").css('display','none');
		$("#adminNotice_container").css('display','none');
	   });
	$("#adminReport").click(function(){ 
		$("#adminUser_container").css('display','none');
		$("#adminReport_container").css('display','block');
		$("#adminOld_container").css('display','none');
		$("#adminBoard_container").css('display','none');
		$("#adminNotice_container").css('display','none');
	 });
	$("#adminOld").click(function(){ 
		$("#adminUser_container").css('display','none');
		$("#adminReport_container").css('display','none');
		$("#adminOld_container").css('display','block');
		$("#adminBoard_container").css('display','none');
		$("#adminNotice_container").css('display','none');
	 });
	$("#adminBoard").click(function(){ 
		$("#adminUser_container").css('display','none');
		$("#adminReport_container").css('display','none');
		$("#adminOld_container").css('display','none');
		$("#adminBoard_container").css('display','block');
		$("#adminNotice_container").css('display','none');
	 });
	$("#adminNotice").click(function(){ 
		$("#adminUser_container").css('display','none');
		$("#adminReport_container").css('display','none');
		$("#adminOld_container").css('display','none');
		$("#adminBoard_container").css('display','none');
		$("#adminNotice_container").css('display','block');
	 });
});

</script>
<div id="admin_container">
	<div id="admin_wrap">
		<div id="admin_lnb">
			<a href="/"><img id="ad_logo" src="/img/logo_full_w.png" alt="logo"/></a>
			<!-- 검색 -->
			<div id="admin_search">
				<form method="get" action="" id="ad_searchFrm">
				    <input type="text" name="searchWord" id="ad_searchWord"/>
				    <input type="submit" value="search"/>
				</form>
			</div>
			<div id="ad_profile">
				<img id ="ad_p_img" src="/img/profileDefault.png" alt="프로필 이미지">
				<!-- <img id ="ad_p_img" src="/upload/${vo.profile_image}" alt="프로필 이미지"> -->
				<a href="/member/myPage"></a>
				<p>관리자 게시글 ^ </p>
			</div>
			<ul>
				<li><span id="adminUser">회원 관리</span></li>
				<li><span id="adminReport">신고 관리</span></li>
				<li><span id="adminOld">중고거래 관리</span></li>
				<li><span id="adminBoard">게시글/댓글 관리</span></li>
				<li><span id="adminNotice">공지게시</span></li>
			</ul>
		</div>
		<div id="resultArea">
			<p id="adminUserShow"><%@ include file="/WEB-INF/views/admin/adminUser.jsp" %></p>
			<p id="adminReportShow"><%@ include file="/WEB-INF/views/admin/adminReport.jsp" %></p>
			<p id="adminOldShow"><%@ include file="/WEB-INF/views/admin/adminOld.jsp" %></p>
			<p id="adminBoardShow"><%@ include file="/WEB-INF/views/admin/adminBoard.jsp" %></p>
			<p id="adminNoticeShow"><%@ include file="/WEB-INF/views/admin/adminNotice.jsp" %></p>
		</div>
	</div>
</div>