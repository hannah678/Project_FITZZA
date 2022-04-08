<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
    <meta charset="UTF-8">
    <title>FITZZA | 중고거래</title>
</head>
<link rel="stylesheet" href="/css/oldlist.css" type="text/css">
<body>
<div class="oldboard">
    <h2>중고거래</h2>
    <div id="write">
        <a href="/board/old/oldWrite">글쓰기</a>
    </div>
    <ul class="oldlist">
        <li>지역</li>
        <li>제목</li>
        <li>작성자</li>
        <li>작성일</li>
        <li>조회</li>


        <li>서울</li>
        <li><a href=""><img src="../img/옷1.jpg"/></a></li>
        <li><a href="">남성 (M) 나이키 스포츠 바람막이</a></li>
        <li><img src="../img/준영이.png" style="width:20px; height:20px; border-radius: 70%;"/>도발이</li>
        <li>04-01</li>
        <li>123</li>
        
        <li>강원</li>
        <li><a href=""><img src="../img/옷2.jpg"/></a></li>
        <li><a href="">고어텍스 정가 40 노스페이스아노락</a></li>
        <li><img src="../img/준영이.png" style="width:20px; height:20px; border-radius: 70%;"/>도발이</li>
        <li>04-01</li>
        <li>1234</li>

        <li>경기</li>
        <li><a href=""><img src="../img/옷3.jpg"/></a></li>
        <li><a href="">나이키 acg 라이트웨이트 자켓 블랙 L사이즈</a></li>
        <li><img src="../img/준영이.png" style="width:20px; height:20px; border-radius: 70%;"/>도발이</li>
        <li>04-01</li>
        <li>12345</li>

        <li>경남</li>
        <li><a href=""><img src="../img/옷4.jpg"/></a></li>
        <li><a href="">L 노스페이스 써밋 고어텍스 나일론 2way 블랙 바람막이</a></li>
        <li><img src="../img/준영이.png" style="width:20px; height:20px; border-radius: 70%;"/>도발이</li>
        <li>04-01</li>
        <li>123456</li>

        <!-- 게시물 리스트 -->
        <!--  <c:forEach var="" items="">
            <li>Board_old.city</li>
            <li><a href="/board/old/oldView?board_num=${vo.board_num}"><img src="/webapp/upload/${vo.file1}"/></a></li>
            <li><a href="">Board.title</a></li>
            <li><img src="profile_image" style="width:20px; height:20px; border-radius: 70%;"/>User.user_nickname</li>
            <li>Board.write_date</li>
            <li>Board.hit</li>
        </c:forEach>-->

        <!-- 게시물 리스트 페이징 -->
        <ul class="paging">
            <!-- <c:if test="">
                <li>이전</li>
            </c:if>
            <c:if test="">
                <li><a href="">이전</a></li>
            </c:if> -->
            <!-- <c:forEach var="" begin="" end="">
                <c:if test="">
                    <c:if test="">
                        <li style="background-color:#fff58c; border-radius:360px; font-weight:bold;">
                    </c:if>
                    <c:if test="">
                        <li>
                    </c:if>
                    <a href="">${p}</a></li>
                </c:if>
            </c:forEach> -->
            
            <!-- 삭제 -->
            <li><a href="">이전</a></li>
            <li style="background-color:#fff58c; border-radius:360px; font-weight:bold;">1</li>
            <li>2</li>
            <li>3</li>
            <li>4</li>
            <li>5</li>
            <li><a href="">다음</a></li> <!-- 삭제 -->

<!--             <c:if test="">
                <li>다음</li>
            </c:if>
            <c:if test="">
                <li><a href="">다음</a></li>
            </c:if> -->
        </ul>
    
        <form action="" id="searchFrm">
            <select name="searchKey">
                <option value="subject">제목</option>
                <option value="content">내용</option>
                <option value="city">지역</option>
                <option value="userid">작성자</option>
            </select>
            <input type="text" name="searchWord" id="searchWord"/>
            <input type="submit" value="Search"/>
        </form>
    </ul>
</div>
</body>