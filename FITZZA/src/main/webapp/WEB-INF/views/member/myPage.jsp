<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/mypage.css" type="text/css"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

<style>
*{font-family: 'Noto Sans KR'; font-size:20px;text-decoration: none; }
a {font-size:20px}
button a {font-size:16px}
a:link {color:#fff; text-decoration: none;}
a:visited {color:#fff}
.admin_setting {margin-top:-10px}
.my_list_title li {font-size:20px; font-weight:600;}
#logStatus4 > img {vertical-align:top;}
	#logStatus5 > img {vertical-align:top;}
	#logStatus3 > a > img {margin-top:-15px}
</style>
<script>
window.onload=function(){
	//프로필
	var exp = ${vo.exp};
	var x = document.getElementById("user_grade");
	var y = document.getElementById("level_frame");
	
	x.innerText="level ${vo.grade}";
	y.src="${vo.frame_img}";
	
	// (1) 오늘의코디 게시물 리스트
	var startNum01 = $("#my_list_contents01 li").length/6; // oldlist안에 li태그의 길이
	var addListHtml01 = "";
	var url01= '/member/myPage01';
	var param01 = 
		{"startNum01" : startNum01,
			"log_id" : '${log_id}'
		};
	var pathname01 = window.location.pathname;
	var pn01 = pathname01.substring(pathname01.lastIndexOf('/')+1);
		console.log(startNum01);
		console.log("pn01: "+pn01);
		console.log("pathname01: "+pathname01);
	
	$.ajax({
		url : url01,
		type : 'GET',
		dataType : 'json',
		data :param01,
		success : function(data){
			for (var i = 0; i < data.length; i++) {
				addListHtml01 += "<li>";
                addListHtml01 += "<ul>";
                addListHtml01 += "<li><img class='my_list_file' src='/upload/todayCodi/"+data[i].file1+"' onclick='fnImgPop(this.src)' width='80' height='100'/></li>";
				addListHtml01 += "<li class='my_list_subtitle'>"+data[i].title+"</li>";
				addListHtml01 += "<li class='my_list_subcontent'>"+data[i].content+"</li>";
				addListHtml01 += "<li class='my_list_hit'>"+data[i].like_num+"</li>";
				addListHtml01 += "<li class='my_list_date'>"+data[i].write_date+"</li>";
				addListHtml01 += "</ul></li>";
               
			}
			if(data.length<5){
				$("#moreView01").remove();
			} 
			$("#my_list_contents01").append(addListHtml01);
			/* console.log(addListHtml); */
		}
	});
	// (2) 추천 게시물 리스트
	var startNum02 = $("#my_list_contents02 li").length/5; // oldlist안에 li태그의 길이
	var addListHtml02 = "";
	var url02= '/member/myPage02';
	var param02 = 
	{"startNum02" : startNum02,
		"log_id" : '${log_id}'
	};	var pathname02 = window.location.pathname;
	var pn02 = pathname02.substring(pathname02.lastIndexOf('/')+1);
		console.log(startNum02);

	$.ajax({
		url : url02,
		type : 'GET',
		dataType : 'json',
		data :param02,
		success : function(data){
			for (var i = 0; i < data.length; i++) {
				addListHtml02 += "<li>";
                addListHtml02 += "<ul>";
				addListHtml02 += "<li class='my_list_subtitle'>"+data[i].title+"</li>";
				addListHtml02 += "<li class='my_list_subcontent'>"+data[i].content+"</li>";
				addListHtml02 += "<li class='my_list_hit'>"+data[i].hit+"</li>";
				addListHtml02 += "<li class='my_list_date'>"+data[i].write_date+"</li>";
				addListHtml02 += "</ul>";
                addListHtml02 += "<a class='my_list_alink' href='/board/recommend/recommendView?board_num="+data[i].board_num+"'></a></li>";
				
			}
			if(data.length<5){
				$("#moreView02").remove();
			} 
			$("#my_list_contents02").append(addListHtml02);
			/* console.log(addListHtml); */
		}
	});
	// (3) 중고거래 게시물 리스트
	var startNum03 = $("#my_list_contents03 li").length/7; // oldlist안에 li태그의 길이
	var addListHtml03 = "";
	var url03= '/member/myPage03';
	var param03 = 
	{"startNum03" : startNum03,
		"log_id" : '${log_id}'
	};	var pathname03 = window.location.pathname;
	var pn03 = pathname03.substring(pathname03.lastIndexOf('/')+1);
		console.log(startNum03);

	$.ajax({
		url : url03,
		type : 'GET',
		dataType : 'json',
		data :param03,
		success : function(data){
			for (var i = 0; i < data.length; i++) {
				console.log("state_num: "+data[i].state_num);
				if(data[i].state_num ==3){
					addListHtml03 += "<li>";
	                addListHtml03 += "<ul>";
					addListHtml03 += "<li class='my_list_state'>[ "+data[i].state_name+" ]</li>";
					addListHtml03 += "<li class='my_list_subtitle'>"+data[i].title+"</li>";
					addListHtml03 += "<li class='my_list_subcontent'>"+data[i].content+"</li>";
					addListHtml03 += "<li class='my_list_hit'>"+data[i].hit+"</li>";
					addListHtml03 += "<li class='my_list_date'>"+data[i].write_date+"</li>";
					addListHtml03 += "<li class='my_list_tradedate'>"+data[i].trade_date+"</li>";
					addListHtml03 += "</ul>";
	                addListHtml03 += "<a class='my_list_alink' href='/board/old/oldView?board_num="+data[i].board_num+"'></a></li>";
				}else{          
					addListHtml03 += "<li>";
	                addListHtml03 += "<ul>";
					addListHtml03 += "<li class='my_list_state'>[&nbsp;&nbsp;"+data[i].state_name+"&nbsp;&nbsp;]</li>";
					addListHtml03 += "<li class='my_list_subtitle'>"+data[i].title+"</li>";
					addListHtml03 += "<li class='my_list_subcontent'>"+data[i].content+"</li>";
					addListHtml03 += "<li class='my_list_hit'>"+data[i].hit+"</li>";
					addListHtml03 += "<li class='my_list_date'>"+data[i].write_date+"</li>";
					addListHtml03 += "<li class='my_list_tradedate'>-</li>";
					addListHtml03 += "</ul>";
	                addListHtml03 += "<a class='my_list_alink' href='/board/old/oldView?board_num="+data[i].board_num+"'></a></li>";
				}
			}
			if(data.length<5){
				$("#moreView03").remove();
			} 
			$("#my_list_contents03").append(addListHtml03);
			/* console.log(addListHtml); */
		}
	});
	// (4) 구매후기 게시물 리스트
	var startNum04 = $("#my_list_contents04 li").length/5; // oldlist안에 li태그의 길이
	var addListHtml04 = "";
	var url04= '/member/myPage04';
	var param04 = 
	{"startNum04" : startNum04,
		"log_id" : '${log_id}'
	};	var pathname04 = window.location.pathname;
	var pn04 = pathname04.substring(pathname04.lastIndexOf('/')+1);
		console.log(startNum04);

	$.ajax({
		url : url04,
		type : 'GET',
		dataType : 'json',
		data :param04,
		success : function(data){
			for (var i = 0; i < data.length; i++) {
				addListHtml04 += "<li>";
                addListHtml04 += "<ul>";
				addListHtml04 += "<li class='my_list_subtitle'>"+data[i].title+"</li>";
				addListHtml04 += "<li class='my_list_subcontent'>"+data[i].content+"</li>";
				addListHtml04 += "<li class='my_list_hit'>"+data[i].hit+"</li>";
				addListHtml04 += "<li class='my_list_date'>"+data[i].write_date+"</li>";
				addListHtml04 += "</ul>";
                addListHtml04 += "<a class='my_list_alink' href='/board/review/reviewView?board_num="+data[i].board_num+"'></a></li>";
				
			}
			if(data.length<5){
				$("#moreView04").remove();
			} 
			$("#my_list_contents04").append(addListHtml04);
			/* console.log(addListHtml); */
		}
	});
	// (5)QnA 게시물 리스트
	var startNum05 = $("#my_list_contents05 li").length/5; // list안의 li태그의 개수
	var addListHtml05 = "";
	var url05 = '/member/myPage05';
	var param05 = 
	{"startNum05" : startNum05,
		"log_id" : '${log_id}'
	};	var pathname05 = window.location.pathname;
	var pn05 = pathname05.substring(pathname05.lastIndexOf('/')+1);
		console.log(startNum05);
	
	$.ajax({
		url : url05,
		type : 'GET',
		dataType : 'json',
		data :param05,
		success : function(data){
			for (var i = 0; i < data.length; i++) {
				addListHtml05 += "<li>";
                addListHtml05 += "<ul>";
				addListHtml05 += "<li class='my_list_subtitle'>"+data[i].title+"</li>";
				addListHtml05 += "<li class='my_list_subcontent'>"+data[i].content+"</li>";
				addListHtml05 += "<li class='my_list_hit'>"+data[i].hit+"</li>";
				addListHtml05 += "<li class='my_list_date'>"+data[i].write_date+"</li>";
				addListHtml05 += "</ul>";
                addListHtml05 += "<a class='my_list_alink' href='/board/qna/qnaView?board_num="+data[i].board_num+"'></a></li>";
				
			}
			if(data.length<5){
				$("#moreView05").remove();
			} 
			$("#my_list_contents05").append(addListHtml05);
			/* console.log(addListHtml); */
		}
	});
	// (6)오늘뭐입지 게시물 리스트
	var startNum06 = $("#my_list_contents05 li").length/5; // list안의 li태그의 개수
	var addListHtml06 = "";
	var url06 = '/member/myPage06';
	var param06 = 
	{"startNum06" : startNum06,
		"log_id" : '${log_id}'
	};	var pathname06 = window.location.pathname;
	var pn06 = pathname06.substring(pathname06.lastIndexOf('/')+1);
		console.log(startNum06);
	
	$.ajax({
		url : url06,
		type : 'GET',
		dataType : 'json',
		data :param06,
		success : function(data){
			for (var i = 0; i < data.length; i++) {
				addListHtml06 += "<li>";
                addListHtml06 += "<ul>";
				addListHtml06 += "<li class='my_list_subtitle'>"+data[i].title+"</li>";
				addListHtml06 += "<li class='my_list_subcontent'>"+data[i].content+"</li>";
				addListHtml06 += "<li class='my_list_hit'>"+data[i].hit+"</li>";
				addListHtml06 += "<li class='my_list_date'>"+data[i].write_date+"</li>";
				addListHtml06 += "</ul>";
                addListHtml06 += "<a class='my_list_alink' href='/board/vote/voteView?board_num="+data[i].board_num+"'></a></li>";
				
			}
			if(data.length<5){
				$("#moreView06").remove();
			} 
			$("#my_list_contents06").append(addListHtml06);
			/* console.log(addListHtml); */
		}
	});
	//게시물 리스트(댓글)
	var startNum07 = $("#my_list_contents07 li").length/3; 
	var addListHtml07 = "";
	
	var url07 = '/member/myPage07';
	var param07 = {"startNum07": startNum07};
	var pathname07 = window.location.pathname;
	var pn07 = pathname07.substring(pathname07.lastIndexOf('/')+1);
	
	console.log(startNum07);
	
	
	$.ajax({
		url : url07,
		type : 'GET',
		dataType : 'json',
		data :param07,
		success : function(data){
			for (var i = 0; i < data.length; i++) {
				addListHtml07 += "<li>";
                addListHtml07 += "<ul>";
				addListHtml07 += "<li class='my_list_subtitle'>"+data[i].title+"</li>";
				addListHtml07 += "<li class='my_list_subcontent'>"+data[i].coment+"</li>";
				addListHtml07 += "<li class='my_list_date'>"+data[i].reply_date+data[i].type_num+"</li>";
				addListHtml07 += "</ul>";
				if(data[i].type_num==1){
					 addListHtml07 += "<a class='my_list_alink' href='/board/today/todayView?board_num="+data[i].board_num+"'></a></li>";
				}else if(data[i].type_num==2){
					 addListHtml07 += "<a class='my_list_alink' href='/board/recommenc/recommendView?board_num="+data[i].board_num+"'></a></li>";
				}else if(data[i].type_num==3){
					 addListHtml07 += "<a class='my_list_alink' href='/board/old/oldView?board_num="+data[i].board_num+"'></a></li>";
				}else if(data[i].type_num==4){
					 addListHtml07 += "<a class='my_list_alink' href='/board/review/reviewView?board_num="+data[i].board_num+"'></a></li>";
				}else if(data[i].type_num==5){
					 addListHtml07 += "<a class='my_list_alink' href='/board/qna/qnaView?board_num="+data[i].board_num+"'></a></li>";
				}else if(data[i].type_num==6){
					 addListHtml07 += "<a class='my_list_alink' href='/board/vote/voteView?board_num="+data[i].board_num+"'></a></li>";
				}		
			}
			if(data.length<5){
				$("#moreView07").remove();
			} 
			$("#my_list_contents07").append(addListHtml07);
			console.log(addListHtml07);
		}
	});
}
//(1)오늘의 코디(더보기클릭)
function viewMore01(){
	var startNum01 = $("#my_list_contents01 li").length/6; // oldlist안에 li태그의 길이
	var addListHtml01 = "";
	var url01= '/member/myPage01';
	var param01 = {"startNum01" : startNum01};
	var pathname01 = window.location.pathname;
	var pn01 = pathname01.substring(pathname01.lastIndexOf('/')+1);
		console.log(startNum01);

	$.ajax({
		url : url01,
		type : 'GET',
		dataType : 'json',
		data :param01,
		success : function(data){
			for (var i = 0; i < data.length; i++) {
				addListHtml01 += "<li>";
                addListHtml01 += "<ul>";
                addListHtml01 += "<li><img class='my_list_file' src='/upload/todayCodi/"+data[i].file1+"' onclick='fnImgPop(this.src)' width='80' height='100'/></li>";
				addListHtml01 += "<li class='my_list_subtitle'>"+data[i].title+"</li>";
				addListHtml01 += "<li class='my_list_subcontent'>"+data[i].content+"</li>";
				addListHtml01 += "<li class='my_list_hit'>"+data[i].like_num+"</li>";
				addListHtml01 += "<li class='my_list_date'>"+data[i].write_date+"</li>";
				addListHtml01 += "</ul></li>";            
			}
			if(data.length<5){
				$("#moreView01").remove();
			} 
			$("#my_list_contents01").append(addListHtml01);
			/* console.log(addListHtml); */
		}
	});
}
// (2) 추천(더보기클릭)
function viewMore02(){
	var startNum02 = $("#my_list_contents02 li").length/5; // oldlist안에 li태그의 길이
	var addListHtml02 = "";
	var url02= '/member/myPage02';
	var param02 = {"startNum02" : startNum02};
	var pathname02 = window.location.pathname;
	var pn02 = pathname02.substring(pathname02.lastIndexOf('/')+1);
		console.log(startNum02);

	$.ajax({
		url : url02,
		type : 'GET',
		dataType : 'json',
		data :param02,
		success : function(data){
			for (var i = 0; i < data.length; i++) {
				addListHtml02 += "<li>";
                addListHtml02 += "<ul>";
				addListHtml02 += "<li class='my_list_subtitle'>"+data[i].title+"</li>";
				addListHtml02 += "<li class='my_list_subcontent'>"+data[i].content+"</li>";
				addListHtml02 += "<li class='my_list_hit'>"+data[i].hit+"</li>";
				addListHtml02 += "<li class='my_list_date'>"+data[i].write_date+"</li>";
				addListHtml02 += "</ul>";
                addListHtml02 += "<a class='my_list_alink' href='/board/recommend/recommendView?board_num="+data[i].board_num+"'></a></li>";
				
			}
			if(data.length<5){
				$("#moreView02").remove();
			} 
			$("#my_list_contents02").append(addListHtml02);
			/* console.log(addListHtml); */
		}
	});
}
//(3) 중고거래(더보기클릭)
function viewMore03(){
	var startNum03 = $("#my_list_contents03 li").length/7; // oldlist안에 li태그의 길이
	var addListHtml03 = "";
	var url03= '/member/myPage03';
	var param03 = {"startNum03" : startNum03};
	var pathname03 = window.location.pathname;
	var pn03 = pathname03.substring(pathname03.lastIndexOf('/')+1);
		console.log(startNum03);

	$.ajax({
		url : url03,
		type : 'GET',
		dataType : 'json',
		data :param03,
		success : function(data){
			for (var i = 0; i < data.length; i++) {
				console.log("state_num:"+data[i].state_num);
				if(data[i].state_num ==3){
					addListHtml06 += "<li>";
	                addListHtml06 += "<ul>";
					addListHtml06 += "<li class='my_list_state'>"+data[i].state_name+"</li>";
					addListHtml06 += "<li class='my_list_subtitle'>"+data[i].title+"</li>";
					addListHtml06 += "<li class='my_list_subcontent'>"+data[i].content+"</li>";
					addListHtml06 += "<li class='my_list_hit'>"+data[i].hit+"</li>";
					addListHtml06 += "<li class='my_list_date'>"+data[i].write_date+"</li>";
					addListHtml06 += "<li class='my_list_tradedate'>"+data[i].trade_date+"</li>";
					addListHtml06 += "</ul>";
	                addListHtml06 += "<a class='my_list_alink' href='/board/old/oldView?board_num="+data[i].board_num+"'></a></li>";
				}else{
					addListHtml06 += "<li>";
	                addListHtml06 += "<ul>";
					addListHtml06 += "<li class='my_list_subtitle'>"+data[i].title+"</li>";
					addListHtml06 += "<li class='my_list_subcontent'>"+data[i].content+"</li>";
					addListHtml06 += "<li class='my_list_hit'>"+data[i].hit+"</li>";
					addListHtml06 += "<li class='my_list_date'>"+data[i].write_date+"</li>";
					addListHtml06 += "<li class='my_list_tradedate'>-</li>";
					addListHtml06 += "</ul>";
	                addListHtml06 += "<a class='my_list_alink' href='/board/old/oldView?board_num="+data[i].board_num+"'></a></li>";
				}
			}
			if(data.length<5){
				$("#moreView03").remove();
			} 
			$("#my_list_contents03").append(addListHtml03);
			/* console.log(addListHtml); */
		}
	});
}
// (4) 구매후기 (더보기클릭)
function viewMore04(){
	var startNum04 = $("#my_list_contents04 li").length/5; // list안의 li태그의 개수
	var addListHtml04 = "";
	var url04 = '/member/myPage04';
	var param04 = {"startNum04" : startNum04};
	var pathname04 = window.location.pathname;
	var pn04 = pathname04.substring(pathname04.lastIndexOf('/')+1);
		console.log(startNum04);
	
	$.ajax({
		url : url04,
		type : 'GET',
		dataType : 'json',
		data :param04,
		success : function(data){
			for (var i = 0; i < data.length; i++) {
				addListHtml04 += "<li>";
                addListHtml04 += "<ul>";
				addListHtml04 += "<li class='my_list_subtitle'>"+data[i].title+"</li>";
				addListHtml04 += "<li class='my_list_subcontent'>"+data[i].content+"</li>";
				addListHtml04 += "<li class='my_list_hit'>"+data[i].hit+"</li>";
				addListHtml04 += "<li class='my_list_date'>"+data[i].write_date+"</li>";
				addListHtml04 += "</ul>";
                addListHtml04 += "<a class='my_list_alink' href='/board/review/reivewView?board_num="+data[i].board_num+"'></a></li>";
				
			}
			if(data.length<5){
				$("#moreView04").remove();
			} 
			$("#my_list_contents04").append(addListHtml04);
			/* console.log(addListHtml); */
		}
	});
}
// (5)QnA (더보기)
function viewMore05(){
	var startNum05 = $("#my_list_contents05 li").length/5; // list안의 li태그의 개수
	var addListHtml05 = "";
	var url05 = '/member/myPage05';
	var param05 = {"startNum05" : startNum05};
	var pathname05 = window.location.pathname;
	var pn05 = pathname05.substring(pathname05.lastIndexOf('/')+1);
		console.log(startNum05);
	
	$.ajax({
		url : url05,
		type : 'GET',
		dataType : 'json',
		data :param05,
		success : function(data){
			for (var i = 0; i < data.length; i++) {
				addListHtml05 += "<li>";
                addListHtml05 += "<ul>";
				addListHtml05 += "<li class='my_list_subtitle'>"+data[i].title+"</li>";
				addListHtml05 += "<li class='my_list_subcontent'>"+data[i].content+"</li>";
				addListHtml05 += "<li class='my_list_hit'>"+data[i].hit+"</li>";
				addListHtml05 += "<li class='my_list_date'>"+data[i].write_date+"</li>";
				addListHtml05 += "</ul>";
                addListHtml05 += "<a class='my_list_alink' href='/board/qna/qnaView?board_num="+data[i].board_num+"'></a></li>";
				
			}
			if(data.length<5){
				$("#moreView05").remove();
			} 
			$("#my_list_contents05").append(addListHtml05);
			/* console.log(addListHtml); */
		}
	});
}
// (6)오늘뭐입지 (더보기)
function viewMore06(){
	var startNum06 = $("#my_list_contents06 li").length/5; // list안의 li태그의 개수
	var addListHtml06 = "";
	var url06 = '/member/myPage06';
	var param06 = {"startNum06" : startNum06};
	var pathname06 = window.location.pathname;
	var pn06 = pathname06.substring(pathname06.lastIndexOf('/')+1);
		console.log(startNum06);
	
	$.ajax({
		url : url06,
		type : 'GET',
		dataType : 'json',
		data :param06,
		success : function(data){
			for (var i = 0; i < data.length; i++) {
				addListHtml06 += "<li>";
                addListHtml06 += "<ul>";
				addListHtml06 += "<li class='my_list_subtitle'>"+data[i].title+"</li>";
				addListHtml06 += "<li class='my_list_subcontent'>"+data[i].content+"</li>";
				addListHtml06 += "<li class='my_list_hit'>"+data[i].hit+"</li>";
				addListHtml06 += "<li class='my_list_date'>"+data[i].write_date+"</li>";
				addListHtml06 += "</ul>";
                addListHtml06 += "<a class='my_list_alink' href='/board/vote/voteView?board_num="+data[i].board_num+"'></a></li>";
			}
			if(data.length<5){
				$("#moreView06").remove();
			} 
			$("#my_list_contents06").append(addListHtml06);
			/* console.log(addListHtml); */
		}
	});
}
//(7)댓글(더보기)
function viewMore07(){
	var startNum07 = $("#my_list_contents07 li").length/3; // oldlist안에 li태그의 길이
	var addListHtml07 = "";
	var url07 = '/member/myPage07';
	var param07 = {"startNum07": startNum07};
	var pathname07 = window.location.pathname;
	var pn07 = pathname07.substring(pathname07.lastIndexOf('/')+1);
	
	console.log(startNum07);
	
	
	$.ajax({
		url : url07,
		type : 'GET',
		dataType : 'json',
		data :param07,
		success : function(data){
			for (var i = 0; i < data.length; i++) {
				addListHtml07 += "<li>";
                addListHtml07 += "<ul>";
				addListHtml07 += "<li class='my_list_subtitle'>"+data[i].title+"</li>";
				addListHtml07 += "<li class='my_list_subcontent'>"+data[i].coment+"</li>";
				addListHtml07 += "<li class='my_list_date'>"+data[i].reply_date+"</li>";
				addListHtml07 += "</ul>";
				if(data[i].type_num==1){
					 addListHtml07 += "<a class='my_list_alink' href='/board/today/todayView?board_num="+data[i].board_num+"'></a></li>";
				}else if(data[i].type_num==2){
					 addListHtml07 += "<a class='my_list_alink' href='/board/recommenc/recommendView?board_num="+data[i].board_num+"'></a></li>";
				}else if(data[i].type_num==3){
					 addListHtml07 += "<a class='my_list_alink' href='/board/old/oldView?board_num="+data[i].board_num+"'></a></li>";
				}else if(data[i].type_num==4){
					 addListHtml07 += "<a class='my_list_alink' href='/board/review/reviewView?board_num="+data[i].board_num+"'></a></li>";
				}else if(data[i].type_num==5){
					 addListHtml07 += "<a class='my_list_alink' href='/board/qna/qnaView?board_num="+data[i].board_num+"'></a></li>";
				}else if(data[i].type_num==6){
					 addListHtml07 += "<a class='my_list_alink' href='/board/vote/voteView?board_num="+data[i].board_num+"'></a></li>";
				}			
			}
			if(data.length<5){
				$("#moreView07").remove();
			} 
			$("#my_list_contents07").append(addListHtml07);
			console.log(addListHtml07);
		}
	});
}

function fnImgPop(url){
	  var img=new Image();
	  img.src=url;
	  var img_width=img.width;
	  var win_width=img.width+25;
	  var img_height=img.height;
	  var win=img.height+30;
	  var OpenWindow=window.open('','_blank', 'width='+img_width+', height='+img_height+', menubars=no, scrollbars=auto');
	  OpenWindow.document.write("<style>body{margin:0px;}</style><img src='"+url+"' width='"+win_width+"'>");
}
</script>

<!-- ---------------------------------------------------------------------------------------------------------------------------------------- -->
<input type="hidden" name="user_id" value="${vo.user_id}"/>
<div id="mypage_wrap">
	<ul id="profile">
		<li>
			<img id ="p_img" src="/upload/${vo.profile_image}" alt="프로필 이미지">
			<img id="level_frame" alt="등급 프레임 이미지">
			<p><a id="profile_upload" data-target="#changeModal" data-toggle="modal">프로필 사진<br/>바꾸기</a></p>
		</li><!-- 모달은 맨 밑 -->
		<li class="userid">${vo.user_nickname} (${vo.user_id})</li>
		<li class="grade">
			<span id="user_grade"></span>
			<p id="grade_menual">
				<br/>
				&nbsp;&nbsp;&nbsp; level 1 : point 0 ~ 90<br/>
				&nbsp;&nbsp;&nbsp; level 2 : point 100 ~ 190<br/>
				&nbsp;&nbsp;&nbsp; level 3 : point 200 ~ 290<br/>
				&nbsp;&nbsp;&nbsp; level 4 : point 300 ~ 390<br/>
				&nbsp;&nbsp;&nbsp; level 5 : point 400 ~<br/>
				<br/>
				&nbsp;&nbsp;&nbsp; 게시물 1개 - 10 point<br/>
				&nbsp;&nbsp;&nbsp; 댓글 1개 - 3 point
			</p>
		</li>
		<li id="my_count">
			<ul>
				<li>내 포인트</li>
				<li>${vo.exp}</li>
			</ul>
			<ul>
				<li>받은 추천</li>
				<li>${total_like}</li>
			</ul>
			<ul>
				<li>받은 신고</li>
				<li>${vo.report_hit}</li>
			</ul>
		</li>
		<li><button><a href="/member/pwdCheck">회원정보수정</a></button></li>
		<li><button><a href="/member/byeCheck">회원탈퇴</a></button></li>
	</ul>
	<ul id="my_list">
		<li>
			<input type="radio" name="tab" id="tab1" checked>
			<label for="tab1">오늘의 코디</label>
			<div>
				<ul class="my_list_title01">
					<li>코디</li>
					<li>게시물 제목</li>
					<li>내용</li>
					<li>추천수</li>
					<li>작성날짜</li>
				</ul>
				<ul class="my_list_contents01" id="my_list_contents01">
				</ul>
				<a class="moreViews" id="moreView01" onclick="viewMore01()"><img src="/img/더보기.png" style="width:100px;"></a>
			</div>
		</li>
		<li>
			<input type="radio" name="tab" id="tab2">
			<label for="tab2">스타일 추천</label>
			<div>
				<ul class="my_list_title">
					<li>게시물 제목</li>
					<li>내용</li>
					<li>조회수</li>
					<li>작성일</li>
				</ul>
				<ul class="my_list_contents" id="my_list_contents02">
				</ul>
				<a class="moreViews" id="moreView02" onclick="viewMore02()"><img src="/img/더보기.png" style="width:100px;"></a>
			</div>
		</li>
		<li>
			<input type="radio" name="tab" id="tab3">
			<label for="tab3">중고거래</label>
			<div>
				<ul class="my_list_title03">
					<li>거래 상태</li>
					<li>게시물 제목</li>
					<li>내용</li>
					<li>조회수</li>
					<li>작성일</li>
					<li>거래완료일</li>
				</ul>
				<ul class="my_list_contents03" id="my_list_contents03" >
				</ul>
				<a class="moreViews" id="moreView03" onclick="viewMore03()"><img src="/img/더보기.png" style="width:100px;"></a>
			</div>
		</li>
		<li>
			<input type="radio" name="tab" id="tab4">
			<label for="tab4">구매후기</label>
			<div>
				<ul class="my_list_title">
					<li>게시물 제목</li>
					<li>내용</li>
					<li>조회수</li>
					<li>작성일</li>
				</ul>
				<ul class="my_list_contents" id="my_list_contents04">
				</ul>
				<a class="moreViews" id="moreView04" onclick="viewMore04()"><img src="/img/더보기.png" style="width:100px;"></a>
			</div>
		</li>
		<li>
			<input type="radio" name="tab" id="tab5">
			<label for="tab5">QnA</label>
			<div>
				<ul class="my_list_title">
					<li>제목</li>
					<li>내용</li>
					<li>조회수</li>
					<li>작성일</li>
				</ul>
				<ul class="my_list_contents" id="my_list_contents05">
				</ul>
				<a class="moreViews" id="moreView05" onclick="viewMore05()"><img src="/img/더보기.png" style="width:100px;"></a>
			</div>
		</li>
		<li>
			<input type="radio" name="tab" id="tab6">
			<label for="tab6">오늘 뭐입지?</label>
			<div>
				<ul class="my_list_title">
					<li>제목</li>
					<li>내용</li>
					<li>조회수</li>
					<li>작성일</li>
				</ul>
				<ul class="my_list_contents" id="my_list_contents06">
				</ul>
				<a class="moreViews" id="moreView06" onclick="viewMore06()"><img src="/img/더보기.png" style="width:100px;"></a>
			</div>
		</li>
		<li>
         <input type="radio" name="tab" id="tab7">
         <label for="tab7">댓글</label>
         <div>
            <ul class="my_list_title">
               <li>게시물 제목</li>
               <li>댓글 내용</li>
               <li>작성일</li>
            </ul>
            <ul class="my_list_contents" id="my_list_contents07">
            </ul>
            <a class="moreViews" id="moreView07" onclick="viewMore07()"><img src="/img/더보기.png" style="width:100px;"></a>
         </div>
</li>
	</ul>
</div>
<!-- 프로필 사진 바꾸기 모달 -->
		<div id="changeModal" class="modal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h2>프로필 사진 바꾸기</h2>
						<button class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<form method="post" id="changeForm" action="/member/changeProfileImg" enctype="multipart/form-data">
							<ul>
								<li>
									<div>
				                      	<img style="width: 400px; height:400px; border-radius: 70%;" id="img_section" src="/upload/${vo.profile_image}">
				                      	<img style="width: 400px; border-radius: 70%;" src="${vo.frame_img}"><br/>
				                    	<input type="text" id="file_route"  disabled="disabled" value="${vo.profile_image}" >
				                     	<label for="upload_file">업로드</label>
				                       	<input type="file" id="upload_file" name="filename" accept="image/*" style="position:absolute; clip:rect(0, 0, 0, 0);"  value="${vo.profile_image}"><br/>
				                    </div>
				                    <script>
				                    	//프로필 사진 바꾸기
					                    const reader = new FileReader();
					                	reader.onload = (readerEvent) => {
					                		document.querySelector("#img_section").setAttribute("src", readerEvent.target.result);
					                	};
					                	document.querySelector("#upload_file").addEventListener("change", (changeEvent) => {
					                		const imgFile = changeEvent.target.files[0];
					                		reader.readAsDataURL(imgFile);
					                		const fileName = document.getElementById("file_route");
					                		fileName.value = imgFile.name;
					                	});
				                    </script>
								</li>
								<hr />
								<li><input type='submit' value='확인' id="changebtn" /></li>
							</ul>
						</form>
					</div>
				</div>
			</div>
		</div>


