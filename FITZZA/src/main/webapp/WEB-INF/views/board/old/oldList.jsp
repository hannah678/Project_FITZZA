<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
    <meta charset="UTF-8">
    <title>FITZZA | 중고거래</title>
</head>
<link rel="stylesheet" href="/css/oldlist.css" type="text/css">
<style>
	#moreView {cursor:pointer}
</style>
<body>
<br><br><br><br><br><br><br><br>
	<div class="oldboard">
    <h2 id="title">중고거래</h2>
    <div id="write">
        <a href="/board/old/oldWrite">글쓰기</a>
    </div>
    <ul class="oldlist" id="oldlist">
        <li>지역</li>
        <li>대표이미지</li>
        <li>제목</li>
        <li>작성자</li>
        <li>작성일</li>
        <li>조회</li>

	<!-- 리스트는 script 안에서 설정 -->
    </ul>
    <!-- 리스트 더보기 -->
    <a id="moreView" ><img src="/img/더보기.png" style="width:100px;"></a>
    
    
    <!-- 검색 -->
    <form method="get" action="/board/old/search" id="searchFrm">
            <select name="searchKey">
                <option value="title">제목</option>
                <option value="content">내용</option>
                <option value="city">지역</option>
                <option value="user_id">작성자</option>
            </select>
            <input type="text" name="searchWord" id="searchWord"/>
            <input type="submit" value="Search"/>
     </form>
</div>
</body>
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
						addListHtml += "<li><a href='/board/old/oldView?board_num="+data[i].board_num+"'><img src='/upload/"+data[i].file1+"' id='product_img'/></a></li>";
						addListHtml += "<li><a href='/board/old/oldView?board_num="+data[i].board_num+"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+data[i].title+"</a></li>";
						addListHtml += "<li><img src='/upload/"+data[i].profile_image+"' class='real_profile_img'/>&nbsp;"+data[i].user_nickname+"</li>";
						addListHtml += "<li>"+data[i].write_date+"</li>";
						addListHtml += "<li>"+data[i].hit+"</li>";
					}
					if(data.length<5){
						$("#moreView").remove();
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
						addListHtml += "<li><a href='/board/old/oldView?board_num="+data[i].board_num+"'><img src='/upload/"+data[i].file1+"' id='product_img'/></a></li>";
						addListHtml += "<li><a href='/board/old/oldView?board_num="+data[i].board_num+"'>"+data[i].title+"</a></li>";
						addListHtml += "<li><img src=/upload/'"+data[i].profile_image+"' class='real_profile_img'/>"+data[i].user_nickname+"</li>";
						addListHtml += "<li>"+data[i].write_date+"</li>";
						addListHtml += "<li>"+data[i].hit+"</li>";
						
					}
					if(data.length<5){
						$("#moreView").remove();
					} 
					$("#oldlist").append(addListHtml);
					/* console.log(addListHtml); */
				}
			});
		   
			
		});
</script>

