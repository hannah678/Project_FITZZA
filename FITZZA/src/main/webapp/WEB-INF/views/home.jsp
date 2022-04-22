<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	h2 a {line-height:50px;}
	a:link {color:#fff; text-decoration: none;}
	a:visited {color:#fff}
	#vote_frame {margin-top:-50px}
	#logStatus4 > img {vertical-align:top;}
	#logStatus5 > img {vertical-align:top;}
	#logStatus3 > a > img {margin-top:-15px}
</style>
<div id="container">
	<script>
		/*스크롤 무빙*/

		var html = $('html');
		var page = 1;
		html.animate({scrollTop:0}, 10);
		$(window).on("wheel", function(e) {
		    if(html.is(":animated")) return;
		    if(e.originalEvent.deltaY > 0) {
		        if(page == 8) return;
		        page++;
		    } else if(e.originalEvent.deltaY < 0) {
		        if(page == 1) return;
		        page--;
		    }
		    // var posTop =(page-1) * $(window).height();
		    var posTop =(page-1) * 1080;
		    html.animate({scrollTop : posTop});
		});
	</script>
        <article id="adver_video" class="article">
            <video type="video/mp4" autoplay muted controls loop>
                <source src="img/adver_video.mp4">
            </video>
            <div id="scrolldown">
                <p>scrolldown</p>
                <img src="img/scrolldown.png" alt="scrolldown"/>
            </div>
        </article>
        <article id="todaysCodi" class="article">
	        <div class="wrap">
	            <h1>패션 피플들의 데일리룩</h1>
	            <h2><a href="/board/todayCodi/todayCodiList">오늘의 코디</a></h2>
	            <div id="lookTop3">
	                <p>TOP 3</p>
	                <ul>
	                    <li style="background-image: url(/upload/todayCodi/${codifile1st});background-size:cover">
	                        <span>1st</span>
	                        <img src="img/crown_gold.png">
	                        <p class="codi_hover"><a href="/board/todayCodi/todayCodiList">바로가기</a></p>
	                    </li>
	                    <li style="background-image: url(/upload/todayCodi/${codifile2nd});background-size:cover">
	                        <span>2nd</span>
	                        <img src="img/crown_silver.png">
	                        <p class="codi_hover"><a href="/board/todayCodi/todayCodiList">바로가기</a></p>
	                    </li>
	                    <li style="background-image: url(/upload/todayCodi/${codifile3rd});background-size:cover">
	                        <span>3rd</span>
	                        <img src="img/crown_bronze.png">
	                        <p class="codi_hover"><a href="/board/todayCodi/todayCodiList">바로가기</a></p>
	                    </li>
	                </ul>
	            </div>
	            <!-- count particles -->
            <div class="count-particles">
                <span class="js-count-particles"></span>
            </div>
            <!-- particles.js container -->
            <div id="particles-js"></div>
            
            <!-- scripts -->
            <script src="/js/particles.js"></script>
            <script src="/js/app.js"></script>
            
	        </div>
        </article>
        <article id="style_reco" class="article">
	        <div class="wrap">
	        	<h1>다양한 패션을 나누고 싶다면</h1>
	        	<h2><a href="/board/recommend/recommendList">스타일 추천</a></h2>
	        	<ul id="text_effect">
	        		<li class="text">click the people !</li>
	        		<li class="text_before">click the people !</li>
	        		<li class="text_after">click the people !</li>
	        	</ul>
	        	<div id="people">
	        		<img src="img/style_reco_person1.png" id="person1" class="person" alt="사람1">
	        		<img src="img/style_reco_person2.png" id="person2" class="person" alt="사람2">
	        		<img src="img/style_reco_person3.png" id="person3" class="person" alt="사람3">
	        		<img src="img/style_reco_person4.png" id="person4" class="person" alt="사람4">
	        		<img src="img/style_reco_person5.png" id="person5" class="person" alt="사람5">
	        	</div>
	        	<img src="img/style_reco_bg2.png" alt="배경사진" class="style_bg2">
	        	<img src="img/style_reco_bg3.png" alt="배경사진" class="style_bg3">
        	</div>
        </article>
        <article id="trade" class="article">
	        <div class="wrap">
	        	<h1>패션피플들의 스타일리쉬한 아이템 !</h1>
	        	<h2><a href="/board/old/oldList">중고거래</a></h2>
	        	<ul>
	        		<li><img src="img/trade_item1.png" alt="패션아이템1"></li>
	        		<li><img src="img/trade_item2.png" alt="패션아이템2"></li>
	        		<li><img src="img/trade_item3.png" alt="패션아이템3"></li>
	        		<li><img src="img/trade_item4.png" alt="패션아이템4"></li>
	        		<li><img src="img/trade_item5.png" alt="패션아이템5"></li>
	        		<li><img src="img/trade_item6.png" alt="패션아이템6 "></li>
	        		<li><img src="img/trade_item7.png" alt="패션아이템7"></li>
	        		<li><img src="img/trade_item8.png" alt="패션아이템8"></li>
	        	</ul>
	        </div>
        </article>
        <article id="review" class="article">
        	<div class="wrap">
        		<h1>구매한 물건을 소개하고,<br/>고마운 마음을 전하고 싶을 땐</h1>
	        	<h2><a href="/board/review/reviewList">구매후기</a></h2>
	        	<div class="bg">
	        		<img src="img/review_bg.png" alt="배경이미지">
	        		<img src="img/review_frame.png" alt="프레임이미지">
	        	</div>
	        	<div id="large-header" class="hero is-slanted is-relative is-gradient is-fullheight is-halfed-mobile"></div>
    			<canvas id="demo-canvas"></canvas>
        	</div>
        </article>
        <article id="QnA" class="article">
        	<div class="wrap">
        		<h1>패션 관련 그 어떤 질문이라도 궁금하면 뭐든지</h1>
	        	<h2><a href="/board/qna/qnaList">QnA</a></h2>
	        	<div class="wrapper">
					<p data-heading="다 물어봐">다 물어봐</p>
				</div>
	        	<div class='box'>
					<div class='wave -one'></div>
					<div class='wave -two'></div>
					<div class='wave -three'></div>
				</div>
        	</div>
        </article>
        <article id="vote" class="article">
        	<div class="wrap">
        		<h1>어떤 코디가 더 어울릴까 고민되면 물어봐 !</h1>
	        	<h2><a href="/board/vote/voteList">오늘뭐입지?</a></h2>
        	</div>
        	<ul id="vote_frame">
        		<li id="frame1">
        			<img src="img/vote_frame1.png" alt="사진 프레임">
        			<ul class="slides">
        				<li><img src="img/vote_frame_img1.png" alt="여자 첫번째 코디"></li>
        				<li><img src="img/vote_frame_img2.png" alt="여자 두번째 코디"></li>
        			</ul>
        			<div class="controller">
	        			<span class="prev">&lang;</span>
	        			<span class="next">&rang;</span>
	        			<img src="img/heart_empty.png" class="heart_empty" alt="빈하트">
        			</div>
        		</li>
        		<li id="frame2">
        			<img src="img/vote_frame2.png" alt="사진 프레임">
        			<ul class="slides">
        				<li><img src="img/vote_frame_img3.png" alt="남자 첫번째 코디"></li>
        				<li><img src="img/vote_frame_img4.png" alt="남자 두번째 코디"></li>
        			</ul>
        			<div class="controller">
	        			<span class="prev">&lang;</span>
	        			<span class="next">&rang;</span>
	        			<img src="img/heart_empty.png" class="heart_empty" alt="빈하트">
        			</div>
        		</li>
        	</ul>
        </article>
        <article id="codi_book" class="article">
        	<div class="wrap">
        		<h1>더 많은 코디 알아보러 가기</h1>
	        	<h2><a href="">옷입히기</a></h2>
        		<div  onmousedown='startDrag(event, this)'></div>
        		<p id="codi_img">
	        		<img src="img/codi_book_img1.png" class="drag" alt="원피스1" style="position:absolute; left:50px; top:50px;" onmousedown='startDrag(event, this)'>
		        	<img src="img/codi_book_img2.png" class="drag" alt="원피스2" style="position:absolute; left:50px; top:150px;" onmousedown='startDrag(event, this)'>
		        	<img src="img/codi_book_img3.png" class="drag" alt="블라우스1" style="position:absolute; left:120px; top:300px;" onmousedown='startDrag(event, this)'>
		        	<img src="img/codi_book_img4.png" class="drag" alt="블라우스2" style="position:absolute; left:220px; top:250px;" onmousedown='startDrag(event, this)'>
		        	<img src="img/codi_book_img5.png" class="drag" alt="치마" style="position:absolute; left:320px; top:250px;" onmousedown='startDrag(event, this)'>
		        	<img src="img/codi_book_img6.png" class="drag" alt="청바지" style="position:absolute; left:420px; top:250px;" onmousedown='startDrag(event, this)'>
		        	<img src="img/codi_book_img7.png" class="drag" alt="가죽자켓" style="position:absolute; left:170px; top:50px;" onmousedown='startDrag(event, this)'>
		        	<img src="img/codi_book_img8.png" class="drag" alt="청자켓" style="position:absolute; left:300px; top:50px;" onmousedown='startDrag(event, this)'>
		        	<img src="img/codi_book_img9.png" class="drag" alt="가디건" style="position:absolute; left:400px; top:50px;" onmousedown='startDrag(event, this)'>
		        	<img src="img/codi_book_img10.png" class="drag" alt="구두1" style="position:absolute; left:50px; top:530px;" onmousedown='startDrag(event, this)'>
		        	<img src="img/codi_book_img11.png" class="drag" alt="스니커즈1" style="position:absolute; left:180px; top:550px;" onmousedown='startDrag(event, this)'>
		        	<img src="img/codi_book_img12.png" class="drag" alt="스니커즈2" style="position:absolute; left:330px; top:500px;" onmousedown='startDrag(event, this)'>
		        	<img src="img/codi_book_img13.png" class="drag" alt="구두2" style="position:absolute; left:450px; top:530px;" onmousedown='startDrag(event, this)'>
		        	<img src="img/codi_face_w.png" class="drag" alt="얼굴" style="position:absolute; left:800px; top:30px;" onmousedown='startDrag(event, this)'>
		        			        	
		        	<img src="img/codi_book_imgM1.png" class="drag" alt="청남방" style="position:absolute; left:1340px; top:50px;" onmousedown='startDrag(event, this)'>
		        	<img src="img/codi_book_imgM2.png" class="drag" alt="흰티" style="position:absolute; left:1420px; top:50px;" onmousedown='startDrag(event, this)'>
		        	<img src="img/codi_book_imgM3.png" class="drag" alt="검은티" style="position:absolute; left:1340px; top:270px;" onmousedown='startDrag(event, this)'>
		        	<img src="img/codi_book_imgM4.png" class="drag" alt="흰셔츠" style="position:absolute; left:1390px; top:270px;" onmousedown='startDrag(event, this)'>
		        	<img src="img/codi_book_imgM5.png" class="drag" alt="슬랙스" style="position:absolute; left:1470px; top:270px;" onmousedown='startDrag(event, this)'>
		        	<img src="img/codi_book_imgM6.png" class="drag" alt="베이지바지" style="position:absolute; left:1540px; top:270px;" onmousedown='startDrag(event, this)'>
		        	<img src="img/codi_book_imgM7.png" class="drag" alt="청바지" style="position:absolute; left:1640px; top:270px;" onmousedown='startDrag(event, this)'>
		        	<img src="img/codi_book_imgM8.png" class="drag" alt="차콜바지" style="position:absolute; left:1720px; top:270px;" onmousedown='startDrag(event, this)'>
		        	<img src="img/codi_book_imgM9.png" class="drag" alt="베이지아우터" style="position:absolute; left:1470px; top:50px;" onmousedown='startDrag(event, this)'>
		        	<img src="img/codi_book_imgM10.png" class="drag" alt="블레이져" style="position:absolute; left:1570px; top:50px;" onmousedown='startDrag(event, this)'>
		        	<img src="img/codi_book_imgM11.png" class="drag" alt="가죽자켓" style="position:absolute; left:1650px; top:50px;" onmousedown='startDrag(event, this)'>
		        	<img src="img/codi_book_imgM12.png" class="drag" alt="스니커즈" style="position:absolute; left:1340px; top:530px;" onmousedown='startDrag(event, this)'>
		        	<img src="img/codi_book_imgM13.png" class="drag" alt="구두1" style="position:absolute; left:1510px; top:530px;" onmousedown='startDrag(event, this)'>
		        	<img src="img/codi_book_imgM14.png" class="drag" alt="구두2" style="position:absolute; left:1660px; top:500px;" onmousedown='startDrag(event, this)'>
		        	<img src="img/codi_face_m.png" class="drag" alt="얼굴" style="position:absolute; left:1030px; top:30px;" onmousedown='startDrag(event, this)'>
        		</p>
        	</div>
        </article>
    </div>