<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/qnaList.css" type="text/css">
<body>
<div class="qnaboard">
    <br><br><br><br><br><br>
    <h1>패션 관련 그 어떤 질문이라도 궁금하면 뭐든지</h1>
    <h2>Q & A</h2>
    <h5>도배/홍보성 글은 삭제 및 경고 처리됩니다.</h5>
    <div id="write">
        <a href="">글쓰기</a>
    </div>
    <ul class="qnalist">
        <li>번호</li>
        <li>제목</li>
        <li>작성자</li>
        <li>날짜</li>
        <li>조회</li>


        <li>124</li>
        <li><a href="">트러커 어디껀지 알고싶어요ㅜㅜ</a></li>
        <li><img src="../img/준영이.png" style="width:20px; height:20px; border-radius: 70%;"/>도발이</li>
        <li>04-01</li>
        <li>123</li>
        
        <li>123</li>
        <li><a href="">여자 봅 셋업 추천해주세용</a></li>
        <li><img src="../img/준영이.png" style="width:20px; height:20px; border-radius: 70%;"/>도발이</li>
        <li>04-01</li>
        <li>1234</li>

        <li>122</li>
        <li><a href="">영국 힙스토어 아시는분?</a></li>
        <li><img src="../img/준영이.png" style="width:20px; height:20px; border-radius: 70%;"/>도발이</li>
        <li>04-01</li>
        <li>12345</li>

        <li>121</li>
        <li><a href="">무신사 가품판매 입막음한거에 대해서 입장 밝힌거 없나요?</a></li>
        <li><img src="../img/준영이.png" style="width:20px; height:20px; border-radius: 70%;"/>도발이</li>
        <li>04-01</li>
        <li>123456</li>

        <!-- 게시물 리스트 -->
        <!-- <c:forEach var="" items="">
            <li>Board_old.city</li>
            <li><a href=""><img src="prod_image"/></a></li>
            <li><a href="">Board.title</a></li>
            <li><img src="profile_image" style="width:20px; height:20px; border-radius: 70%;"/>User.user_nickname</li>
            <li>Board.write_date</li>
            <li>Board.hit</li>
        </c:forEach> -->

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
                <option value="userid">작성자</option>
            </select>
            <input type="text" name="searchWord" id="searchWord"/>
            <input type="submit" value="Search"/>
        </form>
    </ul>
</div>
</body>