<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/mypage.css" type="text/css"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

<style>
*{font-family:'Nanum pen script'; font-size:30px;text-decoration: none; }
a {font-size:24px}
a:link {color:#fff; text-decoration: none;}
a:visited {color:#fff}
.my_list_title li {font-size:24px; font-weight:600;}
</style>
<script>
window.onload=function(){
	//프로필
	var exp = ${vo.exp};
	var x = document.getElementById("user_grade");
	var y = document.getElementById("level_frame");
	
	x.innerText="level ${vo.grade}";
	y.src="${vo.frame_img}";
	
	// 게시물 리스트
	var startNum = $("#my_list_contents03 li").length/5; // list안의 li태그의 개수
		var addListHtml = "";
		 alert(startNum); 
		var url;
		var param;
		const params = new URL(window.location.href).searchParams;

		var pathname = window.location.pathname;
		var pn = pathname.substring(pathname.lastIndexOf('/')+1);
		if(pn=='myPage'){
			url = '/member/myPages';
			param = {
				"startNum" : startNum 
			};
		}
			console.log(startNum);
		
		$.ajax({
			url : url,
			type : 'POST',
			dataType : 'json',
			data :param,
			success : function(data){
				for (var i = 0; i < data.length; i++) {
					addListHtml += "<li>";
                    addListHtml += "<ul>";
					addListHtml += "<li class='my_list_subtitle'>"+data[i].title+"</li>";
					addListHtml += "<li class='my_list_subcontent'>"+data[i].content+"</li>";
					addListHtml += "<li class='my_list_hit'>"+data[i].hit+"</li>";
					addListHtml += "<li class='my_list_date'>"+data[i].write_date+"</li>";
					addListHtml += "</ul>";
                    addListHtml += "<a href='/board/old/oldView?board_num="+data[i].board_num+"'></a></li>";
					
				}
				if(data.length<5){
					$("#moreView").remove();
				} 
				$("#my_list_contents03").append(addListHtml);
				/* console.log(addListHtml); */
			}
		});
}
$('#moreView').click(function(){
	var startNum = $("#my_list_contents03 li").length/5; // oldlist안에 li태그의 길이
	var addListHtml = "";
	 console.log(startNum); 
	var url;
	var param;
	const params = new URL(window.location.href).searchParams;
	
	var pathname = window.location.pathname;
	var pn = pathname.substring(pathname.lastIndexOf('/')+1);
	if(pn=='myPage'){
		url = '/member/myPages';
		param = {
			"startNum" : startNum 
		};
	}
		console.log(startNum);

	$.ajax({
		url : url,
		type : 'POST',
		dataType : 'json',
		data :param,
		success : function(data){
			for (var i = 0; i < data.length; i++) {
				addListHtml += "<li>";
                addListHtml += "<ul>";
				addListHtml += "<li class='my_list_subtitle'>"+data[i].title+"</li>";
				addListHtml += "<li class='my_list_subcontent'>"+data[i].content+"</li>";
				addListHtml += "<li class='my_list_hit'>"+data[i].hit+"</li>";
				addListHtml += "<li class='my_list_date'>"+data[i].write_date+"</li>";
				addListHtml += "</ul>";
                addListHtml += "<a href='/board/old/oldView?board_num="+data[i].board_num+"'></a></li>";
				
			}
			if(data.length<5){
				$("#moreView").remove();
			} 
			$("#my_list_contents03").append(addListHtml);
			/* console.log(addListHtml); */
		}
	});
});
</script>
<input type="hidden" name="user_id" value="${vo.user_id}"/>
<div id="mypage_wrap">
	<ul id="profile">
		<li>
			<img id ="p_img" src="/upload/${vo.profile_image}" alt="프로필 이미지">
			<img id="level_frame" alt="등급 프레임 이미지">
			<p><a id="profile_upload" data-target="#changeModal" data-toggle="modal">프로필 사진<br/>바꾸기</a></p>
		</li><!-- 모달은 맨 밑 -->
		<li class="userid">${vo.user_nickname} (${vo.user_id})</li>
		<li class="grade">
			<span id="user_grade"></span>
			<p id="grade_menual">
				<br/>
				&nbsp;&nbsp;&nbsp; level 1 : point 0 ~ 90<br/>
				&nbsp;&nbsp;&nbsp; level 2 : point 100 ~ 190<br/>
				&nbsp;&nbsp;&nbsp; level 3 : point 200 ~ 290<br/>
				&nbsp;&nbsp;&nbsp; level 4 : point 300 ~ 390<br/>
				&nbsp;&nbsp;&nbsp; level 5 : point 400 ~<br/>
				<br/>
				&nbsp;&nbsp;&nbsp; 게시물 1개 - 10 point<br/>
				&nbsp;&nbsp;&nbsp; 댓글 1개 - 3 point
			</p>
		</li>
		<li id="my_count">
			<ul>
				<li>내 포인트</li>
				<li>${vo.exp}</li>
			</ul>
			<ul>
				<li>받은 추천</li>
				<li>xxx</li>
			</ul>
			<ul>
				<li>신고 누적</li>
				<li>${vo.report_hit}</li>
			</ul>
		</li>
		<li><button><a href="/member/pwdCheck">회원정보수정</a></button></li>
		<li><button><a href="/member/byeCheck">회원탈퇴</a></button></li>
	</ul>
	<ul id="my_list">
		<li>
			<input type="radio" name="tab" id="tab1" checked>
			<label for="tab1">오늘의 코디</label>
			<div>
				<ul class="my_list_title">
					<li>게시물 제목</li>
					<li>내용</li>
					<li>조회수</li>
					<li>작성날짜</li>
				</ul>
				<ul class="my_list_contents" id="my_list_contents01">
					<!-- 게시물 리스트-->
        			<!--<c:forEach var="vo1" items="${lst1}">
						<li>
							<ul>
								<li class="my_list_subtitle">${vo1.title}</li>
								<li class="my_list_subcontent">${vo1.content}</li>
								<li class="my_list_hit">${vo1.hit}</li>
								<li class="my_list_date">${vo1.write_date}</li>
							</ul>
							<a href="/board/old/oldView?board_num=${vo1.board_num}"></a>
						</li>
					</c:forEach>-->
				</ul>
			</div>
		</li>
		<li>
			<input type="radio" name="tab" id="tab2">
			<label for="tab2">스타일 추천</label>
			<div>
				<ul class="my_list_title">
					<li>게시물 제목</li>
					<li>내용</li>
					<li>조회수</li>
					<li>작성날짜</li>
				</ul>
				<ul class="my_list_contents">
					<!-- 게시물 리스트-->
        			<!--<c:forEach var="vo2" items="${lst2}">
						<li>
							<ul>
								<li class="my_list_subtitle">${vo2.title}</li>
								<li class="my_list_subcontent">${vo2.content}</li>
								<li class="my_list_hit">${vo2.hit}</li>
								<li class="my_list_date">${vo2.write_date}</li>
							</ul>
							<a href="/board/old/oldView?board_num=${vo2.board_num}"></a>
						</li>
					</c:forEach>-->
				</ul>
			</div>
		</li>
		<li>
			<input type="radio" name="tab" id="tab3">
			<label for="tab3">중고거래</label>
			<div>
				<ul class="my_list_title">
					<li>게시물 제목</li>
					<li>내용</li>
					<li>조회수</li>
					<li>작성날짜</li>
				</ul>
				<ul class="my_list_contents" id="my_list_contents03">
					<!-- 게시물 리스트-->
        			<!--<c:forEach var="vo3" items="${lst3}">
						<li>
							<ul>
								<li class="my_list_subtitle">${vo3.title}</li>
								<li class="my_list_subcontent">${vo3.content}</li>
								<li class="my_list_hit">${vo3.hit}</li>
								<li class="my_list_date">${vo3.write_date}</li>
							</ul>
							<a class="my_list_alink" href="/board/old/oldView?board_num=${vo3.board_num}"></a>
						</li>
					</c:forEach>-->
				</ul>
			</div>
			<a id="moreView" style="background-color:black;"><img src="/img/더보기.png" style="width:100px;"></a>
			
		</li>
		<li>
			<input type="radio" name="tab" id="tab4">
			<label for="tab4">구매후기</label>
			<div>
				<ul class="my_list_title">
					<li>게시물 제목</li>
					<li>내용</li>
					<li>조회수</li>
					<li>작성날짜</li>
				</ul>
				<ul class="my_list_contents">
					<!-- 게시물 리스트-->
        			<!--<c:forEach var="vo4" items="${lst4}">
						<li>
							<ul>
								<li class="my_list_subtitle">${vo4.title}</li>
								<li class="my_list_subcontent">${vo4.content}</li>
								<li class="my_list_hit">${vo4.hit}</li>
								<li class="my_list_date">${vo4.write_date}</li>
							</ul>
							<a class="my_list_alink" href="/board/old/oldView?board_num=${vo4.board_num}"></a>
						</li>
					</c:forEach>-->
				</ul>
			</div>
		</li>
		<li>
			<input type="radio" name="tab" id="tab5">
			<label for="tab5">QnA</label>
			<div>
				<ul class="my_list_title">
					<li>게시물 제목</li>
					<li>내용</li>
					<li>조회수</li>
					<li>작성날짜</li>
				</ul>
				<ul class="my_list_contents">
					<!-- 게시물 리스트-->
        			<!--<c:forEach var="vo5" items="${lst5}">
						<li>
							<ul>
								<li class="my_list_subtitle">${vo5.title}</li>
								<li class="my_list_subcontent">${vo5.content}</li>
								<li class="my_list_hit">${vo5.hit}</li>
								<li class="my_list_date">${vo5.write_date}</li>
							</ul>
							<a href="/board/old/oldView?board_num=${vo5.board_num}"></a>
						</li>
					</c:forEach>-->
				</ul>
			</div>
		</li>
		<li>
			<input type="radio" name="tab" id="tab6">
			<label for="tab6">오늘 뭐입지?</label>
			<div>
				<ul class="my_list_title">
					<li>게시물 제목</li>
					<li>내용</li>
					<li>조회수</li>
					<li>작성날짜</li>
				</ul>
				<ul class="my_list_contents">
					<!-- 게시물 리스트-->
        			<!--<c:forEach var="vo6" items="${lst6}">
						<li>
							<ul>
								<li class="my_list_subtitle">${vo6.title}</li>
								<li class="my_list_subcontent">${vo6.content}</li>
								<li class="my_list_hit">${vo6.hit}</li>
								<li class="my_list_date">${vo6.write_date}</li>
							</ul>
							<a href="/board/old/oldView?board_num=${vo6.board_num}"></a>
						</li>
					</c:forEach>-->
				</ul>
			</div>
		</li>
		<li>
			<input type="radio" name="tab" id="tab8">
			<label for="tab8">댓글</label>
			<div>
				<ul class="my_list_title">
					<li>게시물 타입</li>
					<li>내용</li>
					<li>작성날짜</li>
				</ul>
				<ul class="my_list_contents">
					<li>게시물 타입</li>
					<li>내용</li>
					<li>작성날짜</li>
					<li  class="my_list_alink"><a href=""></a></li>
				</ul>
			</div>
		</li>
	</ul>
</div>
<!-- 프로필 사진 바꾸기 모달 -->
		<div id="changeModal" class="modal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h2>프로필 사진 바꾸기</h2>
						<button class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<form method="post" id="changeForm" action="/member/changeProfileImg" enctype="multipart/form-data">
							<ul>
								<li>
									<div>
				                      	<img style="width: 400px; height:400px; border-radius: 70%;" id="img_section" src="/upload/${vo.profile_image}">
				                      	<img style="width: 400px; border-radius: 70%;" src="${vo.frame_img}"><br/>
				                    	<input type="text" id="file_route"  disabled="disabled" value="${vo.profile_image}" >
				                     	<label for="upload_file">업로드</label>
				                       	<input type="file" id="upload_file" name="filename" accept="image/*" style="position:absolute; clip:rect(0, 0, 0, 0);"  value="${vo.profile_image}"><br/>
				                    </div>
				                    <script>
				                    	//프로필 사진 바꾸기
					                    const reader = new FileReader();
					                	reader.onload = (readerEvent) => {
					                		document.querySelector("#img_section").setAttribute("src", readerEvent.target.result);
					                	};
					                	document.querySelector("#upload_file").addEventListener("change", (changeEvent) => {
					                		const imgFile = changeEvent.target.files[0];
					                		reader.readAsDataURL(imgFile);
					                		const fileName = document.getElementById("file_route");
					                		fileName.value = imgFile.name;
					                	});
				                    </script>
								</li>
								<hr />
								<li><input type='submit' value='확인' id="changebtn" /></li>
							</ul>
						</form>
					</div>
				</div>
			</div>
		</div>


