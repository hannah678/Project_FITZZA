<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--  등록시 -->
<c:if test="${cnt>0}">
  <script>
     alert("회원이 등록되었습니다. 로그인페이지로 이동합니다.");
     location.href="/member/login";
  </script>
</c:if>
<!--  등록실패했을때 -->
<c:if test="${cnt==null || cnt ==0}">
  <script>
     alert("회원등록 실패하였습니다.");
     history.go(-1);// 이전페이지로 보낸다.
  </script>
</c:if>