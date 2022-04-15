<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <link rel="stylesheet" href="/css/todayCodi.css" type="text/css"/>
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
    <style>
    	footer {display:none;}
  	</style>
	<!-- <script>
	$(window).scroll(function() {
	    if ($(window).scrollTop() == $(document).height() - $(window).height()) {
	    	$("#tc_box").append(
	    		  "<li class='tc_img' style='margin:-270px 50px 0 -35px'><img src='/img/bg.png'><a href=''><img src='/img/profileDefault.png'><p>닉네임</p><span>작성일</span></a>"
	    		 + "<li class='tc_img' style='margin:-270px 40px 0 -5px'><img src='/img/bg.png'><a href=''><img src='/img/profileDefault.png'><p>닉네임</p><span>작성일</span></a>"
	    		 + "<li class='tc_img' style='margin:-270px 40px 0 5px'><img src='/img/bg.png'><a href=''><img src='/img/profileDefault.png'><p>닉네임</p><span>작성일</span></a>"
	    		 + "<li class='tc_img' style='margin:-270px 0 0 5px'><img src='/img/bg.png'><a href=''><img src='/img/profileDefault.png'><p>닉네임</p><span>작성일</span></a>"
	    	);
	    }
	});
	</script> -->
	<script>
		var imgTag='';
		function insertImage(){
			for(i=1;i<51;i++){
				//imgTag +='<img src="img/'+ imgList[i] +'"/>';
				
				imgTag +="<figure>";
				if(i<10)
					imgTag +=    "<img src='/upload/todayCodi/0"+ i+".png'/><a href='javascript:;'><img src='/upload/"+vo.profile_image+"'><p>"+vo.user_nickname+"</p><span>"+vo.write_date+"</span><p class='like_btn'><img src='/img/heart_empty.png' class='heart_empty' alt='빈하트'><span>추천 수 : xxx</span></p><div class='buttons'><button>수정</button><button>삭제</button><button>신고</button></div></a>";
				else
					imgTag +=    "<img src='/upload/todayCodi/"+ i+".png'/><a href='javascript:;'><img src='/upload/"+vo.profile_image+"'><p>"+vo.user_nickname+"</p><span>"+vo.write_date+"</span><p class='like_btn'><img src='/img/heart_empty.png' class='heart_empty' alt='빈하트'><span>추천 수 : xxx</span></p><div class='buttons'><button>수정</button><button>삭제</button><button>신고</button></div></a>";	
				//imgTag +=    "<figcaption>Cinderella wearing European fashion of the mid-1860’s</figcaption>";
				imgTag +="</figure>";
			}
			document.getElementById("columns").innerHTML = imgTag;
			
			
			document.getElementsByClass("heart_empty").on('click',function(){
				document.getElementsByClass(this).toggleClass('checked');
			})
		}
	</script>
	<script>
	$(document).ready(function(){
		$('.heart_empty').on('click',function(){
			$(this).toggleClass('checked');
		});
	});
	</script>
<body onload="insertImage();">
	<div id="tc_container">
		<div id="tc_wrap">
			<h1>오늘의 코디</h1>
			<div id="write"><a href="/board/todayCodi/todayCodiWrite">글쓰기</a></div>
			<ul id="tc_box">
				<c:forEach var="vo" items="${lst}">
					<li class='tc_img' style='margin: -270px 40px 0 0px;'>
						<%-- <img src='/upload/${vo.file1}' > --%>
						<div id="columns"></div>
							
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
</body>