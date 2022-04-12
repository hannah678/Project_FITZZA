<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
    <meta charset="UTF-8">
    <title>FITZZA | 중고거래</title>
</head>
<link rel="stylesheet" href="/css/oldlist.css" type="text/css">

<body>
<br><br><br><br><br><br><br><br>
	<div class="oldboard">
    <h2 id="title">중고거래</h2>
    <div id="write">
        <a href="/board/old/oldWrite">글쓰기</a>
    </div>
    <ul class="oldlist">
        <li>지역</li>
        <li>제목</li>
        <li>작성자</li>
        <li>작성일</li>
        <li>조회</li>


		<!-- 게시물 리스트-->
        <c:forEach var="vo" items="${lst}">
            <li>${vo.city}</li>
            <li><a href="/board/old/oldView?board_num=${vo.board_num}"><img src="/upload/${vo.file1}"/></a></li>
            <li><a href="/board/old/oldView?board_num=${vo.board_num}">${vo.title}</a></li>
            <li><img src="profile_image" style="width:20px; height:20px; border-radius: 70%;"/>${vo.user_nickname}</li>
            <li>${vo.write_date}</li>
            <li>${vo.hit}</li>
        </c:forEach> 
        
        <!-- 게시물 리스트 페이징 -->
        <ul class="paging">
            
                    <a href="">${p}</a></li>
           
            
            <!-- 삭제 -->
            <li><a href="">이전</a></li>
            <li style="background-color:#fff58c; border-radius:360px; font-weight:bold;">1</li>
            <li>2</li>
            <li>3</li>
            <li>4</li>
            <li>5</li>
            <li><a href="">다음</a></li> <!-- 삭제 -->

		
        </ul>
    
        <form action="" id="searchFrm">
            <select name="searchKey">
                <option value="title">제목</option>
                <option value="content">내용</option>
                <option value="city">지역</option>
                <option value="user_id">작성자</option>
            </select>
            <input type="text" name="searchWord" id="searchWord"/>
            <input type="submit" value="Search"/>
        </form>
    </ul>
</div>
</body>