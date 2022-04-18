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
					
</head>
<body>
<div id="review-wrapper"><!--  전체 틀  -->
<h1>투표 게시판</h1>
<hr/>
	<form method="post" action="/board/review/reviewWriteOk" id="reviewFrm" enctype="multipart/form-data">
  	  	<ul>
			<li><input type="hidden" name="type_num" value="#"/></li> <!--  게시판 타입num-->
			<li><input type="text" name="title" id="title" class="input01" placeholder="제목을 입력해주세요"/></li>
			<li><div id="img_area">
					<div class="img_up1">
                    	투표대상 1 이미지<br/>
                    	    <div>
                         	   <img style="width: 500px;" id="img_section" src="/img/이미지 없음.png"><br/>
                            	<input type="text" id="file_route01"  disabled="disabled" value="파일 선택" >
                           	 	<label for="upload_file01">업로드</label>
                            	<input type="file" id="upload_file01" name="filename" accept="image/*" required=true style="position:absolute; clip:rect(0, 0, 0, 0);"><br/>
                       		</div>
             	    </div>
           	        <div class="img_up2">
                  	    투표대상 2 이미지<br/>
                       		 <div>
                       		     <img style="width: 500px;" id="img_section" src="/img/이미지 없음.png"><br/>
                         	     <input type="text" id="file_route01"  disabled="disabled" value="파일 선택" >
                          	     <label for="upload_file01">업로드</label>
                          	     <input type="file" id="upload_file02" name="filename" accept="image/*" required=true style="position:absolute; clip:rect(0, 0, 0, 0);"><br/>
                      	     </div>
               	    </div>
                </div>
            </li>
			<li><textarea name="content" id="content" rows="30" cols="100" placeholder="본문입력하세요"></textarea> </li>
				<li style="height:70px;"><input type='submit' value='등록' id="reviewsubmit" class="button01" style="margin-right:20px;"/></li>
		</ul>
	</form>
</div>			