<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="/css/todayCodi.css" type="text/css">
	<script>
	$(function(){
		$("#tc_boardFrm").submit(function(){
			if($("#tc_title").val()==''){
				alert("제목을 입력하세요");
				return false;
			}
            if($("#upload_file1").val()==''){
				alert("이미지를 첨부하세요");
				return false;
			}
		});
	});
</script>
	<div class="tcw_container">
        <h1>오늘의 코디 올리기</h1>
        <form method="post" action="" id="tc_boardFrm">
            <ul>
                <li>제목 &emsp; <input type="text" name="tc_title" id="tc_title" placeholder='	제목을 입력해주세요.'/></li>
				<hr/>
				<li>설명 &emsp; <br/><textarea name="content" id="content" rows="10" cols="100"></textarea></li>
				<hr/>
				<div class="tc_img1">
                    <li id="tc_img1">대표이미지<br/>
                        <div>
                            <img style="width: 500px;" id="tc_img_section" src="/img/이미지 없음.png"><br/>
                            <input type="text" id="file_route1"  disabled="disabled" value="파일 선택" >
                            <label for="upload_file1">업로드</label>
                            <input type="file" id="upload_file1" name="filename" accept="image/*" required=true style="position:absolute; clip:rect(0, 0, 0, 0);"><br/>
                        </div>
                    </li>
                </div>
                <hr/>
                <div class="tc_img2">
                    <li id="tc_img2">상세이미지<br/>
                        <div id="img2_box1">
                            <img style="width: 300px;" id="tc_img_section2" src="/img/이미지 없음.png"><br/>
                            <input type="text" id="file_route2"  disabled="disabled" value="파일 선택" >
                            <label for="upload_file2">업로드</label>
                            <input type="file" id="upload_file2" name="filename" accept="image/*" style="position:absolute; clip:rect(0, 0, 0, 0);"><br/>
                            </div>
                        <div id="img2_box2">   
                            <img style="width: 300px;" id="tc_img_section3" src="/img/이미지 없음.png"><br/>
                            <input type="text" id="file_route3"  disabled="disabled" value="파일 선택" >
                            <label for="upload_file3">업로드</label>
                            <input type="file" id="upload_file3" name="filename" accept="image/*" style="position:absolute; clip:rect(0, 0, 0, 0);"><br/>
                        </div>
                    </li>
				</div>
				<script>
						const reader = new FileReader();
						reader.onload = (readerEvent) => {
							document.querySelector("#tc_img_section").setAttribute("src", readerEvent.target.result);
						};
						document.querySelector("#upload_file1").addEventListener("change", (changeEvent) => {
							const imgFile = changeEvent.target.files[0];
							reader.readAsDataURL(imgFile);
							const fileName = document.getElementById("file_route1");
							fileName.value = imgFile.name;
						});
						
                        const reader2 = new FileReader();
						reader2.onload = (readerEvent) => {
							document.querySelector("#tc_img_section2").setAttribute("src", readerEvent.target.result);
						};
						document.querySelector("#upload_file2").addEventListener("change", (changeEvent) => {
							const imgFile2 = changeEvent.target.files[0];
							reader2.readAsDataURL(imgFile2);
							const fileName2 = document.getElementById("file_route2");
							fileName2.value = imgFile2.name;
						});
						
                        const reader3 = new FileReader();
						reader3.onload = (readerEvent) => {
							document.querySelector("#tc_img_section3").setAttribute("src", readerEvent.target.result);
						};
						document.querySelector("#upload_file3").addEventListener("change", (changeEvent) => {
							const imgFile3 = changeEvent.target.files[0];
							reader3.readAsDataURL(imgFile3);
							const fileName3 = document.getElementById("file_route3");
							fileName3.value = imgFile3.name;
						});
					</script>
				<li class="enter_box"><input type='submit' value='등록하기' id="tc_enter"/></li>
			</ul>
        </form>
    </div>
</body>
