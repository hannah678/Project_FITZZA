<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="/css/qnaWrite.css" type="text/css">
<script>
	$(function(){
		$("#boardFrm").submit(function(){
			if($("#title").val()==''){
				alert("질문 제목을 입력하세요");
				return false;
			}
			if($("#introduce").val()==''){
				alert("질문 내용을 입력하세요");
				return false;
			}
		});
	});
</script> 

<body>
    <div class="boardcontainer">
		<br><br><br><br><br><br><br><br>
        <h1>질문하기</h1>
        <form method="post" action="" id="boardFrm">
            <ul>
                <li>제목 &emsp; <input type="text" name="title" id="title" placeholder='	질문 제목을 입력해주세요.'/></li>
				<hr/>
				<li class="qna_introduce">
					<span>내용</span>
					<textarea name="introduce" id="introduce" rows="10" cols="90" placeholder='	질문 내용을 입력해주세요.'></textarea>
				</li>
				<hr/>
				<li class="qna_img_area"><span>이미지</span> &emsp; <input type="text" id="file_route" disabled="disabled" value="파일 선택">
					<label for="upload_file" id="upload">업로드</label>
					<input type="file" id="upload_file" name="file1" accept="image/*" required=true 
						style="position:absolute; clip:rect(0, 0, 0, 0);">
					<img style="width: 300px; height:300px; display:inline-block" id="img_section" src="../img/이미지 없음.png"></li>
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
            </ul>
        </form>
    </div>
</body>