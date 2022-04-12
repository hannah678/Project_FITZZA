<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">


<script>
	

	function delCheck(){
		if(confirm("삭제하시겠습니까?")){
			location.href = "";     // 게시글 삭제 매핑
		}
	}
    // 댓글------------------------------------------------------------
	$(function(){
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
						alert("전송 성공");
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
					
					var tag = "<ul>";
					$result.each(function(idx, vo){
						tag += "<li><div>" + vo.user_id + " (" + vo.reply_date + ") ";
	
						if(vo.user_id == ''){   // user_id
							tag += "<input type='button' value='수정'/>";
							tag += "<input type='button' value='삭제' title='"+vo.reply_num+"'/>";
						}
						tag += "<br/><br/>" + vo.coment + "</div>";
						
						if(vo.user_id == ''){   // user_id
							tag += "<div style='display:none'><form method='post'>";
							tag += "<input type='hidden' name='replyno' value='"+vo.reply_num+"'/>";
							tag += "<textarea name='coment' style='width:400px; height:50px;'>"+vo.coment+"</textarea>";
							tag += "<input type='submit' value='수정'/></form></div>";
						}	
						tag += "<hr/></li>";
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
						alert("댓글 등록 완료");
						replyListAll();
					},error:function(e){
						console.log(e.responseText);
					}
				});
			}
		});
		$(document).on('click','#replyList input[value=Edit]',function(){
			$(this).parent().css("display","none");
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
		$(document).on('click','#replyList input[value=Del]',function(){
			if(confirm('댓글을 삭제하시겠습니까?')){
				var params = "replyno=" + $(this).attr("title");
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
		//조회수 두배 방지용 주석!
		//아래 함수의 url 관련 문제로 추정됩니다
		replyListAll();
	});
    
    //프레임 이미지
	window.onload=function(){
		var exp = ${vo.exp};
		document.getElementById("level_frame").src="${vo.frame_img}";
	}
</script>
<link rel="stylesheet" href="/css/oldview.css" type="text/css">
<body>
    <hr/>
    <div class="oldlist">
            <ul>
                <img src="/upload/${vo.file1}"/>
                <br/>
                <li>[${vo.state_name}]&nbsp;&nbsp;${vo.title}</li>
                <br/>
                <li>(${vo.gender_name})&nbsp;&nbsp;${vo.old_name}</li>
                <br/>
                <li>${vo.old_price} 원</li>
            </ul>
            <hr/>
            <ul>
                <li>조회수 &nbsp; ${vo.hit}<!--hit--> &emsp; &emsp; 게시일 &nbsp; ${vo.write_date} <!--enter_date--></li>
				<li>${vo.user_id}</li>
				<c:if test="${logId == vo.user_id}">
					<li><a href="/board/old/oldEdit?board_num=${vo.board_num}"><button>수정하기</button></a></li>
					<li><a href="/board/boardDelete?board_num=${vo.board_num}"><button>삭제하기</button></a></li>
	                <li><input type="button" value="신고하기" id="report" data-target="#reportModal" data-toggle="modal"/></li>
            	</c:if>
            	<hr/>
            	<li id="seller"><b>판매자 정보</b><hr/>
                    <img src="${vo.profile_image}" alt="프로필 이미지"><img id="level_frame" alt="등급 프레임 이미지"> ${vo.user_nickname}<!--user_nickname--><br/> 거래 가능 지역 : ${vo.city}<!--city--><br/> 신고 받은 횟수 : ${vo.report_hit}<!--report_hit--> </li>
            </ul>
            <hr/>
            <ul class="info">
                
            	<li id="item"><b>상품 정보</b><hr/>
            		<c:if test="${vo.file2!=null && vo.file2 !=''}">
						<img src="/upload/${vo.file2}" width="300"/>
					</c:if>
					<c:if test="${vo.file3!=null && vo.file3 !=''}">
						<img src="/upload/${vo.file3}" width="300"/>
					</c:if>
					<c:if test="${vo.file4!=null && vo.file4 !=''}">
						<img src="/upload/${vo.file4}" width="300"/>
					</c:if>
					<c:if test="${vo.file5!=null && vo.file5 !=''}">
						<img src="/upload/${vo.file5}" width="300"/>
					</c:if>
					
					
                    ${vo.content}
                </li>
            </ul>
    </div>
    <div class="reply">
        <hr/>
            <li style="font-size: 1.5em;"><b>상품문의</b></li>
        <hr/>
        <!--댓글수정필요-->
        <form id="replyFrm">
            <input type="hidden" name="board_num" value="${vo.board_num}"/>
            <textarea name="coment" id='coment' style="width:500px; height:50px" placeholder=" 상품문의 입력"></textarea>
            <input type="submit" value="등록""/>
        </form>
        <div>
            <c:if test="${logId==vo.user_id}">
                <a href="board/old/oldBoardEdit?board_num=${vo.board_num}">수정</a>
                <a href="javascript:delCheck()">삭제</a>
            </c:if>
        </div>
        <hr/>
        <div id="replyListAll">
            
        </div>
    </div>
    
<!-- 신고 모달 -->
	<div id="reportModal" class="modal"><!-- modal -->
		<div class="modal-dialog">
			<div class="modal-content">
					<div class="modal-header">
							<h2>게시물 신고</h2>
							<button class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<c:if test="${logStatus=='Y'}">
							<form method="post" id="reportForm">
							<input type="hidden" name="board_num" value="${vo.board_num}"/>
								<ul>
									<li>신고 이유 &emsp; 
										<select name="category_num">
											<option value="1">광고</option>
											<option value="2">사기거래</option>
											<option value="3">욕설/비방</option>
											<option value="4">사칭</option>
										</select>
									</li>
									<hr/>
									<li>신고 내용<br/>
										<textarea name="report_content" rows="5" cols="30"></textarea>
									</li>
									<hr/>
									<li><input type='submit' value='신고 접수'/></li>
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

</body>
