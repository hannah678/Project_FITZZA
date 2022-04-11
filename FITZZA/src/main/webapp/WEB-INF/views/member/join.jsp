<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <link rel="stylesheet" href="/css/login.css" type="text/css"/>
 <!DOCTYPE html>
<script id="2d-fragment-shader" type="x-shader/x-fragment">// <![CDATA[
          #ifdef GL_ES
          precision highp float;
          #endif
        
          #define PI 3.14159265359;
        
          uniform vec2 u_resolution;
          uniform vec2 u_mouse;
          uniform float u_time;
          uniform float u_xpos;
          uniform float u_ypos;
        
        vec3 mod289(vec3 x) {
          return x - floor(x * (1.0 / 289.0)) * 289.0;
        }
        
        vec4 mod289(vec4 x) {
          return x - floor(x * (1.0 / 289.0)) * 289.0;
        }
        
        vec4 permute(vec4 x) {
             return mod289(((x*34.0)+1.0)*x);
        }
        
        vec4 taylorInvSqrt(vec4 r)
        {
          return 1.79284291400159 - 0.85373472095314 * r;
        }
        
        float snoise(vec3 v)
          { 
          const vec2  C = vec2(1.0/6.0, 1.0/3.0) ;
          const vec4  D = vec4(0.0, 0.5, 1.0, 2.0);
        
          vec3 i  = floor(v + dot(v, C.yyy) );
          vec3 x0 =   v - i + dot(i, C.xxx) ;
        
          vec3 g = step(x0.yzx, x0.xyz);
          vec3 l = 1.0 - g;
          vec3 i1 = min( g.xyz, l.zxy );
          vec3 i2 = max( g.xyz, l.zxy );
        
          vec3 x1 = x0 - i1 + C.xxx;
          vec3 x2 = x0 - i2 + C.yyy;
          vec3 x3 = x0 - D.yyy;
        
          i = mod289(i); 
          vec4 p = permute( permute( permute( 
                     i.z + vec4(0.0, i1.z, i2.z, 1.0 ))
                   + i.y + vec4(0.0, i1.y, i2.y, 1.0 )) 
                   + i.x + vec4(0.0, i1.x, i2.x, 1.0 ));
        
          float n_ = 0.142857142857;
          vec3  ns = n_ * D.wyz - D.xzx;
        
          vec4 j = p - 49.0 * floor(p * ns.z * ns.z);
        
          vec4 x_ = floor(j * ns.z);
          vec4 y_ = floor(j - 7.0 * x_ );
        
          vec4 x = x_ *ns.x + ns.yyyy;
          vec4 y = y_ *ns.x + ns.yyyy;
          vec4 h = 1.0 - abs(x) - abs(y);
        
          vec4 b0 = vec4( x.xy, y.xy );
          vec4 b1 = vec4( x.zw, y.zw );
        
          vec4 s0 = floor(b0)*2.0 + 1.0;
          vec4 s1 = floor(b1)*2.0 + 1.0;
          vec4 sh = -step(h, vec4(0.0));
        
          vec4 a0 = b0.xzyw + s0.xzyw*sh.xxyy ;
          vec4 a1 = b1.xzyw + s1.xzyw*sh.zzww ;
        
          vec3 p0 = vec3(a0.xy,h.x);
          vec3 p1 = vec3(a0.zw,h.y);
          vec3 p2 = vec3(a1.xy,h.z);
          vec3 p3 = vec3(a1.zw,h.w);
        
          vec4 norm = taylorInvSqrt(vec4(dot(p0,p0), dot(p1,p1), dot(p2, p2), dot(p3,p3)));
          p0 *= norm.x;
          p1 *= norm.y;
          p2 *= norm.z;
          p3 *= norm.w;
        
          vec4 m = max(0.6 - vec4(dot(x0,x0), dot(x1,x1), dot(x2,x2), dot(x3,x3)), 0.0);
          m = m * m;
          return 42.0 * dot( m*m, vec4( dot(p0,x0), dot(p1,x1), 
                                        dot(p2,x2), dot(p3,x3) ) );
          }
        
          void main() {
            
            vec3 color1 = vec3(84.0/255.0,186.0/255.0,185.0/255.0); 
            vec3 color2 = vec3(247.0/255.0,236.0/255.0,222.0/255.0);
            vec3 color3 = vec3(233.0/255.0,218.0/255.0,193.0/255.0);
            vec3 color4 = vec3(84.0/255.0,186.0/255.0,185.0/255.0);
            vec3 color5 = vec3(213.0/255.0,239.0/255.0,239.0/255.0);
            vec3 color6 = vec3(247.0/255.0,236.0/255.0,226.0/255.0);
            vec2 lt = vec2(gl_FragCoord.x + u_xpos, gl_FragCoord.y + u_ypos);
            vec2 st = lt.xy/u_resolution.xy;
            st.x *= u_resolution.x/u_resolution.y;
            vec3 color = vec3(0.0);
            vec2 pos = vec2(st*0.6);
            float DF = 0.0;
            float a = 0.0;
            vec2 vel = vec2(u_time*.1);
            st.xy *= 0.4;
            float r = snoise(vec3(st.x,st.y,u_time * 0.1));
            
          if(r > 0.60){
            color = color5;
          } else if(r > 0.20){
            color = color4;
          } else if(r > -0.20){
            color = color3;
          } else if(r > -0.60){
            color = color2;
          } else if(r > -2.0){
            color = color1;
          }
            
            gl_FragColor = vec4(color,1.0);
          }
        // ]]>
      </script>
        <script id="2d-vertex-shader" type="x-shader/x-vertex">// <![CDATA[
          attribute vec2 a_position;
          void main() {
            gl_Position = vec4(a_position, 0, 1);
          }
          // ]]>
        </script>
        <script type="text/javascript" src="/js/login_bg.js"></script>
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
	  
	  $("#joinid").blur(function(){
		  var userid = $("#joinid").val();
		  if(userid !='' && userid.length>=8 && userid.length<=16){
			  var url = "/member/memberIdCheck";
		  $.ajax({
			  url : url,
			  data : "user_id="+userid,
			  type : "POST",
			  success:function(result){
				  if(result>0){//사용불가
				    $("#idN").css("display","block");
				  }else{//사용가능
					$("#idN").css("display","none");
				  }
			  }
		  });
		  }
	  }); //아이디 중복 검사
	  
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
	  
	  $("#joinnickname").blur(function(){
		  var usernickname = $("#joinnickname").val();
		  if(usernickname !='' && usernickname.length>=2 && usernickname.length<=10){
			  var url = "/member/memberNickCheck";
		  $.ajax({
			  url : url,
			  data : "user_nickname="+usernickname,
			  type : "POST",
			  success:function(result){
				  if(result>0){//사용불가
				    $("#nickN").css("display","block");
				  }else{//사용가능
					$("#nickN").css("display","none");
				  }
			  }
		  });
		  }
	  }); //닉네임 중복 검사
	  
	  $("#email1").on('blur',function(){
		  if($("#email1").val()==""){
			  $('.email1').css('display','block');
			  return;
		  }
		  var reg = /^[a-zA-z]{8,20}$/;
		  		  
		  if(!reg.test($("#email1").val()) && $("#email1").val()!==""){
			  $('.email2').css('display','block');
			  return;
		  }
		  	  
	  });
	  
	  $("#email2").on('blur',function(){
		  if($("#email2").val()==""){
			  $('.email3').css('display','block');
			  return;
		  }
		  var reg2 = /^[a-zA-Z]{2,8}[.][a-zA-Z]{2,4}([.][a-zA-Z]{2,4})?$/;
		  
		  if(!reg2.test($("#email2").val()) && $("#email2").val()!=""){
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
		  /*if($("#ConfirmCode").val() ==""){
			  $('.ConfirmCode1').css('display','block');
		  }*/
		 
		  if( $("#joinid").val()==''||$("#joinpwd").val()==''||$("#joinpwdchk").val()==''||
			  $("#joinname").val()==''||$("#joinnickname").val()==''||$("#email1").val()==''||
			  $("#email2").val()==''||
		     $(".userid").css('display')=='block' || $(".userid2").css('display')=='block' ||
			 $(".userpwd").css('display')=='block' || $(".userpwd2").css('display')=='block' ||
			 $(".password").css('display')=='block' ||
			 $(".username").css('display')=='block' || $(".username2").css('display')=='block' ||
			 $(".usernickname").css('display')=='block' || $(".usernickname2").css('display')=='block' ||
			 $(".useremail1").css('display')=='block' || $(".useremail2").css('display')=='block' ||
			 $(".useremail3").css('display')=='block' || $(".useremail4").css('display')=='block' ||
			 $(".usertel1").css('display')=='block' || $(".usertel2").css('display')=='block'
		  ){
			  console.log("에러체크용 콘솔메세지");
			  return false;
		  }else{
			  $("#contents").submit();
		  }
	  }); //경고문 없으면 제출 가능하게함
	  
	  $(".input01").on('focus',function(){
		  $('.inputMsg').css('display','none');
	  }); // 수정하려고 커서 올리면 경고문들 없어짐.
	    
});
</script>
</head>
<body>
<section id="join_wrapper" class="layoutJoin">
  <form method="post" action="/member/joinOk" id="contents">
   <div class="joinSection">
    <fieldset>
       <legend class="Joinhidden"></legend>
       <div style="font-size: 1.8em; font-weight:800; text-align: center; margin-bottom:30px; margin-top:120px;">회원가입</div>
       <ul id="joinMenu">
         <li class="joinbox" ><input type="text" name="user_id" id="joinid" placeholder="아이디" class="input01"/></li>
         <li class="joinbox" ><input type="password" name="user_pwd" id="joinpwd"placeholder="비밀번호" class="input01"/></li>
         <li class="joinbox" ><input type="password" name="user_pwdchk" id="joinpwdchk" placeholder="비밀번호 확인" class="input01"/></li>
         <li class="joinbox" ><input type="text" name="user_name" id="joinname" placeholder="이름" class="input01"/></li>  
         <li class="joinbox" ><input type="text" name="user_nickname" id="joinnickname" placeholder="닉네임" class="input01"/></li> 
         <li><input type="text" name="email1" id="email1" placeholder="이메일" class="input01"/>@<input type="text" name="email2" id="email2" class="input01"/><button type="button" id="emailchk">인증</button></li> 
         <li id="Codebox" style="display:none"><input type="text" name="ConfirmCode" id="ConfirmCode" placeholder="인증코드 입력"/></li> 
         <li class="joinbox"><input type="text" name="tel" id="jointel" placeholder="전화번호(000-0000-0000)" class="input01"/></li> 
       </ul>
        <div class="joinbtn">
         <input type="button" class="button02" value="가입하기"/>
        </div>
    </fieldset>
    <div id="alertmenu">
   	 	<p class="inputMsg userid" style="display:none;">아이디를&nbsp입력하세요.</p>
    	<p class="inputMsg userid2" style="display:none;">아이디는&nbsp8~16글자 사이로 입력해주세요.<br/>영어대소문자,숫자로 등록 가능합니다.</p><br/>
        <p class="inputMsg userid3" id="idN" style="display:none;">사용 불가능한 아이디입니다.(중복됨)</p>
    	<p class="inputMsg userpwd" style="display:none;">패스워드를&nbsp입력하세요.</p>
    	<p class="inputMsg userpwd2" style="display:none;">패스워드를&nbsp10~20글자 사이로 입력해주세요.<br/>영어 대문자, 소문자, 특수문자, 숫자가 포함되어야합니다.</p><br/>
    	<p class="inputMsg password" style="display:none;">비밀번호가 일치하지 않습니다.</p>
    	<p class="inputMsg username" style="display:none;">이름을 입력하세요.</p>
    	<p class="inputMsg username2" style="display:none;">이름을 정확히 기입해주세요.</p>
    	<p class="inputMsg usernickname" style="display:none;">닉네임을 입력하세요.</p>
    	<p class="inputMsg usernickname2" style="display:none;">닉네임은 2~10글자 사이로 기입해주세요.<br/> 특수문자는 사용하실 수 없습니다.</p><br/>
    	<p class="inputMsg usernickname3" id="nickN" style="display:none;">사용 불가능한 닉네임입니다.(중복됨)</p>
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
<canvas id="glscreen"></canvas>
</body>