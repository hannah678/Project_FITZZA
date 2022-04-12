<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<link rel="stylesheet" href="/css/review.css" type="text/css">
</head>
<body>
<div id = review-wrapper>
	<div class="review_container">
		<ul>
			<li class="Top_menu"><div id="Top_name"><a href=#">제목</a></div><div style="float:right"><a href=#">목록으로</a></div></li>
			<li><div id="main_img"><img src="../images/31.png"></div></li>
			<li>
				<div id="content">본문</div>
			</li>
			<li>
				<div id="content_img">
					추가 상세 이미지
					 <!--     <c:if test="${vo.file2!=null && vo.file2 !=''}">
                              <img src="/upload/${vo.file2}" width="300"/>
                       	  	   </c:if>
                      		  <c:if test="${vo.file3!=null && vo.file3 !=''}">
                              <img src="/upload/${vo.file3}" width="300"/>
                      		   </c:if>
                      		  <c:if test="${vo.file4!=null && vo.file4 !=''}">
                      	      <img src="/upload/${vo.file4}" width="300"/>
                     		   </c:if>
                      		  <c:if test="${vo.file5!=null && vo.file5 !=''}">
                      		      <img src="/upload/${vo.file5}" width="300"/>
                      		   </c:if>		-->
				</div>
			</li>
			<hr>
			<li class="Top_menu"><div id="reportModal" class="button02">신고</div> <div class="button01">수정</div> <div class="button01">삭제</div></li>
			<hr>
			<li><table>
				<tbody>
				<tr>
				<td colspan='3' style="text-align:center;">작성자 정보</td>
				</tr>
					<tr>
						<td><img src="${vo.profile_image}" alt="프로필 이미지"><img id="level_frame" alt="등급 프레임 이미지"></td>
						<td>작성자 이름</td>
						<td>신고받은 횟수</td>
					</tr>
				</tbody>
			</table></li>
		</ul>
	</div>
	<hr/>
	<div class="reply"><!--  댓글 다는곳 -->
	 댓글
	</div>
</div>