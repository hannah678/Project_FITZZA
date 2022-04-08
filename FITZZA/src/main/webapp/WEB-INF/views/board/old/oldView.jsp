<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
    <meta charset="UTF-8">
    <title>FITZZA | 중고거래</title>
</head>
<script>
	function delCheck(){
		if(confirm("삭제하시겠습니까?")){
			location.href = "";     // 게시글 삭제 매핑
		}
	}
    // 댓글------------------------------------------------------------
	$(function(){
		function replyListAll(){
			var url = "";   // 댓글 리스트
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
					url:'',     // 댓글writeOk로 매핑
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
		$(document).on('click','#replyList input[value=Edit]',function(){
			$(this).parent().css("display","none");
			$(this).parent().next().css("display","block");
		});
        $(document).on('submit','#replyList form',function(){
            event.preventDefault();
            let params2 = $(this).serialize();
            let url2 = '/reply/editOk';
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
					url:'/myapp/reply/del',
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
<link rel="stylesheet" href="/css/oldview.css" type="text/css">
<body>
    <hr/>
    <div class="oldlist">
        <form action=""><!-- 신고하기 -->
            <ul>
                <img src="/upload/${vo.file1}"/>
                <br/>
                <li>${vo.title}</li>
                <br/>
                <li>(${vo.gender}) ${vo.old_name}</li>
                <br/>
                <li>${vo.old_price} 원</li>
            </ul>
            <br/>
            <hr/>
            <ul>
                <li>조회수 &nbsp; ${vo.hit}<!--hit--> &emsp; &emsp; 게시일 &nbsp; ${vo.write_date} <!--enter_date--></li>
                <!--<li> <input type="submit" value="연락하기" id="call"/>  &emsp; &emsp; <input type="submit" value="신고하기" id="report"/></li>-->
            	<hr/>
            	<li id="seller"><b>판매자 정보</b><hr/>
                    <img src="/img/codi_book_img12.png"/> ${vo.user_nickname}<!--user_nickname--><br/> 거래 가능 지역 : ${vo.city}<!--city--><br/> 신고 받은 횟수 : ${vo.report_hit}<!--report_hit--> </li>
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
        </form>
    </div>
    <div class="reply">
        <hr/>
            <li style="font-size: 1.5em;"><b>상품문의</b></li>
        <hr/>
        <!--댓글수정필요-->
        <c:if test="">
            <form id="">
                <input type="hidden" name="board_num" value="${vo.board_num}"/>
                <textarea name="coment" id='coment' style="width:500px; height:50px" placeholder=" 상품문의 입력"></textarea>
                <input type="submit" value="등록""/>
            </form>
        </c:if>
        <div>
            <c:if test="${logId==vo.user_id}">
                <a href="board/old/oldBoardEdit?board_num=${vo.board_num}">수정</a>
                <a href="javascript:delCheck()">삭제</a>
            </c:if>
        </div>
        <hr/>
        <div id="replyList">
            
        </div>
    </div>
</body>
