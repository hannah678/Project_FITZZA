<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--  등록시 -->
<c:if test="${cnt>0}">
  <script>
     alert("회원이 등록되었습니다.");
     opener.parent.location.reload();
     window.close();  
  </script>
</c:if>
<!--  등록실패했을때 -->
<c:if test="${cnt==null || cnt ==0}">
  <script>
     alert("회원등록 실패하였습니다.");
     history.go(-1);// 이전페이지로 보낸다.
  </script>
</c:if>