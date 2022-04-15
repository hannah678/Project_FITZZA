<%@page import="com.team.fitzza.vo.BoardVO"%>
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
		if($("#title").val()==''){
			alert("제목을 입력하세요");
			$("#title").focus();
			return false;
		}
		if($("#city").val()==''){
			alert("거래 가능 지역을 입력하세요");
			$("#city").focus();
			return false;
		}
		if($("#old_name").val()==''){
			alert("상품명을 입력하세요");
			$("#old_name").focus();
			return false;
		}
		if($("#old_price").val()==''){
			alert("가격을 입력하세요");
			$("#old_price").focus();
			return false;
		}
		if($("#content").val()==''){
			alert("상품 설명을 입력하세요");
			$("#content").focus();
			return false;
		}
	});
});
</script>

<body>
    <div class="boardcontainer">
        <h1>상품등록</h1>
        <form method="post" action="/board/old/oldEditOk" id="boardFrm" enctype="multipart/form-data">
            <ul>
            	<li><input type="hidden" name="board_num" value="${vo.board_num}"/><li>
            	<li>상품 종류 &emsp; <select id="state_num" name="state_num" >
					<option value="1" name="판매중" <c:if test="${state_num} == 1">selected</c:if>>판매중</option>
					<option value="2" name="예약중" <c:if test="${state_num} == 2">selected</c:if>>예약중</option>
					<option value="3" name="거래완료" <c:if test="${state_num} == 3">selected</c:if>>거래완료</option>
				</select></li>
				<hr/>
                <li>제목 &emsp; <input type="text" name="title" id="title" value='${vo.title}'/></li>
				<hr/>
                <li>지역 &emsp; <input type="text" name="city" id="city" value='${vo.city }'/></li>
				<hr/>
				<li>상품명 &emsp; <input type="text" name="old_name" id="old_name" value='${vo.old_name }'/></li>
				<hr/>
				<li>상품 종류 &emsp; <select id="gender_type" name="gender_type" >
					<option value="W" name="W" <c:if test="${gender_type} == 'W'">selected</c:if>>여성의류</option>
					<option value="M" name="M" <c:if test="${gender_type} == 'M'">selected</c:if>>남성의류</option>
					<option value="U" name="U" <c:if test="${gender_type} == 'U'">selected</c:if>>남여공용</option>
				</select></li>
				<hr/>
				<li>가격 &emsp; <input type="text" name="old_price" id="old_price" value="${vo.old_price}"/> 원</li>
				<hr/>
				<li>설명 &emsp; <br/><textarea name="content" id="content" rows="30" cols="100" 
				>${vo.content}</textarea></li>
				<hr/>
				<div class="img1">
                    <li id="img1">대표이미지<br/>
                        <div>
                            <img style="width: 500px;" id="img_section" src="/upload/${vo.file1}"><br/>
                            <input type="text" id="file_route01"  disabled="disabled" value="${vo.file1 }" >
                            <label for="upload_file01">업로드</label>
                            <input type="file" id="upload_file01" name="filename" accept="image/*" style="position:absolute; clip:rect(0, 0, 0, 0);"  value="${vo.file1 }"><br/>
                        </div>
                    </li>
                </div>
                <hr/>
                
                <div class="img2">
                    <li id="img2">상세이미지<br/>
                        <div>
                        	<c:if test="${vo.file2!=null && vo.file2 !=''}">
                            <img style="width: 300px;" id="img_section2" src="/upload/${vo.file2}"><br/>
                            <input type="text" id="file_route02"  disabled="disabled" value="파일 선택" >
                            <label for="upload_file02">업로드</label>
                            <input type="file" id="upload_file02" value="${vo.file2}" name="filename" accept="image/*" style="position:absolute; clip:rect(0, 0, 0, 0);"><br/>
                            </c:if>
                            <c:if test="${vo.file2==null || vo.file2 ==''}">
                            <img style="width: 300px;" id="img_section2" src="/img/이미지 없음.png"><br/>
                            <input type="text" id="file_route02"  disabled="disabled" value="파일 선택" >
                            <label for="upload_file02">업로드</label>
                            <input type="file" id="upload_file02" name="filename" accept="image/*" style="position:absolute; clip:rect(0, 0, 0, 0);"><br/>
                            </c:if>
                        </div>
                        <div>   
                        	<c:if test="${vo.file3!=null && vo.file3!=''}">
                            <img style="width: 300px;" id="img_section3" src="/upload/${vo.file3}"><br/>
                            <input type="text" id="file_route03"  disabled="disabled" value="파일 선택" >
                            <label for="upload_file03">업로드</label>
                            <input type="file" id="upload_file03" value="${vo.file3}" name="filename" accept="image/*" style="position:absolute; clip:rect(0, 0, 0, 0);"><br/>
                            </c:if>
                            <c:if test="${vo.file3==null || vo.file3 ==''}">
                            <img style="width: 300px;" id="img_section3" src="/img/이미지 없음.png"><br/>
                            <input type="text" id="file_route03"  disabled="disabled" value="파일 선택" >
                            <label for="upload_file03">업로드</label>
                            <input type="file" id="upload_file03" name="filename" accept="image/*" style="position:absolute; clip:rect(0, 0, 0, 0);"><br/>
                            </c:if>
                        </div>
                        <div>
                            <c:if test="${vo.file4!=null && vo.file4 !=''}">
                            <img style="width: 300px;" id="img_section4" src="/upload/${vo.file4}"><br/>
                            <input type="text" id="file_route04"  disabled="disabled" value="파일 선택" >
                            <label for="upload_file04">업로드</label>
                            <input type="file" id="upload_file04" value="${vo.file4}" name="filename" accept="image/*" style="position:absolute; clip:rect(0, 0, 0, 0);"><br/>
                            </c:if>
                            <c:if test="${vo.file4==null || vo.file4 ==''}">
                            <img style="width: 300px;" id="img_section4" src="/img/이미지 없음.png"><br/>
                            <input type="text" id="file_route04"  disabled="disabled" value="파일 선택" >
                            <label for="upload_file04">업로드</label>
                            <input type="file" id="upload_file04" name="filename" accept="image/*" style="position:absolute; clip:rect(0, 0, 0, 0);"><br/>
                            </c:if>
                        </div>
                        <div>
                            <c:if test="${vo.file5!=null && vo.file5 !=''}">
                            <img style="width: 300px;" id="img_section5" src="/upload/${vo.file5}"><br/>
                            <input type="text" id="file_route05"  disabled="disabled" value="파일 선택" >
                            <label for="upload_file05">업로드</label>
                            <input type="file" id="upload_file05" value="${vo.file5}" name="filename" accept="image/*" style="position:absolute; clip:rect(0, 0, 0, 0);"><br/>
                            </c:if>
                            <c:if test="${vo.file5==null || vo.file5 ==''}">
                            <img style="width: 300px;" id="img_section5" src="/img/이미지 없음.png"><br/>
                            <input type="text" id="file_route05"  disabled="disabled" value="파일 선택" >
                            <label for="upload_file05">업로드</label>
                            <input type="file" id="upload_file05" name="filename" accept="image/*" style="position:absolute; clip:rect(0, 0, 0, 0);"><br/>
                            </c:if>
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
				<hr/>
				<li><input type='submit' value='수정하기' id="enter"/></li>
            </ul>
        </form>
    </div>
</body>