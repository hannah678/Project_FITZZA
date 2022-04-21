<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<link rel="stylesheet" href="/css/vote.css" type="text/css">
<style>
   #logStatus3 > img {vertical-align:top;}
   #logStatus4 > img {vertical-align:top;}
   #logStatus5 > img {vertical-align:top;}
   
   .button02{
	position:absolute;
	right:5px;
	cursor:pointer;
	margin-left:15px; 
	text-align:center;
	width:90px;
	height:50px;
	line-height:50px;
	font-size:23px;
	color: #fff;
	border-radius: 10px;
	font-family:'Nanum pen script';
	background-color: rgb( 227, 104, 83);
	transition:all.15s linear;
}
</style>
<script>
function delCheck(){
	if(confirm("삭제하시겠습니까?")){
		location.href = "/board/boardDelete?board_num="+${vo.board_num};     // 게시글 삭제 매핑
	}
}//del

$(function(){
	//투표제출
		$("#voteFrm").submit(function(){
				event.preventDefault(); 
				var params = $("#voteFrm").serialize();
			
				$.ajax({
					url :'/vote/votein',
					data: params,
					type: 'POST',
					success : function(su){
						$("#vote22").css("display","none");
						
						
						
						var tag ="<div class='summary'>";
							tag += "<p>총 투표수 : "+su.cnt3+"</p></div>";
							tag += "<ol class='result2'><li>";
							tag += "<p id='img_5'>이미지 1 : <span title='투표수'>"+su.cnt1+"표</span></p><p class='graph'>";
							tag += "<span class='graphbox'><span style='width:"+su.cnt4+"%''>&nbsp;</span></span>";
							tag += "<em title='투표율'>("+su.cnt4+"%)</em></p></li>";
							tag += "<li><p id='img_6'>이미지 2 : <span title='투표수'>"+su.cnt2+"표</span></p><p class='graph'>";
							tag += "<span class='graphbox'><span style='width:"+su.cnt5+"%''>&nbsp;</span></span>";
							tag += "<em title='투표율'>("+su.cnt5+"%)</em></p></li></ol>";
							
							$("#vote24").html(tag);
							$("#vote24").css("display","block");
					},
					error : function(er){
						console.log(er.responseText);
						alert("투표 에러 발생");
					}
				});//ajax
		});
	// 신고------------------------------------------------------------
		$("#reportForm").submit(function(){
			event.preventDefault(); //form 기본이벤트 제거
			if($("#report_content").val()==""){
				alert("신고 내용을 입력해주세요.");
				return;
			}else{ //댓글 입력한 경우
				var params = $("#reportForm").serialize();
			
				$.ajax({
					url: '/board/reportOk',
					data: params,
					type:'POST',
					success: function(r){
						alert("신고 접수되었습니다.");
						$('#reportModal').modal('hide');
					},
					error: function(e){
						console.log(e.responseText);
						alert("전송 실패");
					}
				});
			}
		});
	
	function replyListAll(){
		var url = "/reply/replyList";   // 댓글 리스트
		var params = "board_num=${vo.board_num}";    // 게시글 넘버
		$.ajax({
			url:url,
			data:params,
			success:function(result){
				var $result = $(result);
				console.log(result);
				console.log(${vo.board_num});
				var tag = "<ul>";
				$result.each(function(idx, vo){		//vo에서 프로필사진 가져올 자리
					tag += "<li><div class='reply_area'>" + "<div class='profile_img'><img src='/upload/"+vo.profile_image+"' class='reply_img1'/><img src='"+vo.frame_img+"' class='reply_img2'></div>";
					
					tag += "<div class='reply_posting'><div class='comment'><b>"+vo.user_nickname+"</b>" + vo.coment + "</div>";
					tag += "<div class='reply_info'>"+ vo.reply_date +"</div></div>";
					
					tag += "<div class='reply_buttond'>";
					
					if(vo.user_id == '${logId}'){   // user_id
						tag += "<input type='button' value='수정' class='reply_button'/> ";
						tag += "<input type='button' value='삭제' title='"+vo.reply_num+"' class='reply_button'/>";
					}
					
					tag +="</div>";
					if(vo.user_id == '${logId}'){   // user_id
						tag += "<div style='display:none'><form method='post'>";
						tag += "<input type='hidden' name='reply_num' value='"+vo.reply_num+"'/>";
						tag += "<textarea name='coment' class='comment_modi'>"+vo.coment+"</textarea>";
						tag += "<input type='submit' value='수정' class='reply_button3'/></form></div>";
					}	
					tag += "</div></li>";
				});
				tag += "</ul>";
				
				$("#replyList").html(tag);
				
			},error:function(e){
				console.log(e.responseText);
			}
			
		});
	}
    // 댓글등록------------------------------------------------------------
	$("#replyFrm").submit(function(){
		event.preventDefault();
		if($("#coment").val()==""){
			alert("댓글을 입력후 등록하세요.")
			return;
		}else{	// 댓글 쓴경우
			var params = $("#replyFrm").serialize();
			$.ajax({
				url:'/reply/replyWrite',     // 댓글writeOk로 매핑
				data:params,
				type:'POST',
				success:function(r){
					$("#coment").val("");
					replyListAll();
				},error:function(e){
					console.log(e.responseText);
				}
			});
		}
	});
	$(document).on('click','#replyList input[value="수정"]',function(){
		$(this).parent().css("display","none");
		$(this).parent().prev().css("display","none");
		$(this).parent().next().css("display","block");
	});
    $(document).on('submit','#replyList form',function(){
        event.preventDefault();
        let params2 = $(this).serialize();
        let url2 = '/reply/replyEditOk';
        $.ajax({
            url : url2,
            data : params2,
            type : 'POST',
            success : function(result){
                console.log(result);
                replyListAll();
            }, error : function(e){
                console.log('수정에러');
            }
        });
    });
	$(document).on('click','#replyList input[value="삭제"]',function(){
		if(confirm('댓글을 삭제하시겠습니까?')){
			var params = "reply_num=" + $(this).attr("title");
			$.ajax({
				url:'/reply/replyDelete',
				data:params,
				success:function(result){
					console.log(result);
					replyListAll();
				}, error:function(){
					console.log("댓글삭제에러발생...")
				}
			});
		}
	});
	//조회수 두배 방지용 주석
	//
	replyListAll();
});

//프레임 이미지
window.onload=function(){
	var exp = ${vo.exp};
	document.getElementById("level_frame").src="${vo.frame_img}";
}

</script>
</head>
<body>
<div id = vote-wrapper>
	<div class="vote_container">
		<ul>
			<li class="Top_menu"><div id="Top_name">${vo.title }</div><div style="float:right;"><a href="/board/vote/voteList" style="color:black">목록으로</a></div></li>
			<li id="vmain_container"><div id="main_area">
					<div class="vote_box img_11"><img src="/upload/${vo.file1}"><div style="clear:both"> 이미지 1</div></div>
					<div class="vote_box img_12"><img src="/upload/${vo.file2}"><div> 이미지 2</div></div>
				</div>
				<div id="vote24" style="display:none">
				</div>
				<c:if test="${us.user_id != null}">
				<div id="vote23">
						<div class="summary">
							<p>총 투표수 : ${cnt3}</p>
						</div>
						<ol class="result2">
							<li>
								<p id="img_3">이미지 1 : <span title="투표수">${cnt1}표</span></p>
								<p class="graph">
									<span class="graphbox"><span style="width:${cnt4}%">&nbsp;</span></span>
									<em title="투표율">(${cnt4}%)</em>	
								</p>
							</li>
							<li>
								<p id="img_4">이미지 2 : <span title="투표수">${cnt2}표</span></p>
								<p class="graph">
									<span class="graphbox"><span style="width:${cnt5}%">&nbsp;</span></span>
									<em title="투표율">(${cnt5}%)</em>	
								</p>
							</li>
						</ol>
				</div> 
				</c:if>
				<!-- 투표할때 -->
				<c:if test="${us.user_id == null}">
				<div id="vote22"  style="display:block">
						<div class="summary">
							<p style="font-size: 16px;">더 나은곳에 투표하세요</p>
						</div>
						<form method="POST" id="voteFrm">
						<input type="hidden" name="user_id" value="${vo.user_id}"/>
						<input type="hidden" name="board_num" value="${vo.board_num}"/>
						<ol class="result">
							<li>
								<input type="radio" name="vote_item_order" value="1" class="rbtn"/>
								<p id="img_1">이미지 1</p>
							</li>
							<li>
								<input type="radio" name="vote_item_order" value="2" class="rbtn"/>
								<p id="img_2">이미지 2</p>
							</li>
							<li style="border-bottom:none"><input type="submit" value="등록" id="subbtn"/></li>
						</ol>
						</form>
				</div>
				</c:if>
				<div id="content">${vo.content}</div>
			</li>
			
			<li class="bottom_menu"><c:if test="${logId != vo.user_id && logPermission !='admin'}"><div id="reportModal" class="button02" data-target="#reportModal" data-toggle="modal">신고</div></c:if><c:if test="${logId == vo.user_id||logPermission =='admin'}"><a href="/board/vote/voteEdit?board_num=${vo.board_num}" class="button01">수정</a> <a id="del" href="javascript:delCheck()" class="button01">삭제</a></c:if></li>
			<li>
				<ul class="vote_profile">
					<li>작성자 정보</li>
					<li>
						<img src="/upload/${vo.profile_image}" alt="프로필 이미지" id="profile_frame">
						<img src="${vo.frame_img}" id="level_frame" alt="등급 프레임 이미지" >
					</li>
					<li>작성자 : ${vo.user_nickname}</li>
					<li>신고받은 횟수 : ${vo.report_hit}</li>
				</ul>
				</li>
		</ul>
	</div>

	<div class="reply"><!--  댓글 다는곳 -->
	 <hr />
		<b>댓글</b>
		<hr />
		<div id="replyList"></div>
			<c:if test="${logStatus =='Y'}">
				<div id="reply_cmnts">
				<form id="replyFrm">
					<input type="hidden" name="board_num" value="${vo.board_num}" />
					<textarea name="coment" id='coment' placeholder=" 댓글 입력"></textarea>
					<input type="submit" value="등록" id="replybtn" />
				</form>
				</div>
			</c:if>
	</div>
</div>
<!-- 신고 모달 -->
<div id="reportModal" class="modal">
	<!-- modal -->
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h2>게시물 신고</h2>
				<button class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
				<c:if test="${logStatus=='Y'}">
					<form method="post" id="reportForm">
						<input type="hidden" name="board_num" value="${vo.board_num}" />
						<ul>
							<li>신고 이유 &emsp; <select name="category_num">
									<option value="1">광고</option>
									<option value="2">사기거래</option>
									<option value="3">욕설/비방</option>
									<option value="4">사칭</option>
							</select>
							</li>
							<hr />
							<li>신고 내용<br /> <textarea name="report_content" rows="5"
									cols="30"></textarea> <input type='submit' value='신고 접수'
								id="reportbtn" />
							</li>
						</ul>
					</form>
				</c:if>
				<c:if test="${logStatus!='Y'}">
					<h3>로그인 후에 가능합니다.</h3>
				</c:if>
			</div>
		</div>
	</div>
</div>