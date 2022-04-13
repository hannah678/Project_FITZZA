<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/reviewList.css" type="text/css">
<!DOCTYPE html>
<br/><br/><br/><br/><br/>
<div id="review-wrapper"><!-- 전체 틀 -->
  <div id="sub-title">
	<h1> 구매후기</h1>
	<p>구매 후, 개인적인 평가를 적는 곳입니다.</p>
  </div>
  <div id="list-menu">
	<a href="/board/review/reviewWrite">글쓰기</a>  <!-- 글쓰기가 안보임 -->
  </div>
  <br><br><br><br><br><br>
	<hr/>
	<div id="review_container"><!--  리뷰 글 들어갈곳 -->
	  <ul>
	  	<c:forEach var="vo" items="${lst}">
		  	<li>
			  	<div class="post_area">
			  	 	<div class="sum-img">
			  			<a href="/board/review/reviewView?board_num=${vo.board_num}"><img src="/upload/${vo.file1}" width="130" width="130"/></a> <!--  이미지 들어갈곳 -->
			   		</div>
				   	<div class="post">
				  		<div class="post_top">
				  		  	<div class="title_area">${vo.title}</div><!--  제목 -->
				  		 	<div class="txt">${vo.content}</div><!-- 글 내용 일부분 -->
				  		</div>
				  		<div class="post_bottom"> <!--  작성자 작성일 조회수 등 들어갈곳 -->
				  		 	<span>${vo.user_nickname}</span><!--  닉네임 -->
				  			<span>${vo.write_date}</span><!--  작성일자 -->
				  			<span>${vo.hit}</span><!--  조회수 -->
				  		</div>
				  	</div>
			  	</div>
		  	</li>
	  	</c:forEach>
	  </ul>
	</div>
	 
    
        <form action="/board/review/search" id="searchFrm">
            <select name="searchKey">
                <option value="subject">제목</option>
                <option value="content">내용</option>
                <option value="userid">작성자</option>
            </select>
            <input type="text" name="searchWord" id="searchWord"/>
            <input type="submit" value="Search"/>
        </form>
</div>

<script>
       $("#searchFrm").submit(function() {
          if ($("#searchWord").val() == "") {
             alert("검색어를 입력하세요");
             return false;
          }
          
       });
   		
       window.onload=function(){
			var startNum = $("#oldlist li").length/6 -1; // oldlist안에 li태그의 길이
			var addListHtml = "";
			 console.log(startNum); 
			var url;
			var param;
			const params = new URL(window.location.href).searchParams;
			var key = params.get('searchKey');
			var word = params.get('searchWord');
			var pathname = window.location.pathname;
			var pn = pathname.substring(pathname.lastIndexOf('/')+1);
			if(pn=='oldList'){
				url = '/board/old/oldLists';
				param = {
					"startNum" : startNum 
				};
			}else if(pn='search'){
				url = '/board/old/searchLists';
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
						addListHtml += "<li>"+data[i].city+"</li>";
						addListHtml += "<li><a href='/board/old/oldView?board_num="+data[i].board_num+"'><img src='/upload/"+data[i].file1+"'/></a></li>";
						addListHtml += "<li><a href='/board/old/oldView?board_num="+data[i].board_num+"'>"+data[i].title+"</a></li>";
						addListHtml += "<li><img src='"+data[i].profile_image+"' style='width:20px; height:20px; border-radius: 70%;'/>"+data[i].user_nickname+"</li>";
						addListHtml += "<li>"+data[i].write_date+"</li>";
						addListHtml += "<li>"+data[i].hit+"</li>";
						if(data[i].board_num==1){
							$("#moreView").remove();
						} 
					}
					$("#oldlist").append(addListHtml);
					/* console.log(addListHtml); */
				}
			});
       }
   
	   $('#moreView').click(function(){
			var startNum = $("#oldlist li").length/6 -1; // oldlist안에 li태그의 길이
			var addListHtml = "";
			 console.log(startNum); 
			var url;
			var param;
			const params = new URL(window.location.href).searchParams;
			var key = params.get('searchKey');
			var word = params.get('searchWord');
			var pathname = window.location.pathname;
			var pn = pathname.substring(pathname.lastIndexOf('/')+1);
			if(pn=='oldList'){
				url = '/board/old/oldLists';
				param = {
					"startNum" : startNum 
				};
			}else if(pn='search'){
				url = '/board/old/searchLists';
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
						addListHtml += "<li>"+data[i].city+"</li>";
						addListHtml += "<li><a href='/board/old/oldView?board_num="+data[i].board_num+"'><img src='/upload/"+data[i].file1+"'/></a></li>";
						addListHtml += "<li><a href='/board/old/oldView?board_num="+data[i].board_num+"'>"+data[i].title+"</a></li>";
						addListHtml += "<li><img src='"+data[i].profile_image+"' style='width:20px; height:20px; border-radius: 70%;'/>"+data[i].user_nickname+"</li>";
						addListHtml += "<li>"+data[i].write_date+"</li>";
						addListHtml += "<li>"+data[i].hit+"</li>";
						if(data[i].board_num==1){
							$("#moreView").remove();
						} 
					}
					$("#oldlist").append(addListHtml);
					/* console.log(addListHtml); */
				}
			});
		   
			
		});
</script>