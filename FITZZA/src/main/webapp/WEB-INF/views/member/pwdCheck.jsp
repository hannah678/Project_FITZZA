<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="/css/mypage.css" type="text/css"/>

<form method="post" action="pwdCheckOk" id="contents">
	<ul>
		<li>아이디</li>
		<li><span>${vo.user_id}<span></li>
		<li>비밀번호</li>
		<li><input type="password" class="input02" id="user_pwd" name="user_pwd"/></li>
		<li><input type="submit"></li>
	</ul>
</form>
