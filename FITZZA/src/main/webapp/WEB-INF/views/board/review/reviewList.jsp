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