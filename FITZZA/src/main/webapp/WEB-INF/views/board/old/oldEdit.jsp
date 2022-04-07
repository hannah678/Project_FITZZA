<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<head>
    <meta charset="UTF-8">
    <title>상품변경</title>
</head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="/css/oldwrite.css" type="text/css">
<script>
	$(function(){
		$("#boardFrm").submit(function(){
			if($("#subject").val()==''){
				alert("상품 제목을 입력하세요");
				return false;
			}
			if($("#city").val()==''){
				alert("거래 가능 지역을 입력하세요");
				return false;
			}
			if($("#price").val()==''){
				alert("가격을 입력하세요");
				return false;
			}
			if($("#introduce").val()==''){
				alert("상품 설명을 입력하세요");
				return false;
			}
		});
	});
</script>

<body>
    <div class="boardcontainer">
        <h1>상품변경</h1>
        <form method="post" action="" id="boardFrm">
            <ul>
                <li>제목 &emsp; <input type="text" name="subject" id="subject" placeholder='	상품 제목을 입력해주세요.' value='남성 (M) 나이키 스포츠 바람막이'></li><!--prod_name-->
				<hr/>
                <li>지역 &emsp; <input type="text" name="city" id="city" placeholder='	거래 가능 지역을 입력해주세요.' value='서울'/></li><!--city-->
				<hr/>
				<li>가격 &emsp; <input type="text" name="price" id="price" placeholder='	가격을 입력해주세요.' value='9,500원'/></li><!--price-->
				<hr/>
				<li>설명 &emsp; <textarea name="introduce" id="introduce" rows="10" cols="100" placeholder='	상품 설명을 입력해주세요.' >글 내용</textarea></li><!--explanation-->
				<hr/>
				<li>이미지 &emsp; <input type="text" id="file_route" disabled="disabled" value="옷1.jpg"><!--prod_image-->
					<label for="upload_file">업로드</label>
					<input type="file" id="upload_file" accept="image/*" required=true 
						style="position:absolute; clip:rect(0, 0, 0, 0);">
					<img style="width: 300px;" id="img_section" src="../img/옷1.jpg"></li><!--prod_image-->
					<script>
						const reader = new FileReader();
				
						reader.onload = (readerEvent) => {
							document.querySelector("#img_section").setAttribute("src", readerEvent.target.result);
						};
				
						document.querySelector("#upload_file").addEventListener("change", (changeEvent) => {
				
							const imgFile = changeEvent.target.files[0];
							reader.readAsDataURL(imgFile);
				
							const fileName = document.getElementById("file_route");
							fileName.value = imgFile.name;
						})
					</script>
					<script>
						const reader = new FileReader();
					
						reader.onload = (readerEvent) => {
							document.querySelector("#img_section").setAttribute("src", readerEvent.target.result);
						};
					
						document.querySelector("#upload_file").addEventListener("change", (changeEvent) => {
							const imgFile = changeEvent.target.files[0];
							reader.readAsDataURL(imgFile);
						})
					</script>
				<hr/>
				<li><input type='submit' value='등록하기' id="enter"/></li>
				<hr/>
            </ul>
        </form>
    </div>
</body>
