<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/reviewList.css" type="text/css">
<!DOCTYPE html>
<br/><br/><br/><br/><br/>
<div id="review-wrapper"><!-- 전체 틀 -->
  <div id="sub-title">
	<h1 style="text-align: center;">구매후기</h1>
	<p>구매 후, 개인적인 평가를 적는 곳입니다.</p>
  </div>
  <div id="list-menu">
	<a href="/board/review/reviewWrite" style="color:grey;">글쓰기</a>
  </div>
	<hr/>
	<div id="review_container"><!--  리뷰 글 들어갈곳 -->
	  <ul id="reviewListUl">
		  	<!-- <li class="reviewList"> -->
			  	<%--<div class="post_area">
			  	 	<div class="sum-img">
			  			<a href="/board/review/reviewView?board_num=${vo.board_num}"><img src="/upload/${vo.file1}" width="130" width="130"/></a> <!--  이미지 들어갈곳 -->
			   		</div>
				   	<div class="post">
				  		<div class="post_top">
				  		  	<div class="title_area">${vo.title}</div><!--  제목 -->
				  		 	<div class="txt">${vo.content}</div><!-- 글 내용 일부분 -->
				  		</div>
				  		<div class="post_bottom"> <!--  작성자 작성일 조회수 등 들어갈곳 -->
				  		 	<span><img src="/upload/${vo.profile_image}" style='width:20px; height:20px; border-radius: 70%;'/>&nbsp;${vo.user_nickname}</span><!--  닉네임 -->
				  			<span>${vo.write_date}</span><!--  작성일자 -->
				  			<span>조회수 : ${vo.hit}</span><!--  조회수 -->
				  		</div>
				  	</div>
			  	</div> --%>
			  	
		  	<!-- </li> -->
		  	
	  </ul>
	  <a id="moreViewReview"><img src="/img/더보기.png" style="width:100px;"></a>
	</div>
	 
    <div>
        <form method="get" action="/board/review/search" id="searchFrm">
            <select name="searchKey">
                <option value="title">제목</option>
                <option value="content">내용</option>
                <option value="user_id">작성자</option>
            </select>
            <input type="text" name="searchWord" id="searchWord"/>
            <input type="submit" value="Search"/>
        </form>
	</div>
</div>
<script>
       $("#searchFrm").submit(function() {
          if ($("#searchWord").val() == "") {
             alert("검색어를 입력하세요");
             return false;
          }
          
       });
   		
       window.onload=function(){
			var startNum = $(".reviewList").length; 
			var addListHtml = "";
			 console.log(startNum); 
			var url;
			var param;
			const params = new URL(window.location.href).searchParams;
			var key = params.get('searchKey');
			var word = params.get('searchWord');
			var pathname = window.location.pathname;
			var pn = pathname.substring(pathname.lastIndexOf('/')+1);
			if(pn=='reviewList'){
				url = '/board/review/reviewLists';
				param = {
					"startNum" : startNum 
				};
			}else if(pn='search'){
				url = '/board/review/searchLists';
				param = {
					"startNum" : startNum ,
					"searchKey" : key,
					"searchWord" : word
				};
				console.log("search이다 : "+startNum);
			}
			$.ajax({
				url : url,
				type : 'POST',
				dataType : 'json',
				data :param,
				success : function(data){
					for (var i = 0; i < data.length; i++) {
						addListHtml += "<li class='reviewList'><div class='post_area'><div class='sum-img'>";
						addListHtml += "<a href='/board/review/reviewView?board_num="+ data[i].board_num +"'><img src='/upload/"+ data[i].file1 +"' width='130' height='130'/></a>";
						addListHtml += "</div><div class='post'><div class='post_top'>";
						addListHtml += "<div class='title_area'>"+ data[i].title +"</div><div class='txt'>" + data[i].content + "</div></div>";
						addListHtml += "<div class='post_bottom'>";
						addListHtml += "<span><img src='/upload/" + data[i].profile_image + "' style='width:20px; height:20px; border-radius: 70%;'/>&nbsp;"+ data[i].user_nickname+ "</span>";
						addListHtml += "<span>${vo.write_date}</span><span>조회수 : " + data[i].hit + "</span>";
						addListHtml += "</div></div></div></li>";
						if(data[i].board_num==0){
							$("#moreView").remove();
						} 
					}
					$("#reviewListUl").append(addListHtml);
					/* console.log(addListHtml); */
				}
			});
       }
   
       $('#moreViewReview').click(function(){
			var startNum = $(".reviewList").length; // oldlist안에 li태그의 길이
			var addListHtml = "";
			 console.log("moreView START!! :::" + startNum); 
			var url;
			var param;
			const params = new URL(window.location.href).searchParams;
			var key = params.get('searchKey');
			var word = params.get('searchWord');
			var pathname = window.location.pathname;
			var pn = pathname.substring(pathname.lastIndexOf('/')+1);
			if(pn=='reviewList'){
				url = '/board/review/reviewLists';
				param = {
					"startNum" : startNum 
				};
			}else if(pn='search'){
				url = '/board/review/searchLists';
				param = {
					"startNum" : startNum ,
					"searchKey" : key,
					"searchWord" : word
				};
				console.log("moreView startNum :: "+startNum);
			}
			$.ajax({
				url : url,
				type : 'POST',
				dataType : 'json',
				data :param,
				success : function(data){
					for (var i = 0; i < data.length; i++) {
						addListHtml += "<li class='reviewList'><div class='post_area'><div class='sum-img'>";
						addListHtml += "<a href='/board/review/reviewView?board_num="+ data[i].board_num +"'><img src='/upload/"+ data[i].file1 +"' width='130' height='130'/></a>";
						addListHtml += "</div><div class='post'><div class='post_top'>";
						addListHtml += "<div class='title_area'>"+ data[i].title +"</div><div class='txt'>" + data[i].content + "</div></div>";
						addListHtml += "<div class='post_bottom'>";
						addListHtml += "<span><img src='/upload/" + data[i].profile_image + "' style='width:20px; height:20px; border-radius: 70%;'/>&nbsp;"+ data[i].user_nickname+ "</span>";
						addListHtml += "<span>${vo.write_date}</span><span>조회수 : " + data[i].hit + "</span>";
						addListHtml += "</div></div></div></li>";
					}
					if(data.length<5){
						$("#moreViewReview").remove();
					} 
					$("#reviewListUl").append(addListHtml);
					/* console.log(addListHtml); */
				}
			});
		   
			
		});
</script>