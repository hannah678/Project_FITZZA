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
			var params = "no=${vo.board_num}";    // 게시글 넘버
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
            let url2 = '/myapp/reply/editOk';
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
<link rel="stylesheet" href="../css/oldview.css" type="text/css">
<body>
    <hr/>
    <div class="oldlist">
        <form action="">
            <ul>
                <img src="../img/옷1.jpg"/><!--prod_image-->
                <br/>
                <li>남성 (M) 나이키 스포츠 바람막이<!--prod_name--></li>
                <br/>
                <li>9,500원<!--price--></li>
            </ul>
            <br/>
            <hr/>
            <ul>
                <li>조회수 &nbsp; 123123<!--hit--> &emsp; &emsp; 개시일 &nbsp; 04-05<!--enter_date--></li>
                <li><input type="submit" value="연락하기" id="call"/> &emsp; &emsp; <input type="submit" value="신고하기" id="report"/></li>
            </ul>
            <hr/>
            <ul class="info">
                <li id="item"><b>상품 정보</b><hr/>
                    남성 (M) <br/>
                    나이키 스포츠 바람막이 뉴리턴 빈티지<br/>
                    <br/>
                    실측 사이즈<br/>
                    ㅡ<br/>
                    어깨 : 36cm<br/>
                    가슴 : 47cm<br/>
                    팔길이 : 66cm<br/>
                    총기장 : 65cm<br/>
                    <br/>
                    <br/>
                    ★ 단면을 기준으로 측정한 치수이며 재는 방식에 따라 1-5cm 오차가 발생할 수 있습니다.<br/>
                    <br/>
                    뉴리턴 빈티지 = 구제 덤핑의류 최저가 !<br/>
                    <br/>
                    빈티지 의류 특성상 한번 품절된 상품은 다시 구하기가 어렵습니다.<br/>
                    소중한 옷들과의 인연을 놓치지 마세요 !!!<br/>
                    <br/>
                    뉴리턴빈티지의 모든 제품중 대부분 중고품이며, 재고가 1개뿐인 단일 제품입니다. <br/>
                    <br/>
                    그러다보니 제품에 어느 정도의 사용감이 있을 수 있으며, 제품의 실제색상,미세한 오염은<br/>
                    모니터 해상도에 따라 약간의 차이가 있을수 있으니<br/>
                    반드시 제품 구매 전 해당 상품사진을 자세히 살펴주세요 !<br/>
                    <br/>
                    마음에 드는 옷을 놓쳤다고요? <br/>
                    <br/>
                    뉴리턴빈티지는 매일 상품이 업로드되니 팔로우하셔서 남들보다 먼저 득템하기!<br/>
                    (재고는 딱 1개! 고민하면 품절입니다.)<br/>
                    <br/>
                    안내사항<br/>
                    <br/>
                    :) 택배 요청시 3,000원 추가 해주시면 됩니다.<br/>
                    (제주 및 도서 산간 지역은 6,000원 추가입니다.)<br/>
                    <br/>
                    중고 상품 특성상 동일한 상품으로 교환이나약간의 이염등에 의한 교환/환불은 불가능한점. 이해 부탁드리겠습니다.<br/>
                    <br/>
                    3만원 이상 구매시 무료 배송이오니 상점 내 제품들 많이 구경해주세요!<br/><!--explanation--></li>
                <li id="seller"><b>판매자 정보</b><hr/>
                    <img src="../img/준영이.png"/> 도발이<!--user_nickname--><br/> 거래 가능 지역 : 서울<!--city--><br/> 신고 받은 횟수 : 1<!--report_hit--> </li>
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
                <input type="hidden" name="no" value="${vo.no}"/>
                <textarea name="coment" id='coment' style="width:500px; height:50px" placeholder=" 상품문의 입력"></textarea>
                <input type="submit" value="등록""/>
            </form>
        </c:if>
        <div>
            <c:if test="${logId==vo.userid}">
                <a href="/myapp/board/afree/boardEdit?no=${vo.no}">수정</a>
                <a href="javascript:delCheck()">삭제</a>
            </c:if>
        </div>
        <hr/>
        <div id="replyList">
            
        </div>
    </div>
</body>
