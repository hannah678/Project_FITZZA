<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <link rel="stylesheet" href="/css/login.css" type="text/css"/>
 <!DOCTYPE html>
<script>
  $(document).ready(function(){
	  $("#emailchk").on('click',function(){
		  $('#Codebox').css('display','block');
	  });
	  
	  $(".button02").on('click',function(){
		 if($('.inputMsg').css('display')=='none'){
			 $("#contents").submit();
		 }
	  });
	  
});
</script>
</head>
<body>
<section id="join_wrapper" class="layoutJoin">
  <form method="post" action="/member/joinOk" id="contents">
   <div class="joinSection">
    <fieldset>
       <legend class="Joinhidden"></legend>
       <div style="font-size: 4em; text-align: center; margin-bottom:50px;">가입하기</div>
       <ul id="joinMenu">
         <li class="joinbox" ><input type="text" name="user_id" id="joinid" placeholder="아이디"/></li>
         <li class="joinbox" ><input type="text" name="user_pwd" id="joinpwd"placeholder="비밀번호"/></li>
         <li class="joinbox" ><input type="text" name="user_pwdchk" id="joinpwdchk" placeholder="비밀번호 확인"/></li>
         <li class="joinbox" ><input type="text" name="user_name" id="joinname" placeholder="이름"/></li>  
         <li class="joinbox" ><input type="text" name="user_nickname" id="joinnickname" placeholder="닉네임"/></li> 
         <li><input type="text" name="email1" id="email1" placeholder="이메일"/>@<input type="text" name="email2" id="email2"/><button type="button" id="emailchk">인증</button></li> 
         <li id="Codebox" style="display:none"><input type="text" name="ConfirmCode" id="ConfirmCode" placeholder="인증코드 입력"/></li> 
         <li class="joinbox"><input type="text" name="tel" id="jointel" placeholder="전화번호(000-0000-0000)"/></li> 
       </ul>
        <div class="joinbtn">
         <input type="button" class="button02" value="가입하기"/>
        </div>
    </fieldset>
    <div>
    
    </div>
    </div>
  </form>
</section>