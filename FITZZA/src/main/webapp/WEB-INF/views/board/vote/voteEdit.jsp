<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="/css/vote.css">

<script>
 $(function(){
	 $("#reviewFrm").submit(function(){
	 if($("#title").val()==''){
		 alert("제목을 입력해주세요");
		 return false;
	 }
	 
	 if($("#content").val()==''){
		 alert("본문을 입력해주세요");
		 return false;
	 }
	 });
 });
</script>		
</head>
<body>
<div id="vote-wrapper"><!--  전체 틀  -->
	<div class="vote_container">
		<h1 class="Top_menu">글쓰기</h1>
			<div id="vmain_container">
				<form method="post" action="/board/vote/voteWriteOk" id="reviewFrm" enctype="multipart/form-data">
					<input type="hidden" name="board_num" value="${vo.board_num}"/>
				  	  	<ul>
							<li><input type="hidden" name="type_num" value="6"/></li> <!--  게시판 타입num-->
							<li><input type="text" name="title" id="title" class="input01" placeholder="제목을 입력해주세요" value='${vo.title}'/></li>
							<li class="Top_menu">의상 종류 &emsp;  
				            	<select id="gender_type" name="gender_type">
									<option value="W" name="W">여성의류</option>
									<option value="M" name="M">남성의류</option>
									<option value="U" name="U">남여공용</option>
								</select>
							</li>
							<li><div id="img_area">
									<div class="img_up1">
				                    	<p style="text-align: center;">투표대상 1 이미지<p>
				                    	    <div>
				                         	   <img style="width: 450px;" id="img_section" src="/upload/${vo.file1}"><br/>
				                            	<input type="text" id="file_route01"  disabled="disabled" value="${vo.file1}" >
				                           	 	<label for="upload_file01">업로드</label>
				                            	<input type="file" id="upload_file01" name="filename" accept="image/*" required=true style="position:absolute; clip:rect(0, 0, 0, 0);"><br/>
				                       		</div>
				             	    </div>
				           	        <div class="img_up2">
				                  	    <p style="text-align: center;">투표대상 2 이미지</p>
				                       		 <div>
				                       		     <img style="width: 450px;" id="img_section2" src="/upload/${vo.file2}"><br/>
				                         	     <input type="text" id="file_route02"  disabled="disabled" value="${vo.file2}" >
				                          	     <label for="upload_file02">업로드</label>
				                          	     <input type="file" id="upload_file02" name="filename" accept="image/*" required=true style="position:absolute; clip:rect(0, 0, 0, 0);"><br/>
				                      	     </div>
				               	    </div>
				                </div>
				           	 	</li>
								<li><textarea name="content" id="content" rows="30" cols="100" placeholder="본문입력하세요">${vo.content}</textarea></li>
								<li style="height:70px;"><input type='submit' value='등록' id="votesubmit" class="button01" style="margin-right:20px;"/></li>
						</ul>
				</form>
			</div>
	</div>
</div>	
<script>
	const reader = new FileReader();
	reader.onload = (readerEvent) => {
		document.querySelector("#img_section").setAttribute("src", readerEvent.target.result);
	};
	document.querySelector("#upload_file01").addEventListener("change", (changeEvent) => {
		const imgFile = changeEvent.target.files[0];
		reader.readAsDataURL(imgFile);
		const fileName = document.getElementById("file_route01");
		fileName.value = imgFile.name;
	});
	
	const reader2 = new FileReader();
	reader2.onload = (readerEvent) => {
		document.querySelector("#img_section2").setAttribute("src", readerEvent.target.result);
	};
	document.querySelector("#upload_file02").addEventListener("change", (changeEvent) => {
		const imgFile2 = changeEvent.target.files[0];
		reader2.readAsDataURL(imgFile2);
		const fileName2 = document.getElementById("file_route02");
		fileName2.value = imgFile2.name;
	});
</script>		