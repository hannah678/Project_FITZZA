<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

 <link rel="stylesheet" href="/css/login.css" type="text/css"/>

<!DOCTYPE html>
<script>
$(document).ready(function(){
	  $(".loginbtn").click(function(){
		  if($("#user_id").val()==""){
			  $('.userid').css('visibility','visible');
			  return false;
		  };
		  
		  if($("#user_pwd").val()==""){
			  $('.password').css('visibility','visible');
			  return false;
		  };
	  });
	  
	  $(".input01").on('focus',function(){
		  $('.inputMsg2').css('visibility','hidden');
	  });
	  
	  
});
</script>
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

<div id="login_container">
<section id="wrapper" class="layoutLogin">
       <div class="loginheader">
   		 <img src="${url}/img/LOgo2.png" style="width:70px; margin-top:100px;"/>
   		 <div style="white-space:nowrap;">─── Sign In ───</div>
  	   </div>
     <form method="post" action="/member/loginOk" id="form1">
  		 <div id="contents">
   			 <div class="loginSection">
    			 <div class="userlogin" id="userlogin">
  					<fieldset>
     				   <legend class="accounthidden">login ID</legend>
       					 <div class="id">
        					 <input type="text" class="input01" name="user_id" id="user_id" placeholder="UserID"/>
       					 </div>
       					 <p class="inputMsg2 userid" style="visibility:hidden;">ID를&nbsp입력하세요.</p>
    				     <div class="password">
      					     <input type="password" class="input01" name="user_pwd" id="user_pwd" placeholder="Password"/>
     				     </div>
     				     <p class="inputMsg2 password" style="visibility:hidden;">비밀번호를 입력하세요.</p>
       					 <div class="loginbtn">
        					 <input type="submit" class="button01" value="Login" style="margin-bottom:20px;"/>
       					 </div>
    				 </fieldset>
    			 </div>
   			  <input type="checkbox" value="idremem" style="margin-bottom:100px;"/> 아이디 기억
   			 </div>
   			 <hr/>
   		 <div style="width:400px; margin:0 auto;">
      		   <p class="loginmenu" style="font-size:0.8em; text-align: center;">
    				  아이디가 없으시다면? <a href="/member/join" class="join" onclick="">회원가입</a>
    		   </p>
 	    </div>
   		</div>
     </form>
</section>
<canvas id="glscreen"></canvas>
</div>