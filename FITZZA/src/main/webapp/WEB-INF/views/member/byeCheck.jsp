<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/mypage.css" type="text/css"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script>
$(document).ready(function(){ 
	$("#bye").click(function(){
			var answer;
			answer= confirm("탈퇴 시 게시물과 댓글은 모두 삭제되며, 복구할 수 없습니다.\n탈퇴하시겠습니까?");
			if(answer){
				$("#ByeFrm").submit();
			}
	});
});
</script>
<form method="post" action="byeOk" class="contents" id="ByeFrm">
	<ul>
		<li>아이디</li>
		<li>${vo.user_id}</li>
		<li style="display:none"><input type="text" name="email" value="${vo.email}"></li>
		<li>비밀번호</li>
		<li><input type="password" class="input02" id="user_pwd" name="user_pwd"/></li>
		<li><input type="button" id="bye" value="탈퇴"></li>
	</ul>
</form>