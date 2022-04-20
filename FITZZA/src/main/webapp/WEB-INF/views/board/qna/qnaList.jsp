<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/qnaList.css" type="text/css">
<body>
<div class="qnaboard">
    <br><br><br><br><br><br><br><br>
    <h1>Q & A</h1>
    <h2>도배/홍보성 글은 삭제 및 경고 처리됩니다.</h2>
    <div id="q_write">
        <a href="/board/qna/qnaWrite">글쓰기</a>
    </div>
    <ul class="qnalist" id="qnalist">
        <li>번호</li>
        <li>제목</li>
        <li>작성자</li>
        <li>날짜</li>
        <li>조회</li>

		<!-- 게시물 리스트 -->
        
     </ul>   
        

        <!-- 리스트 더보기 -->
        <ul class="paging">
           <a id="moreView" ><img src="/img/더보기.png" style="width:100px;"></a>
            
        </ul>
    
        <form action="/board/qna/search" id="searchFrm">
            <select name="searchKey">
                <option value="title">제목</option>
                <option value="content">내용</option>
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
		var startNum = $("#qnalist li").length/5 -1; // oldlist안에 li태그의 길이
		var addListHtml = "";
		 console.log(startNum); 
		var url;
		var param;
		const params = new URL(window.location.href).searchParams;
		var key = params.get('searchKey');
		var word = params.get('searchWord');
		var pathname = window.location.pathname;
		var pn = pathname.substring(pathname.lastIndexOf('/')+1);
		if(pn=='qnaList'){
			url = '/board/qna/qnaLists';
			param = {
				"startNum" : startNum 
			};
		}else if(pn='search'){
			url = '/board/qna/searchLists';
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
					addListHtml += "<li>"+data[i].board_num+"</li>";
					addListHtml += "<li><a href='/board/qna/qnaView?board_num="+data[i].board_num+"'>"+data[i].title+"</a></li>";
					addListHtml += "<li><img src='/upload/"+data[i].profile_image+"' class='real_profile_img'/>&nbsp;"+data[i].user_nickname+"</li>";
					addListHtml += "<li>"+data[i].write_date+"</li>";
					addListHtml += "<li>"+data[i].hit+"</li>";
				}
				if(data.length<10){
					$("#moreView").remove();
				} 
				$("#qnalist").append(addListHtml);
				console.log(addListHtml); 
			}
		});
}

$('#moreView').click(function(){
		var startNum = $("#qnalist li").length/5 -1; // oldlist안에 li태그의 길이
		var addListHtml = "";
		 console.log(startNum); 
		var url;
		var param;
		const params = new URL(window.location.href).searchParams;
		var key = params.get('searchKey');
		var word = params.get('searchWord');
		var pathname = window.location.pathname;
		var pn = pathname.substring(pathname.lastIndexOf('/')+1);
		if(pn=='qnaList'){
			url = '/board/qna/qnaLists';
			console.log("if문")
			param = {
				"startNum" : startNum 
			};
		}else if(pn='search'){
			url = '/board/qna/searchLists';
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
					addListHtml += "<li>"+data[i].board_num+"</li>";
					addListHtml += "<li><a href='/board/qna/qnaView?board_num="+data[i].board_num+"'>"+data[i].title+"</a></li>";
					addListHtml += "<li><img src='/upload/"+data[i].profile_image+"' class='real_profile_img' />&nbsp;"+data[i].user_nickname+"</li>";
					addListHtml += "<li>"+data[i].write_date+"</li>";
					addListHtml += "<li>"+data[i].hit+"</li>";
					
				}
				if(data.length<10){
					$("#moreView").remove();
				} 
				$("#qnalist").append(addListHtml);
				/* console.log(addListHtml); */
			}
		});
	   
		
	});
</script>