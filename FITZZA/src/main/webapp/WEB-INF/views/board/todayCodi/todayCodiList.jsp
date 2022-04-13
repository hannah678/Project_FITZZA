<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <link rel="stylesheet" href="/css/todayCodi.css" type="text/css"/>
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
    <style>
    	footer {display:none;}
  	</style>
	<script>
		$(window).scroll(function() {
		    if ($(window).scrollTop() == $(document).height() - $(window).height()) {
		    	$("#tc_box").append(
		    		  "<li class='tc_img' style='margin:-270px 40px 0 0px'><img src='/img/bg.png'><a href=''><img src='/img/profileDefault.png'><p>닉네임</p><span>작성일</span></a>"
		    		 + "<li class='tc_img' style='margin:-270px 40px 0 0'><img src='/img/bg.png'><a href=''><img src='/img/profileDefault.png'><p>닉네임</p><span>작성일</span></a>"
		    		 + "<li class='tc_img' style='margin:-270px 40px 0 0'><img src='/img/bg.png'><a href=''><img src='/img/profileDefault.png'><p>닉네임</p><span>작성일</span></a>"
		    		 + "<li class='tc_img' style='margin:-270px 0 0 0px'><img src='/img/bg.png'><a href=''><img src='/img/profileDefault.png'><p>닉네임</p><span>작성일</span></a>"
		    	);
		    }
		});
		alert("자동 스크롤 업로드를 위해 텍스트 확대를 100%로 맞춰주세요.")
	</script>
<div id="tc_container">
	<div id="tc_wrap">
		<h1>오늘의 코디</h1>
		<div id="write"><a href="/board/todayCodi/todayCodiWrite">글쓰기</a></div>
		<ul id="tc_box">
			<li class='tc_img'>
				<img src='/img/bg.png' >
				<a href=''>
					<img src="/upload/profileDefault.png">
					<p>닉네임</p>
					<span>작성일</span>
				</a>
			</li>
			<li class='tc_img'>
				<img src='/img/bg.png'>
				<a href=''>
					<img src="/img/profileDefault.png">
					<p>닉네임</p>
					<span>작성일</span>
				</a>
			</li>
			<li class='tc_img'>
				<img src='/img/bg.png'>
				<a href=''>
					<img src="/img/profileDefault.png">
					<p>닉네임</p>
					<span>작성일</span>
				</a>
			</li>
			<li class='tc_img'>
				<img src='/img/bg.png'>
				<a href=''>
					<img src="/img/profileDefault.png">
					<p>닉네임</p>
					<span>작성일</span>
				</a>
			</li>
		</ul>
	</div>
</div>