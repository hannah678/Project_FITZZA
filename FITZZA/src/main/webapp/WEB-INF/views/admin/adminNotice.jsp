<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	header, footer {display:none}
	#adminNotice_container {
		display:none;height:100vh;
		width:100vw;
	}
	#adminNotice_container h1 {
	font-size:30px;
	line-height:100px;
	display:inline-block;
	margin-left:-18%;
}
#adminNotice_container h2 {
	text-align:center;
	margin-top:20%;
	margin-left:10%;
	width:50%;
}
#notice_write_div{
	background-image: url(/img/notice_image.png); 
	background-size: 80%;
}
</style>
<script>
$(function(){
	$("#noticeBtn").click(function(){
		if($("#title").val()==''){
			alert("제목을 입력하세요");
			$("#title").focus();
			return false;
		}else if($("#content").val()==''){
			alert("공지 내용을 입력하세요");
			$("#content").focus();
			return false;
		}else{
			if(confirm("공지사항을 등록하시겠습니까?")){
				$("#noticeFrm").submit();
				console.log("submit");
			}
		}
	});
});
</script>
 <div id="adminNotice_container">
 	<h1>공지 작성 페이지</h1>
 	<div id="notice_write_div">
 		 <form method="post" action="/admin/noticeWriteOk" id="noticeFrm">
            <ul>
                <li><br/><br/><br/>제목 &emsp;  <input type="text" name="title" id="title" style="width : 600px" placeholder='  제목을 입력해주세요.'/></li>
				<hr/>
				<li>내용 &emsp;  <br/><textarea name="content" id="content" rows="18" cols="80"></textarea></li>
				<li><input type='button' value='공지사항 등록' id="noticeBtn"/></li>
			</ul>
		</form>
 	</div>
 </div>