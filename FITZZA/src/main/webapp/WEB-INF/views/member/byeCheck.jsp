<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/mypage.css" type="text/css"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

<form method="post" action="byeOk" class="contents">
	<ul>
		<li>아이디</li>
		<li>${vo.user_id}</li>
		<li style="display:none"><input type="text" name="email" value="${vo.email}"></li>
		<li>비밀번호</li>
		<li><input type="password" class="input02" id="user_pwd" name="user_pwd"/></li>
		<li><input type="submit" value="탈퇴"></li>
	</ul>
</form>