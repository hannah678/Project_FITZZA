<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/voteList.css" type="text/css">

<br/><br/><br/><br/></br>
<div id="vote-wrapper">
	 <div id="sub-title">
		<h1>투표게시판</h1>
		<p>사용자들의 투표를 구하는 곳입니다.</p>
 	 </div>
	 <div id="list-menu">
	 	<div><a href="/board/vote/voteWrite">글쓰기</a></div>
     </div>
	<hr/>
	<div id="vote_container"><!--  투표 글 들어갈곳 한페이지에 보일건 8개정도-->
		<ul id="voteListUl">
	</ul>
	<a id="moreViewVote"><img src="/img/더보기.png" style="width:100px;"></a>
	</div><!--  container -->
		 
    
        <form method="get" action="/board/vote/search" id="searchFrm">
            <select name="searchKey">
                <option value="title">제목</option>
                <option value="content">내용</option>
                <option value="user_id">작성자</option>
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
			var startNum = $("#voteListUl div").length/5; 
			var addListHtml = "";
			 console.log(startNum); 
			var url;
			var param;
			const params = new URL(window.location.href).searchParams;
			var key = params.get('searchKey');
			var word = params.get('searchWord');
			var pathname = window.location.pathname;
			var pn = pathname.substring(pathname.lastIndexOf('/')+1);
			if(pn=='voteList'){
				url = '/board/vote/voteLists';
				param = {
					"startNum" : startNum 
				};
			}else if(pn='search'){
				url = '/board/vote/searchLists';
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
						addListHtml += "<div class='post_vote'><a href='/board/vote/voteView?board_num="+ data[i].board_num +"'><div class='sum-img'>";
						addListHtml += "<div class='sum-img1'><img src='/upload/"+ data[i].file1 +"' width='130' width='130'/></div>";
						addListHtml += "<div class='sum-img2'><img src='/upload/"+ data[i].file2 +"' width='130' width='130'/></div></div></a>";
						addListHtml += "<div class='post'><div class='post_top'><div class='title_area'>"+data[i].title+"</div><div class='post_status'>진행중</div>";
						addListHtml += "<div class='post_bottom'><img src='/upload/" + data[i].profile_image + "' width='30' width='30'/>";
						addListHtml += "<span>"+ data[i].user_nickname+ "</span><span>"+data[i].write_date+"</span></div></div></div>";
						if(data[i].board_num==0){
							$("#moreView").remove();
						} 
					}
					$("#voteListUl").append(addListHtml);
					/* console.log(addListHtml); */
				}
			});
       }
   
       $('#moreViewVote').click(function(){
    	   var startNum = $("#voteListUl div").length/5; 
			var addListHtml = "";
			 console.log(startNum); 
			var url;
			var param;
			const params = new URL(window.location.href).searchParams;
			var key = params.get('searchKey');
			var word = params.get('searchWord');
			var pathname = window.location.pathname;
			var pn = pathname.substring(pathname.lastIndexOf('/')+1);
			if(pn=='voteList'){
				url = '/board/vote/voteLists';
				param = {
					"startNum" : startNum 
				};
			}else if(pn='search'){
				url = '/board/vote/searchLists';
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
						addListHtml += "<div class='post_vote'><a href='/board/vote/voteView?board_num="+ data[i].board_num +"'><div class='sum-img'>";
						addListHtml += "<div class='sum-img1'><img src='/upload/"+ data[i].file1 +"' width='130' width='130'/></div>";
						addListHtml += "<div class='sum-img2'><img src='/upload/"+ data[i].file2 +"' width='130' width='130'/></div></div></a>";
						addListHtml += "<div class='post'><div class='post_top'><div class='title_area'>"+data[i].title+"</div><div class='post_status'>진행중</div>";
						addListHtml += "<div class='post_bottom'><img src='/upload/" + data[i].profile_image + "' width='30' width='30'/>";
						addListHtml += "<span>"+ data[i].user_nickname+ "</span><span>"+data[i].write_date+"</span></div></div></div>";
						if(data[i].board_num==0){
							$("#moreView").remove();
						} 
					}
					$("#voteListUl").append(addListHtml);
					/* console.log(addListHtml); */
				}
			});
		});
</script>