<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/recList.css" type="text/css">
<body>
<div class="recboard">
    <br><br><br><br><br><br><br>
    <h1>다양한 패션을 나누고 싶다면</h1>
    <h2>스타일 추천</h2>
    <br/>
    <h5>도배/홍보성 글은 삭제 및 경고 처리됩니다.</h5>
    <div id="write">
        <a href="">글쓰기</a>
    </div>
    <ul>
    <div class="recli">
        <c:forEach var="vo" items="${lst}">
            <li class="reclist">
                <a href="">
                    <img src="/upload/${vo.file1}" class="rec_img">
                </a>
                <a href="" class="rec_title">${vo.title}</a><br/>
                <img src="/upload/${vo.profile_image}"id="profile_img"/>&emsp;${vo.user_nickname}<br/>
                ${vo.write_date} | ${vo.hit}
            </li>
        </c:forEach> 
    </div>
    </ul>

    <!-- 리스트 더보기 -->
    <a id="moreView"><img src="/img/더보기.png" style="width:100px;"></a>

    <!-- 검색 -->
    <form action="" id="searchFrm">
        <select name="searchKey">
            <option value="subject">제목</option>
            <option value="content">내용</option>
            <option value="userid">작성자</option>
        </select>
        <input type="text" name="searchWord" id="searchWord"/>
        <input type="submit" value="Search"/>
    </form>
</div>
</body>