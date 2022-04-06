<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
  $(document).ready(function(){
	  $("#chkbtn01").click(function(){
		  if($("#joinId").val()==""){
			  $('.userid').css('display','block');
			  return false;
		  };
		  
		  var reg = /^[a-zA-z_]{8,12}$/;
		  var userid = $("#joinId").val();
		  
		  if(!reg.test(userid)){
			  $('.userid2').css('display','block');
			  return false;
		  }
	  });
	  
	  $("#joinPWDch").on('blur',function(){
		  if($("#joinPWDch").val()!==$("#joinPWD").val()){
			  $('.password').css('display','block');
			  return false;
		  }
	  });
	  

	  
	  $("#chkbtn02").click(function(){
	      if($("#joinNickId").val()==""){
				  $('.usernickname').css('display','block');
				  return false;
		  };
		  
		  var reg = /^[가-힣a-zA-Z]{1,8}$/;
		  
		  if(!reg.test($("#joinNickId").val()) && $("#joinNickId").val()!==""){
			  $('.usernickname2').css('display','block');
			  return false;
		  }
	  });
	  
	  $("#joinEmail1").on('blur',function(){
		  if($("#joinEmail1").val()==""){
			  $('.email1').css('display','block');
			  return false;
		  }
		  
		  var reg = /^[a-zA-z]{8,15}$/;
		  		  
		  if(!reg.test($("#joinEmail1").val()) && $("#joinEmail1").val()!==""){
			  $('.email2').css('display','block');
			  return false;
		  }
		  	  
	  });
	  
	  $("#joinEmail2").on('blur',function(){
		  var reg2 = /^[a-zA-Z]{2,8}[.][a-zA-Z]{2,4}([.][a-zA-Z]{2,4})?$/;
		  
		  if(!reg2.test($("#joinEmail2").val()) && $("#joinEmail2").val()!==""){
			  $('.email3').css('display','block');
			  return false;
		  }
		  
	  })
	 	  
	  $(".input02").on('focus',function(){
		  $('.inputMsg').css('display','none');
	  });
	  
	  $(".button02").on('click',function(){
		 if($('.inputMsg').css('display')=='none' && $('#joinId').val()!='' && $('#joinPWD').val()!='' && $('#joinPWDch').val()!=''){
			 $("#contents").submit();
		 }
	  });
	  
	  $("#joinId").keyup(function(){
		  var userid = $("#joinId").val();
		  if(userid !='' && userid.length>=8 && userid.length<=12){
			  var url = "/myapp/member/joinIdCheck";
		  $.ajax({
			  url : url,
			  data : "userid="+userid,
			  type : "POST",
			  success:function(result){
				  if(result>0){//사용불가
					$("#idY").css("display","none");
				    $("#idN").css("color","red");
				  }else{//사용가능
					$("#idN").css("display","none");
					$("#idY").css("display","block");
					$("#idY").css("color","blue");
				  }
			  }
		  });
		 }else{// 사용불가
		   $("#idY").css("display","none");
		   $("#idN").css("display","block");
		 }
	  });
});
</script>
<section id="join_wrapper" class="layoutJoin">
  <form method="post" action="/member/memberEditOk" id="contents">
   <div class="joinSection">
    <fieldset>
       <legend class="Joinhidden"></legend>
       <div>
        <h2>아이디</h2>
        <div class= "joinbox">
         ${vo.user_id}
        </div>
        </div>
        <p class="inputMsg userid" style="display:none;">ID를&nbsp입력하세요.</p>
        <p class="inputMsg userid2" style="display:none;">ID는&nbsp8~12글자 사이여야합니다.<br/>영어대소문자,숫자만 등록 가능합니다.</p>
        <p class="inputMsg userid3" id="idY" style="display:none; padding-top:10px;">사용 가능한 아이디입니다.</p>
        <p class="inputMsg userid3" id="idN" style="display:none; padding-top:10px;">사용 불가능한 아이디입니다.</p>
        <div class="joinpwd">
        <h2>비밀번호</h2>
         <input type="password" class="input02" id="user_pwd" name="user_pwd"/>
        </div>
<!--         <div class="joinpwd">
        <h2>비밀번호 확인</h2>
         <input type="password" class="input02" id="joinPWDch"/>
        </div>
        <p class="inputMsg password" style="display:none;">비밀번호가 일치하지 않습니다.</p>
        <div class="joinNick">-->
        <h2>이름</h2> 
        ${vo.user_name}
        <h2>닉네임</h2>
        <input type="text" class="input02" id="user_nickname" name="user_nickname" value="${vo.user_nickname}"/>
        </div> 
        <div>
         <input type="button" class="chkbtn01" id="chkbtn02" value="확인"/>
         </div>
         <p class="inputMsg usernickname" style="display:none;">닉네임을 입력하세요.</p>
         <p class="inputMsg usernickname2" style="display:none;">닉네임은&nbsp1~8글자 사이여야합니다.<br/>한글,영어대소문자만 등록 가능합니다.</p>
        <div>
        <h2>전화번호</h2>
        <input type="text" class="input02" id="tel" name="tel" value="${vo.tel}"> 
        <h2>이메일 주소</h2>
         <div class="joinemail">
          ${vo.email1 }@${vo.email2}
         </div>
         <p class="inputMsg email1" style="display:none;">이메일을 입력하세요.</p>
         <p class="inputMsg email2" style="display:none;">이메일을 잘못 입력했습니다.</p>
         <p class="inputMsg email3" style="display:none;">도메인을 잘못 입력했습니다.</p>
        </div>
        <div class="joinbtn">
         <input type="button" class="button02" value="수정"/>
        </div>
    </fieldset>
     <div>
         <input type="button" class="chkbtn01" id="chkbtn01" value="확인"/>
        </div>
    </div>
  </form>
</section>