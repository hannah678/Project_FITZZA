<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <link rel="stylesheet" href="/css/todayCodi.css" type="text/css"/>
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
    <style>
    	footer {display:none;}
    	header {margin-top:-50px}
  	</style>
 	
<script>		
  	window.onload=function(){
		var imgTag='';
		var url = '/board/todayCodi/todayCodiLists';
		var param='';

		$.ajax({
			url : url,
			type : 'POST',
			data : param,
			success : function(data){
				for (var i = 0; i < data.length; i++) {
					console.log(data[i].like_num);
					imgTag +="<figure>";
					imgTag += "<img class='tc_upload_img' src='/upload/todayCodi/"+data[i].file1+"'/>";
					imgTag += "<div class='hover-effect'>";
					imgTag += "<a href='javascript:;'>";
					imgTag += "<img src='/upload/"+data[i].profile_image+"'>";
					imgTag += "<p>"+data[i].user_nickname+"</p>";
					imgTag += "<span>"+data[i].write_date + data[i].heart_type+"</span>";
					
					if(data[i].heart_type==1){
							imgTag += "<p class='like_btn'><img src='/img/heart_fill.png' class='heart_empty' alt='채운하트'>";
					}else{
							imgTag += "<p class='like_btn'><img src='/img/heart_empty.png' class='heart_empty' alt='빈하트'>";
					}
					
					imgTag += "<span>추천 수 : "+data[i].like_num+"</span></p>";
					imgTag += "<input type='hidden' value='"+data[i].board_num+"'/>";			
					imgTag += "<div class='buttons'><button>수정</button><button>삭제</button><button>신고</button></div></a></div>";	
					imgTag +="</figure>";
				}				
				$("#columns").append(imgTag);
			}
		});
	}
	$(document).ready(function(){		
		//최신순, 좋아요순 정렬
		$('#order_new').addClass('button_toggled');
		$('#order_like').addClass('button_normal');
		$('#order_new').click( function() {
			if($(this).hasClass('button_normal')) {
				$(this).removeClass('button_normal').addClass('button_toggled');
				$('#like_order').removeClass('button_toggled').addClass('button_normal');
			}
		});
		$('#order_like').click( function() {
			if($(this).hasClass('button_normal')) {
				 $(this).removeClass('button_normal').addClass('button_toggled');
				 $('#order_new').removeClass('button_toggled').addClass('button_normal');
			}
		});
				
		
	});

	var OType;
	function change(order_type){
		if(OType!=order_type){
			OType = order_type;
			$("#columns").empty();
			moreList();
		}
	}
	function moreList(){
		var imgTag='';
		var url = '/board/todayCodi/todayCodiLists';
		var param = {"order_type" : OType};
	
		$.ajax({
			url : url,
			type : 'POST',
			dataType : 'json',
			data :param,
			success : function(data){
				for (var i = 0; i < data.length; i++) {
					console.log(data[i].like_num);
					imgTag +="<figure>";
					imgTag += "<img class='tc_upload_img' src='/upload/todayCodi/"+data[i].file1+"'/>";
					imgTag += "<div class='hover-effect'>";
					imgTag += "<a href='javascript:;'>";
					imgTag += "<img src='/upload/"+data[i].profile_image+"'>";
					imgTag += "<p>"+data[i].user_nickname+"</p>";
					imgTag += "<span>"+data[i].write_date + data[i].heart_type+"</span>";
					
					if(data[i].heart_type==1){
							imgTag += "<p class='like_btn'><img src='/img/heart_fill.png' class='heart_empty' alt='채운하트'>";
					}else{
							imgTag += "<p class='like_btn'><img src='/img/heart_empty.png' class='heart_empty' alt='빈하트'>";
					}
					
					imgTag += "<span>추천 수 : "+data[i].like_num+"</span></p>";
					imgTag += "<input type='hidden' value='"+data[i].board_num+"'/>";			
					imgTag += "<div class='buttons'><button>수정</button><button>삭제</button><button>신고</button></div></a></div>";	
					imgTag +="</figure>";
				}				
				$("#columns").append(imgTag);
			}
		});
	}
	$(document).on('click', '.like_btn', function(){
		var cb = $(this);
		var heart_click = cb.next().val();
		var params = {board_num: heart_click};
		$.ajax({
			url : '/board/Like',
			type : 'POST',
			dataType : 'json',
			data :params,
			success : function(data){
				if(data.cnt==1){
				    cb.children().first().attr("src", "/img/heart_empty.png");
				    cb.children().last().text("추천 수 : "+data.like_num);
				}else{
				    cb.children().first().attr("src", "/img/heart_fill.png");
				    cb.children().last().text("추천 수 : "+data.like_num);
				}	 
			} 				
		});
	});
</script>
<body>
	<div id="tc_container">
		<div id="tc_wrap">
			<h1>오늘의 코디</h1>
			<div id="rec_btn">
		    	<button onclick="change()" id="order_new">최신순</button>
		    	<button onclick="change('L')" id="order_like">추천순</button>
		    </div>
			<div id="write"><a href="/board/todayCodi/todayCodiWrite">글쓰기</a></div>
			<ul id="tc_box" >
					<li class='tc_img' style='margin: -270px 40px 0 0px;'>
						<div id="columns"></div>
					</li>
			</ul>
		</div>
	</div>
</body>
