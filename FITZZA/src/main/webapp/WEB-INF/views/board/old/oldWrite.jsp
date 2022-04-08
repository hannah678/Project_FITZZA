<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
    <meta charset="UTF-8">
    <title>상품등록</title>
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
        <h1>상품등록</h1>
        <form method="post" action="/board/old/oldWriteOk" id="boardFrm" enctype="multipart/form-data">
            <ul>
                <li>제목 &emsp; <input type="text" name="title" id="subject" placeholder='	제목을 입력해주세요.'/></li>
				<hr/>
                <li>지역 &emsp; <input type="text" name="city" id="city" placeholder='	거래 가능 지역을 입력해주세요.'/></li>
				<hr/>
				<li>상품명 &emsp; <input type="text" name="old_name" id="old_name" placeholder='	상품명을 입력해주세요.'/></li>
				<hr/>
				<li><select id="gender" name="gender">
					<option value="W" name="W">여성의류</option>
					<option value="M" name="M">남성의류</option>
					<option value="U" name="U">남여공용</option>
				</select></li>
				<hr/>
				<li>가격 &emsp; <input type="text" name="old_price" id="old_price" placeholder='	가격을 입력해주세요.(숫자만 입력해주세요.)'/></li>
				<hr/>
				<li>설명 &emsp; <textarea name="content" id="content" rows="10" cols="100" placeholder='	상품 설명을 입력해주세요.'></textarea></li>
				<hr/>
				<li>이미지 &emsp; <input type="text" id="file_route"  disabled="disabled" value="파일 선택" >
					<label for="upload_file">업로드</label>
					<input type="file" id="upload_file" name="filename" accept="image/*" required=true 
						style="position:absolute; clip:rect(0, 0, 0, 0);">
					<img style="width: 300px;" id="img_section" src="/img/이미지 없음.png"></li>
				
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
