<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <link rel="stylesheet" href="/css/login.css" type="text/css"/>
 <!DOCTYPE html>
<script>
  $(document).ready(function(){
	  
	  $("#joinid").on('blur',function(){
		  if($("#joinid").val()==""){
			  $('.userid').css('display','block');
			  return false;
		  };//공백시 경고
		  
		  var reg = /^[a-zA-z0-9]{8,16}$/;
		  var userid = $("#joinid").val();
		  
		  if(!reg.test(userid)){
			  $('.userid2').css('display','block');
			  return;
		  } // 유효하지 않을시 경고
	  });//아이디
	  
	  $("#joinpwd").on('blur',function(){
		  if($("#joinpwd").val()==""){
			  $('.userpwd').css('display','block');
			  return;
		  };//공백시 경고
		  
		  var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{10,20}$/;
		  var userpwd = $("#joinpwd").val();
		  
		  if(!reg.test(userpwd)){
			  $('.userpwd2').css('display','block');
			  return;
		  } // 유효하지 않을시 경고
	  });//비밀번호
	  
	  $("#joinpwdchk").on('blur',function(){
		  if($("#joinpwdchk").val()!==$("#joinpwd").val()){
			  $('.password').css('display','block');
			  return;
		  }
	  });//비밀번호 체크
	  
	  $("#joinname").on('blur',function(){
		  if($("#joinname").val()==""){
			  $('.username').css('display','block');
			  return;
		  };//공백시 경고
		  
		  var reg = /^[가-힣a-zA-z]{2,10}$/;
		  var username = $("#joinname").val();
		  
		  if(!reg.test(username)){
			  $('.username2').css('display','block');
			  return;
		  } // 유효하지 않을시 경고
	  });//이름
	  
	  $("#joinnickname").on('blur',function(){
		  if($("#joinnickname").val()==""){
			  $('.usernickname').css('display','block');
			  return;
		  };//공백시 경고
		  
		  var reg = /^[가-힣a-zA-z0-9]{2,10}$/;
		  var usernickname = $("#joinnickname").val();
		  
		  if(!reg.test(usernickname)){
			  $('.usernickname2').css('display','block');
			  return;
		  } // 유효하지 않을시 경고
	  });//닉네임
	  
	  $("#email01").on('blur',function(){
		  if($("#email01").val()==""){
			  $('.email1').css('display','block');
			  return;
		  }
		  var reg = /^[a-zA-z]{8,20}$/;
		  		  
		  if(!reg.test($("#email01").val()) && $("#email01").val()!==""){
			  $('.email2').css('display','block');
			  return;
		  }
		  	  
	  });
	  
	  $("#email02").on('blur',function(){
		  if($("#email02").val()==""){
			  $('.email3').css('display','block');
			  return;
		  }
		  var reg2 = /^[a-zA-Z]{2,8}[.][a-zA-Z]{2,4}([.][a-zA-Z]{2,4})?$/;
		  
		  if(!reg2.test($("#email02").val()) && $("#email02").val()!=""){
			  $('.email4').css('display','block');
			  return;
		  }
	  })//이메일
	  
	  $("#jointel").on('blur',function(){
		  if($("#jointel").val()==""){
			  $('.tel1').css('display','block');
			  return;
		  }
		  var reg = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;
		  
		  if(!reg.test($("#jointel").val()) && $("#jointel").val()!=""){
			  $('.tel2').css('display','block');
			  return;
		  }
	  })// 연락처
	  
	  $("#emailchk").on('click',function(){
		  $('#Codebox').css('display','block');
	  }); //이메일 인증시 인증코드 나오게함.
	  
	  $(".joinbtn").on('click',function(){
		  console.log("확인");
		  
		  /*if($("#ConfirmCode").val() ==""){
			  $('.ConfirmCode1').css('display','block');
		  }*/
		  
		  var i = 1;
		  $('.inputMsg').each(function(){
			  if($(this).css('display')=='block' && $("#joinpwd").val()=="" && $("#joinpwd").val()==""
					  && $("#joinname").val()=="" && $("#joinnickname").val()==""&& $("#email01").val()==""
					  && $("#email02").val()==""&& $("#jointel").val()==""){
				return false;
			  }
			  i= i+1;
			  if( i == 17){
				$("#contents").submit();
				return false;
			  };
		  });
	  }); //경고문 없으면 제출 가능하게함
	  
	  $(".input01").on('focus',function(){
		  $('.inputMsg').css('display','none');
	  }); // 수정하려고 커서 올리면 경고문들 없어짐.
	    
});
</script>
</head>
<body>
<section id="join_wrapper" class="layoutJoin">
  <form method="post" action="/member/memberEditOk" id="contents">
   <div class="joinSection">
    <fieldset>
       <legend class="Joinhidden"></legend>
       <div style="font-size: 4em; text-align: center; margin-bottom:50px;">회원정보 수정</div>
       <ul id="joinMenu">
         <li class="joinbox" ><input type="text" name="user_id" id="joinid" value="${vo.user_id}" class="input01" readonly/></li>
         <li class="joinbox" ><input type="password" name="user_pwd" id="joinpwd"placeholder="비밀번호" class="input01"/></li>
         <li class="joinbox" ><input type="password" name="user_pwdchk" id="joinpwdchk" placeholder="비밀번호 확인" class="input01"/></li>
         <li class="joinbox" ><input type="text" name="user_name" id="joinname" value= "${vo.user_name}" class="input01" readonly/></li>  
         <li class="joinbox" ><input type="text" name="user_nickname" id="joinnickname" value="${vo.user_nickname}" class="input01"/></li> 
         <li><input type="text" name="email1" id="email1" value="${vo.email1 }" class="input01" readonly/>@<input type="text" name="email2" id="email2" class="input01" value="${vo.email2}" readonly/></li> 
         
         <li class="joinbox"><input type="text" name="tel" id="jointel" value="${vo.tel}" class="input01"/></li> 
       </ul>
        <div class="joinbtn">
         <input type="button" class="button02" value="회원정보 수정"/>
        </div>
    </fieldset>
    <div id="alertmenu">
   	 	<p class="inputMsg userid" style="display:none;">아이디를&nbsp입력하세요.</p>
    	<p class="inputMsg userid2" style="display:none;">아이디는&nbsp8~16글자 사이로 입력해주세요.<br/>영어대소문자,숫자로 등록 가능합니다.</p>
    	<p class="inputMsg userpwd" style="display:none;">패스워드를&nbsp입력하세요.</p>
    	<p class="inputMsg userpwd2" style="display:none;">패스워드를&nbsp10~20글자 사이로 입력해주세요.<br/>영어 대문자, 소문자, 특수문자, 숫자가 포함되어야합니다.</p>
    	<p class="inputMsg password" style="display:none;">비밀번호가 일치하지 않습니다.</p>
    	<p class="inputMsg username" style="display:none;">이름을 입력하세요.</p>
    	<p class="inputMsg username2" style="display:none;">이름을 정확히 기입해주세요.</p>
    	<p class="inputMsg usernickname" style="display:none;">닉네임을 입력하세요.</p>
    	<p class="inputMsg usernickname2" style="display:none;">닉네임은 2~10글자 사이로 기입해주세요.<br/> 특수문자는 사용하실 수 없습니다.</p>
    	<p class="inputMsg email1" style="display:none;">이메일을 입력하세요.</p>
        <p class="inputMsg email2" style="display:none;">이메일을 잘못 입력했습니다.</p>
        <p class="inputMsg email3" style="display:none;">도메인을 입력하세요.</p>
        <p class="inputMsg email4" style="display:none;">도메인을 잘못 입력했습니다.</p>
        <p class="inputMsg tel1" style="display:none;">연락처를 입력하세요.</p>
        <p class="inputMsg tel2" style="display:none;">연락처를 잘못 입력했습니다.</p>
        <p class="inputMsg ConfirmCode1" style="display:none;">이메일 인증을 해주세요.</p>
    </div>
    </div>
  </form>
</section>