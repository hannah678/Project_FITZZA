<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/qnaView.css" type="text/css">
<script>
    function delCheck(){
        if(confirm("삭제하시겠습니까?")){
            location.href = "";     // 게시글 삭제
        }
    }
    // 댓글------------------------------------------------------------
	$(function(){
		function replyListAll(){
			var url = "";   // 댓글 리스트
			var params = "no=${vo.board_num}";    // 게시글 넘버
			$.ajax({
				url:url,
				data:params,
				success:function(result){
					var $result = $(result);
					
					var tag = "<ul>";
					$result.each(function(idx, vo){
                        tag += "<li><div>" + "<img src='../img/준영이.jpg' style='width:50px; height:50px; border:1px solid black; border-radius:70%; margin-right:30px; position:relative; top:40px;'/>" + "<b>" + vo.user_id + "</b>" + " (" + vo.reply_date + ") ";
	
						if(vo.user_id == '${logId}'){
							tag += "<input type='button' value='수정'/>";
							tag += "<input type='button' value='삭제' title='"+vo.reply_num+"'/>";
						}
						tag += "<br/><br/>" + "&emsp;&emsp;&emsp;&emsp;&emsp;" + vo.coment + "</div>";
						
						if(vo.user_id == '${logId}'){   
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
					url:'',     // 댓글 writeOk로 매핑
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
        // 댓글 수정(Edit) 버튼 선택시 해당 폼 보여주기--------------------------------------------
		$(document).on('click','#replyList input[value=수정]',function(){
			$(this).parent().css("display","none");
			$(this).parent().next().css("display","block");
		});
        // 댓글 수정(DB)---------------------------------------------------------------------
        $(document).on('submit','#replyList form',function(){
            event.preventDefault();
            let params2 = $(this).serialize();
            let url2 = '';      // 댓글 editOk로 매핑
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
        // 댓글삭제---------------------------------------------------------------------
		$(document).on('click','#replyList input[value=삭제]',function(){
			if(confirm('댓글을 삭제하시겠습니까?')){
				var params = "replyno=" + $(this).attr("title");
				$.ajax({
					url:'',     // 댓글 del로 매핑
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
		replyListAll();
	});
</script>
<body>
    <br><br><br><br><br>
    <div class="qna">
        <div class="qnalist">
            <ul>
                <img src="/img/준영이.png" id="profile"/>
                <br/>
                <li id="title">트러커 어디껀지 알고싶어요ㅜㅜ</li>
                <li id="info">&emsp;&emsp;&emsp;&emsp;&emsp;<span style="color: black">도발이</span>&ensp;2022.04-05 18:11 | 21&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<span style="color:red;"><a href="">신고</a></span></li>
                <hr/>
            </ul>
            <ul>
                <li id="content">이 트러커 정보 아시는분 계신가요~?</li>
                <li><img src="/img/옷5.jpg"/></li>
            </ul>
            <!--
            <ul>
                <img src="../img/준영이.png" id="profile"/>
                <br/>
                <li id="title">트러커 어디껀지 알고싶어요ㅜㅜ</li>
                <li id="info">&emsp;&emsp;&emsp;&emsp;&emsp;<span style="color: black">도발이</span>&ensp;2022.04-05 18:11 | 21&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<span style="color:red;"><a href="">신고</a></span></li>
                <hr/>
            </ul>
            <ul>
                <li id="content">이 트러커 정보 아시는분 계신가요~?</li>
                <li><img src="../img/옷5.jpg"/></li>
            </ul>
            <div>
                <c:if test="${logId==vo.user_id}">
                    <a href="">수정</a>
                    <a href="">삭제</a>
                </c:if>
            </div>
            -->
        </div>
        <div class="reply">
            <br/>
            <li style="font-size: 1.5em;"><b>댓글</b></li>
            <!--댓글수정필요-->
            <br/>
            <c:if test="">
                <form id="replyFrm">
                    <input type="hidden" name="board_num" value="${vo.board_num}"/>
                    <textarea name="coment" id='coment' placeholder=" 댓글을 남겨주세요"></textarea>
                    <input type="submit" id="replybtn" value="등록"/>
                </form>
            </c:if>
            <div id="replyList">
                
            </div>
        </div>
    </div>
    </body>