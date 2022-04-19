<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/recView.css" type="text/css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<style>
	a:link {color:#54bab9; text-decoration: none;}
	a:visited {color:#54bab9}
	#logStatus4 > img {vertical-align:top;}
	#logStatus3 > a > img {margin-top:-15px}
}
</style>
<script>
    function delCheck(){
		if(confirm("삭제하시겠습니까?")){
			location.href = "/board/boardDelete?board_num="+${vo.board_num};     // 게시글 삭제 매핑
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
					console.log(result);
					console.log(${vo.board_num});
					var tag = "<ul>";
					$result.each(function(idx, vo){		//vo에서 프로필사진 가져올 자리
						tag += "<li><div>" + "<img src='/upload/"+vo.profile_image+"' id='reply_profile'/><img src='"+vo.frame_img+"' id='reply_level_frame'/>" + vo.user_nickname + " (" + vo.reply_date + ") ";
						
						if(vo.user_id == '${logId}'){   // user_id
							tag += "<input type='button' value='수정' id='reply_edit'/>";
							tag += "<input type='button' value='삭제' title='"+vo.reply_num+"' id='reply_del'/>";
						}
						tag += "<br/><span>" + vo.coment + "</span></div>";
						
						if(vo.user_id == '${logId}'){   // user_id
							tag += "<div style='display:none'><form method='post'>";
							tag += "<input type='hidden' name='reply_num' value='"+vo.reply_num+"'/>";
							tag += "<textarea name='coment' style='width:400px; height:50px;'>"+vo.coment+"</textarea>";
							tag += "<input type='submit' value='수정' id='replybtn2'/></form></div>";
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
		$(document).on('click','#replyList input[value="수정"]',function(){
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
<body>
    <br><br><br><br><br><br><br>
    <div class="rec">
        <div class="reclist">
            <ul class="rec_top">
            	<li><a href="/board/recommend/recommendList">목록으로</a></li>
            	<li>
                	<img src="/upload/${vo.profile_image}" id="profile"/>
                	<img id="level_frame" alt="등급 프레임 이미지">
                </li>
                <li id="info">
                	<span>${vo.user_nickname}</span>&ensp;${vo.write_date} | ${vo.hit}
                </li>
                <li id="title">${vo.title}</li>
                <hr/>
                <c:if test="${logId != vo.user_id}">
					<li><input type="button" value="신고" id="rec_report"
						data-target="#reportModal" data-toggle="modal" /></li>
				</c:if>
				<c:if test="${logId == vo.user_id}">
					<li class="edit_delete">
						<a class="edit" href="/board/recommend/recommendEdit?board_num=${vo.board_num}" style="width:60px; height:30px; border:2px solid #54bab9; border-radius:15px; font-size:18px; display:inline-block; line-height:25px; text-align:center;">수정</a> 
						<a id="del" href="javascript:delCheck()" style="width:60px; height:30px; border:2px solid #54bab9; border-radius:15px; font-size:18px; display:inline-block; line-height:25px; text-align:center; margin-left:20px">삭제</a>
					</li>
					<br/>
				</c:if>
            </ul>
            <ul class="rec_content">
                <li id="content">${vo.content}</li>
                <li><img src="/upload/${vo.file1}"/></li>
                <c:if test="${vo.file2!=null && vo.file2 !=''}">
					<li><img src="/upload/${vo.file2}"/></li>
				</c:if>
				<c:if test="${vo.file3!=null && vo.file3 !=''}">
					<li><img src="/upload/${vo.file3}"/></li>
				</c:if>
				<c:if test="${vo.file4!=null && vo.file4 !=''}">
					<li><img src="/upload/${vo.file4}"/></li>
				</c:if>
				<c:if test="${vo.file5!=null && vo.file5 !=''}">
					<li><img src="/upload/${vo.file5}"/></li>
				</c:if>
            </ul>
        </div>
        <div class="reply">
        	<br/>
			<li style="font-size: 24px;"><b>댓글</b></li>
			<hr />
			<!--댓글수정필요-->
			<form id="replyFrm">
				<input type="hidden" name="board_num" value="${vo.board_num}" />
				<c:if test="${logStatus=='Y'}">
					<textarea name="coment" id='coment'
						style="width: 1000px; height: 98px; margin:10px 0 -35px 35px; font-size:18px" placeholder=" 댓글 입력"></textarea>
					<input type="submit" value="등록" id="replybtn" />
					<hr />
				</c:if>
			</form>
			<div></div>
			<div id="replyList"></div>
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
									<li>신고 이유 &emsp; <select name="category_num" style="border:1px solid black;">
											<option value="1">광고</option>
											<option value="2">사기거래</option>
											<option value="3">욕설/비방</option>
											<option value="4">사칭</option>
									</select>
									</li>
									<hr />
									<li>신고 내용<br /> <textarea name="report_content" rows="5"
											cols="30" id="report_content"></textarea> <input type='submit' value='신고 접수'
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
    </div>
    </body>