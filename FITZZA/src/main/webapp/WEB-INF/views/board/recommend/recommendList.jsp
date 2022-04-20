<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/recList.css" type="text/css">
<script>
$(document).ready(function(){
	$('#rec_a').addClass('button_toggled');
	$('#rec_m').addClass('button_normal');
	$('#rec_w').addClass('button_normal');
	$('#rec_u').addClass('button_normal');
	$('#user_leave').addClass('user_leave');
	$('#rec_a').click( function() {
		if($(this).hasClass('button_normal')) {
	        $(this).removeClass('button_normal').addClass('button_toggled');
	        $('#rec_m').removeClass('button_toggled').addClass('button_normal');
	        $('#rec_w').removeClass('button_toggled').addClass('button_normal');
	        $('#rec_u').removeClass('button_toggled').addClass('button_normal');
	    }
      });
	$('#rec_m').click( function() {
		if($(this).hasClass('button_normal')) {
	        $(this).removeClass('button_normal').addClass('button_toggled');
	        $('#rec_a').removeClass('button_toggled').addClass('button_normal');
	        $('#rec_w').removeClass('button_toggled').addClass('button_normal');
	        $('#rec_u').removeClass('button_toggled').addClass('button_normal');
	    }
      });
	$('#rec_w').click( function() {
		if($(this).hasClass('button_normal')) {
	        $(this).removeClass('button_normal').addClass('button_toggled');
	        $('#rec_m').removeClass('button_toggled').addClass('button_normal');
	        $('#rec_a').removeClass('button_toggled').addClass('button_normal');
	        $('#rec_u').removeClass('button_toggled').addClass('button_normal');
	    }
      });
	$('#rec_u').click( function() {
		if($(this).hasClass('button_normal')) {
	        $(this).removeClass('button_normal').addClass('button_toggled');
	        $('#rec_m').removeClass('button_toggled').addClass('button_normal');
	        $('#rec_w').removeClass('button_toggled').addClass('button_normal');
	        $('#rec_a').removeClass('button_toggled').addClass('button_normal');
	    }
      });
});
</script>

<body>
<div class="recboard">
    <br><br><br><br><br><br><br>
    <a href="/board/recommend/recommendList"><h1>다양한 패션을 나누고 싶다면</h1></a>
     <a href="/board/recommend/recommendList"><h2>스타일 추천</h2></a>
    <br/>
    <h5>도배/홍보성 글은 삭제 및 경고 처리됩니다.</h5>
    <div id="r_write">
        <a href="/board/recommend/recommendWrite">글쓰기</a>
    </div>
    <div id="rec_btn">
    	<button onclick="change()" id="rec_a">전체보기</button>
    	<button onclick="change('M')" id="rec_m">남성의류</button>
    	<button onclick="change('W')" id="rec_w">여성의류</button>
    	<button onclick="change('U')" id="rec_u">남녀공용</button>
    </div>
    <div class="recli">
	    <ul class="recommendlist" id="recommendlist">
		    
	    </ul>
	</div>
    <!-- 리스트 더보기 -->
    <a id="moreView"><img src="/img/더보기.png" style="width:100px;"></a>

    <!-- 검색 -->
    <form action="/board/recommend/search" id="searchFrm">
        <select name="searchKey">
            <option value="title">제목</option>
            <option value="content">내용</option>
            <option value="userid">작성자</option>
        </select>
        <input type="text" name="searchWord" id="searchWord"/>
        <input type="submit" value="Search"/>
    </form>
</div>
</body>
<script>
var gType;
$("#searchFrm").submit(function() {
   if ($("#searchWord").val() == "") {
      alert("검색어를 입력하세요");
      return false;
   }
   
});
	
window.onload=function(){
		var startNum = $("#recommendlist li").length/1; // oldlist안에 li태그의 길이
		var addListHtml = "";
		 console.log(startNum); 
		var url;
		var param;
		const params = new URL(window.location.href).searchParams;
		var key = params.get('searchKey');
		var word = params.get('searchWord');
		var pathname = window.location.pathname;
		var pn = pathname.substring(pathname.lastIndexOf('/')+1);
		if(pn=='recommendList'){
			url = '/board/recommend/recommendLists';
			param = {
				"startNum" : startNum
			};
		}else if(pn='search'){
			url = '/board/recommend/searchLists';
			param = {
				"startNum" : startNum ,
				"searchKey" : key,
				"searchWord" : word
			};
			console.log(startNum);
		}
		$.ajax({
			url : url,
			type : 'POST',
			dataType : 'json',
			data :param,
			success : function(data){
				for (var i = 0; i < data.length; i++) {
					addListHtml += "<li class='reclist'>";
					addListHtml += "<a href='/board/recommend/recommendView?board_num="+data[i].board_num+"'><img src='/upload/"+data[i].file1+"' class='rec_img'></a>";
					addListHtml += "<a href='/board/recommend/recommendView?board_num="+data[i].board_num+"' class='rec_title'>["+data[i].gender_name+"] "+data[i].title+"</a><br/>";
					addListHtml += "<img src='/upload/"+data[i].profile_image+"'id='profile_img'/>"+data[i].user_nickname+"<br/><br/>";
					addListHtml += data[i].write_date+" | "+data[i].hit+"</li>";
				}
				if(data.length<8){
					$("#moreView").css("display", "none");
				}else{
					$("#moreView").css("display", "block");
				}
				$("#recommendlist").append(addListHtml);
				console.log(addListHtml); 
			}
		});
}

$('#moreView').click(function(){ 
	moreList();
});
function change(gender_type){
	if(gType!=gender_type){
		gType = gender_type;
		$("#recommendlist").empty();
		moreList();
	}
}
function moreList(){
	var startNum = $("#recommendlist li").length/1; // oldlist안에 li태그의 길이
	var addListHtml = "";
	 console.log(startNum); 
	var url;
	var param;
	const params = new URL(window.location.href).searchParams;
	var key = params.get('searchKey');
	var word = params.get('searchWord');
	var pathname = window.location.pathname;
	var pn = pathname.substring(pathname.lastIndexOf('/')+1);
	if(pn=='recommendList'){
		url = '/board/recommend/recommendLists';
		param = {
			"startNum" : startNum,
			"gender_type" : gType
		};
	}else if(pn='search'){
		url = '/board/recommend/searchLists';
		param = {
			"startNum" : startNum ,
			"searchKey" : key,
			"searchWord" : word
		};
		console.log(startNum);
	}
	$.ajax({
		url : url,
		type : 'POST',
		dataType : 'json',
		data :param,
		success : function(data){
			for (var i = 0; i < data.length; i++) {
				addListHtml += "<li class='reclist'>";
				addListHtml += "<a href='/board/recommend/recommendView?board_num="+data[i].board_num+"'><img src='/upload/"+data[i].file1+"' class='rec_img'></a>";
				addListHtml += "<a href='/board/recommend/recommendView?board_num="+data[i].board_num+"' class='rec_title'>["+data[i].gender_name+"] "+data[i].title+"</a><br/>";
				addListHtml += "<img src='/upload/"+data[i].profile_image+"'id='profile_img'/>"+data[i].user_nickname+"<br/><br/>";
				addListHtml += data[i].write_date+" | "+data[i].hit+"</li>";
				
			}
			if(data.length<8){
				$("#moreView").css("display", "none");
			}else{
				$("#moreView").css("display", "block");
			}
			$("#recommendlist").append(addListHtml);
			/* console.log(addListHtml); */
		}
	});
}
</script>