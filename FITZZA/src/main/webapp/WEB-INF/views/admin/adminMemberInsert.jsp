<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
header, footer {display:none}
ul > li {margin:10px 20px;}
ul > li:nth-child(1) input {margin-left:60px}
ul > li:nth-child(2) input {margin-left:42px}
ul > li:nth-child(3) input {margin-left:80px}
ul > li:nth-child(4) input {margin-left:60px}
ul > li:nth-child(5) span {margin-right:65px}
ul > li:nth-child(6) input {margin-left:45px}
form > input {margin: 10px 0 0 270px}
</style>
<form method="post" action="/admin/MemberInsertOk">
	<ul id="adminMemberInsertBox">
    	<li class="joinbox" >아이디 <input type="text" name="user_id" id="joinid" placeholder="아이디" class="input01"/></li>
        <li class="joinbox" >비밀번호 <input type="password" name="user_pwd" id="joinpwd"placeholder="비밀번호" class="input01"/></li>
        <li class="joinbox" >이름 <input type="text" name="user_name" id="joinname" placeholder="이름" class="input01"/></li>  
        <li class="joinbox" >닉네임 <input type="text" name="user_nickname" id="joinnickname" placeholder="닉네임" class="input01"/></li> 
        <li><span>이메일</span><input type="text" name="email1" id="email1" placeholder="이메일" class="input01"/>@<input type="text" name="email2" id="email2" class="input01"/></li> 
        <li class="joinbox">전화번호<input type="text" name="tel" id="jointel" placeholder="전화번호(000-0000-0000)" class="input01"/></li>
    </ul>
    <input type="submit" value="등록하기"/>
</form>