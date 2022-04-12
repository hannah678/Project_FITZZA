<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="/css/review.css">
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
<div id="review-wrapper"><!--  전체 틀  -->
<h1>구매 후기</h1>
<hr/>
	<form method="post" action="/board/review/reviewWriteOk" id="reviewFrm" enctype="multipart/form-data">
  	  	<ul>
			<li><input type="hidden" name="type_num" value="4"/></li> <!-- 게시판 타입num -->
			<li><input type="text" name="title" id="title" class="input01" placeholder="제목을 입력해주세요"/></li>
			<li><div class="img1">
                    대표이미지<br/>
                        <div>
                            <img style="width: 500px;" id="img_section" src="/img/이미지 없음.png"><br/>
                            <input type="text" id="file_route01"  disabled="disabled" value="파일 선택" >
                            <label for="upload_file01">업로드</label>
                            <input type="file" id="upload_file01" name="filename" accept="image/*" required=true style="position:absolute; clip:rect(0, 0, 0, 0);"><br/>
                        </div>
                </div>
            </li>
            <li>상품 종류 &emsp;  
            	<select id="gender_type" name="gender_type">
					<option value="W" name="W">여성의류</option>
					<option value="M" name="M">남성의류</option>
					<option value="U" name="U">남여공용</option>
				</select>
			</li>
			<li><textarea name="content" id="content" rows="30" cols="100" placeholder="본문입력하세요"></textarea> </li>
			<li><div class="img2">
                      상세이미지<br/>
                        <div class="img2_up">
                            <img style="width: 300px;" id="img_section2" src="/img/이미지 없음.png"><br/>
                            <input type="text" id="file_route02"  disabled="disabled" value="파일 선택" >
                            <label for="upload_file02">업로드</label>
                            <input type="file" id="upload_file02" name="filename" accept="image/*" style="position:absolute; clip:rect(0, 0, 0, 0);"><br/>
                            </div>
                        <div class="img2_up">   
                            <img style="width: 300px;" id="img_section3" src="/img/이미지 없음.png"><br/>
                            <input type="text" id="file_route03"  disabled="disabled" value="파일 선택" >
                            <label for="upload_file03">업로드</label>
                            <input type="file" id="upload_file03" name="filename" accept="image/*" style="position:absolute; clip:rect(0, 0, 0, 0);"><br/>
                        </div>
                        <div class="img2_up">
                            <img style="width: 300px;" id="img_section4" src="/img/이미지 없음.png"><br/>
                            <input type="text" id="file_route04"  disabled="disabled" value="파일 선택" >
                            <label for="upload_file04">업로드</label>
                            <input type="file" id="upload_file04" name="filename" accept="image/*"style="position:absolute; clip:rect(0, 0, 0, 0);"><br/>
                        </div>
                        <div class="img2_up">
                            <img style="width: 300px;" id="img_section5" src="/img/이미지 없음.png"><br/>				
                            <input type="text" id="file_route05"  disabled="disabled" value="파일 선택" >
                            <label for="upload_file05">업로드</label>
                            <input type="file" id="upload_file05" name="filename" accept="image/*" style="position:absolute; clip:rect(0, 0, 0, 0);"><br/>
                        </div>
				</div></li>
				<li style="height:70px;"><input type='submit' value='등록' id="reviewsubmit" class="button01" style="margin-right:20px;"/></li>
		</ul>
	</form>
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
	
	const reader3 = new FileReader();
	reader3.onload = (readerEvent) => {
		document.querySelector("#img_section3").setAttribute("src", readerEvent.target.result);
	};
	document.querySelector("#upload_file03").addEventListener("change", (changeEvent) => {
		const imgFile3 = changeEvent.target.files[0];
		reader3.readAsDataURL(imgFile3);
		const fileName3 = document.getElementById("file_route03");
		fileName3.value = imgFile3.name;
	});
	
	const reader4 = new FileReader();
	reader4.onload = (readerEvent) => {
		document.querySelector("#img_section4").setAttribute("src", readerEvent.target.result);
	};
	document.querySelector("#upload_file04").addEventListener("change", (changeEvent) => {
		const imgFile4 = changeEvent.target.files[0];
		reader4.readAsDataURL(imgFile4);
		const fileName4 = document.getElementById("file_route04");
		fileName4.value = imgFile4.name;
	});
	
	const reader5 = new FileReader();
	reader5.onload = (readerEvent) => {
		document.querySelector("#img_section5").setAttribute("src", readerEvent.target.result);
	};
	document.querySelector("#upload_file05").addEventListener("change", (changeEvent) => {
		const imgFile5 = changeEvent.target.files[0];
		reader5.readAsDataURL(imgFile5);
		const fileName5 = document.getElementById("file_route05");
		fileName5.value = imgFile5.name;
	});
</script>
					