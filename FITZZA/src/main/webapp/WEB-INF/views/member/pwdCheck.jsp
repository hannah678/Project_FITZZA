<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<form method="post" action="pwdCheckOk" id="contents">
<h2>아이디</h2>
	${vo.user_id}
<h2>비밀번호</h2>
	<input type="password" class="input02" id="user_pwd" name="user_pwd"/>
<input type="submit">
</form>
</div>
