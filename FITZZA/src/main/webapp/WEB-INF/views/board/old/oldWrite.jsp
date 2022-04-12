<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="/css/oldwrite.css" type="text/css">
<script>
	$(function(){
		$("#boardFrm").submit(function(){
			if($("#title").val()==''){
				alert("제목을 입력하세요");
				return false;
			}
			if($("#city").val()==''){
				alert("거래 가능 지역을 입력하세요");
				return false;
			}
			if($("#old_name").val()==''){
				alert("상품명을 입력하세요");
				return false;
			}
			if($("#old_price").val()==''){
				alert("가격을 입력하세요");
				return false;
			}
			if($("#content").val()==''){
				alert("상품 설명을 입력하세요");
				return false;
			}
		});
	});
</script>

    <div class="boardcontainer">
        <form method="post" action="/board/old/oldWriteOk" id="boardFrm" enctype="multipart/form-data">
            <ul>
            	<h1>상품등록</h1>
                <li>제목 &emsp;  <input type="text" name="title" id="title" placeholder='  제목을 입력해주세요.'/></li>
				<hr/>
                <li>지역 &emsp;  <input type="text" name="city" id="city" placeholder='  거래 가능 지역을 입력해주세요.'/></li>
				<hr/>
				<li>상품명 &emsp;  <input type="text" name="old_name" id="old_name" placeholder='  상품명을 입력해주세요.'/></li>
				<hr/>
				<li>상품 종류 &emsp;  <select id="gender_type" name="gender_type">
					<option value="W" name="W">여성의류</option>
					<option value="M" name="M">남성의류</option>
					<option value="U" name="U">남여공용</option>
				</select></li>
				<hr/>
				<li>가격 &emsp;  <input type="text" name="old_price" id="old_price" placeholder='  가격을 입력해주세요.(숫자)'/> 원</li>
				<hr/>
				<li>설명 &emsp;  <br/><textarea name="content" id="content" rows="30" cols="100" 
				placeholder='	
				상품 설명을 입력해주세요.
				
				<작성 예시>
				실측 사이즈
                ㅡ
                어깨 : 00cm
                가슴 : 00cm
                팔길이 : 00cm
                총기장 : 00cm
                
                안내사항
                
                :) 택배 요청시 3,000원 추가 해주시면 됩니다.
                (제주 및 도서 산간 지역은 6,000원 추가입니다.)
                
                중고 상품 특성상 동일한 상품으로 교환이나약간의 이염등에 의한 교환/환불은 불가능한점. 
                이해 부탁드리겠습니다.
                
                3만원 이상 구매시 무료 배송입니다^^
				'></textarea></li>
				<hr/>
				<div class="img1">
                    <li id="img1">대표이미지<br/>
                        <div>
                            <img style="width: 500px;" id="img_section" src="/img/이미지 없음.png"><br/>
                            <input type="text" id="file_route01"  disabled="disabled" value="파일 선택" >
                            <label for="upload_file01">업로드</label>
                            <input type="file" id="upload_file01" name="filename" accept="image/*" required=true style="position:absolute; clip:rect(0, 0, 0, 0);"><br/>
                        </div>
                    </li>
                </div>
                <hr/>
                <div class="img2">
                    <li id="img2">상세이미지<br/>
                        <div>
                            <img style="width: 300px;" id="img_section2" src="/img/이미지 없음.png"><br/>
                            <input type="text" id="file_route02"  disabled="disabled" value="파일 선택" >
                            <label for="upload_file02">업로드</label>
                            <input type="file" id="upload_file02" name="filename" accept="image/*" required=true style="position:absolute; clip:rect(0, 0, 0, 0);"><br/>
                            </div>
                        <div>   
                            <img style="width: 300px;" id="img_section3" src="/img/이미지 없음.png"><br/>
                            <input type="text" id="file_route03"  disabled="disabled" value="파일 선택" >
                            <label for="upload_file03">업로드</label>
                            <input type="file" id="upload_file03" name="filename" accept="image/*" style="position:absolute; clip:rect(0, 0, 0, 0);"><br/>
                        </div>
                        <div>
                            <img style="width: 300px;" id="img_section4" src="/img/이미지 없음.png"><br/>
                            <input type="text" id="file_route04"  disabled="disabled" value="파일 선택" >
                            <label for="upload_file04">업로드</label>
                            <input type="file" id="upload_file04" name="filename" accept="image/*"style="position:absolute; clip:rect(0, 0, 0, 0);"><br/>
                        </div>
                        <div>
                            <img style="width: 300px;" id="img_section5" src="/img/이미지 없음.png"><br/>				
                            <input type="text" id="file_route05"  disabled="disabled" value="파일 선택" >
                            <label for="upload_file05">업로드</label>
                            <input type="file" id="upload_file05" name="filename" accept="image/*" style="position:absolute; clip:rect(0, 0, 0, 0);"><br/>
                        </div>
                    </li>
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
				<li><input type='submit' value='등록하기' id="enter"/></li>
            </ul>
        </form>
    </div>
</body>
