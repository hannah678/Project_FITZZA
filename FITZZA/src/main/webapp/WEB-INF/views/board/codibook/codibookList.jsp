<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/codibook.css" type="text/css">
<script>
$(document).ready(function(){
	
	$('.cb_drag').on('click',function(){
		var img = document.createElement("img");
		img.src = $(this).attr('src');
		img.classList.add('droped_img');
		img.setAttribute('onmousedown','startDrag(event, this)');
	
		$('#dropzone').append(img);
		$(img).css({
			"position" : "absolute",
				"left" : "0px",
				"top" : "0px"
		});
	});

});

</script>
<div class="cb_container">
	<div id="dropzone_wrap">
		<button onclick="new_page()">새로하기</button>
		<button id="codi_del">삭제</button>
		<div id="dropzone"></div>
	</div>
	<div id="cb_img_wrap">
		<ul>
			<li id="man_dress">
				<input type="radio" name="gender" id="cb_man">
				<label for="cb_man">남성</label>
				<div id="cb_man_box">
					<div>		
						<input type="radio" name="m_codi" id="m_T" checked>
						<label for="m_T">반팔</label>
						<ul>
							<li><img src="/img/dress/남성/반팔/반팔1.png" class="cb_drag"></li>
							<li><img src="/img/dress/남성/반팔/반팔2.png" class="cb_drag"></li>
							<li><img src="/img/dress/남성/반팔/반팔3.png" class="cb_drag"></li>
							<li><img src="/img/dress/남성/반팔/반팔4.png" class="cb_drag"></li>
							<li><img src="/img/dress/남성/반팔/반팔5.png" class="cb_drag"></li>
							<li><img src="/img/dress/남성/반팔/반팔6.png" class="cb_drag"></li>
							<li><img src="/img/dress/남성/반팔/반팔7.png" class="cb_drag"></li>
						</ul>
					</div>
					<div>		
						<input type="radio" name="m_codi" id="m_S">
						<label for="m_S">셔츠</label>
						<ul>
							<li><img src="/img/dress/남성/셔츠/셔츠1.webp" class="cb_drag"></li>
							<li><img src="/img/dress/남성/셔츠/셔츠2.png" class="cb_drag"></li>
							<li><img src="/img/dress/남성/셔츠/셔츠3.png" class="cb_drag"></li>
							<li><img src="/img/dress/남성/셔츠/셔츠4.png" class="cb_drag"></li>
							<li><img src="/img/dress/남성/셔츠/셔츠5.png" class="cb_drag"></li>
							<li><img src="/img/dress/남성/셔츠/셔츠6.png" class="cb_drag"></li>
							<li><img src="/img/dress/남성/셔츠/셔츠7.png" class="cb_drag"></li>
							<li><img src="/img/dress/남성/셔츠/셔츠8.png" class="cb_drag"></li>
							<li><img src="/img/dress/남성/셔츠/셔츠9.png" class="cb_drag"></li>
						</ul>
					</div>
					<div>		
						<input type="radio" name="m_codi" id="m_P">
						<label for="m_P">바지</label>
						<ul>
							<li><img src="/img/dress/남성/바지/바지1.png" class="cb_drag"></li>
							<li><img src="/img/dress/남성/바지/바지2.png" class="cb_drag"></li>
							<li><img src="/img/dress/남성/바지/바지3.png" class="cb_drag"></li>
							<li><img src="/img/dress/남성/바지/바지4.png" class="cb_drag"></li>
							<li><img src="/img/dress/남성/바지/바지5.png" class="cb_drag"></li>
							<li><img src="/img/dress/남성/바지/바지6.png" class="cb_drag"></li>
							<li><img src="/img/dress/남성/바지/바지7.png" class="cb_drag"></li>
							<li><img src="/img/dress/남성/바지/바지8.png" class="cb_drag"></li>
							<li><img src="/img/dress/남성/바지/바지9.png" class="cb_drag"></li>
							<li><img src="/img/dress/남성/바지/바지10.png" class="cb_drag"></li>
						</ul>
					</div>
					<div>		
						<input type="radio" name="m_codi" id="m_shoes">
						<label for="m_shoes">신발</label>
						<ul>
							<li><img src="/img/dress/신발/신발1.webp" class="cb_drag"></li>
							<li><img src="/img/dress/신발/신발2.webp" class="cb_drag"></li>
							<li><img src="/img/dress/신발/신발3.webp" class="cb_drag"></li>
							<li><img src="/img/dress/신발/신발4.webp" class="cb_drag"></li>
							<li><img src="/img/dress/신발/신발5.webp" class="cb_drag"></li>
							<li><img src="/img/dress/신발/신발6.png" class="cb_drag"></li>
							<li><img src="/img/dress/신발/신발7.webp" class="cb_drag"></li>
							<li><img src="/img/dress/신발/신발8.webp" class="cb_drag"></li>
							<li><img src="/img/dress/신발/신발9.webp" class="cb_drag"></li>
							<li><img src="/img/dress/신발/신발10.webp" class="cb_drag"></li>
							<li><img src="/img/dress/신발/신발11.webp" class="cb_drag"></li>
							<li><img src="/img/dress/신발/신발12.webp" class="cb_drag"></li>
							<li><img src="/img/dress/신발/신발13.webp" class="cb_drag"></li>
							<li><img src="/img/dress/신발/신발14.webp" class="cb_drag"></li>
							<li><img src="/img/dress/신발/신발15.webp" class="cb_drag"></li>
							<li><img src="/img/dress/신발/신발16.webp" class="cb_drag"></li>
							<li><img src="/img/dress/신발/신발17.webp" class="cb_drag"></li>
							<li><img src="/img/dress/신발/신발18.webp" class="cb_drag"></li>
							<li><img src="/img/dress/신발/신발19.webp" class="cb_drag"></li>
							<li><img src="/img/dress/신발/신발20.webp" class="cb_drag"></li>
							<li><img src="/img/dress/신발/신발21.png" class="cb_drag"></li>
							<li><img src="/img/dress/신발/신발22.png" class="cb_drag"></li>
							<li><img src="/img/dress/신발/신발23.png" class="cb_drag"></li>
							<li><img src="/img/dress/신발/신발24.webp" class="cb_drag"></li>
						</ul>
					</div>	
					<div>
						<input type="radio" name="m_codi" id="m_insert_img">
						<label for="m_insert_img">이미지추가</label>
						<ul>
							<li><button>이미지 추가</button></li>
						</ul>
					</div>
				</div>	
			</li>
			<li id="woman_dress">
				<input type="radio" name="gender" id="cb_woman">
				<label for="cb_woman">여성</label>
				<div id="cb_woman_box">
					<div>		
						<input type="radio" name="w_codi" id="w_sw" checked>
						<label for="w_sw">니트/가디건</label>
						<ul>
							<li><img src="/img/dress/여성/가디건/1.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/가디건/2.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/가디건/3.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/가디건/4.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/가디건/5.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/가디건/6.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/가디건/7.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/가디건/8.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/가디건/9.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/가디건/10.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/가디건/11.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/가디건/12.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/가디건/13.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/가디건/14.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/가디건/15.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/가디건/16.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/가디건/17.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/가디건/18.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/가디건/19.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/가디건/20.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/가디건/21.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/가디건/22.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/가디건/23.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/가디건/24.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/가디건/25.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/가디건/26.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/가디건/27.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/가디건/28.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/가디건/29.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/가디건/30.webp" class="cb_drag"></li>
						</ul>
					</div>
					<div>		
						<input type="radio" name="w_codi" id="w_P">
						<label for="w_P">바지</label>
						<ul>
							<li><img src="/img/dress/여성/바지/1.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/바지/2.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/바지/3.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/바지/4.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/바지/5.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/바지/6.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/바지/7.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/바지/8.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/바지/9.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/바지/10.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/바지/11.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/바지/12.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/바지/13.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/바지/14.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/바지/15.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/바지/16.webp" class="cb_drag"></li>
						</ul>
					</div>
					<div>		
						<input type="radio" name="w_codi" id="w_sP">
						<label for="w_sP">반바지</label>
						<ul>
							<li><img src="/img/dress/여성/반바지/1.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/반바지/2.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/반바지/3.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/반바지/4.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/반바지/5.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/반바지/6.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/반바지/7.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/반바지/8.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/반바지/9.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/반바지/10.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/반바지/11.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/반바지/12.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/반바지/13.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/반바지/14.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/반바지/15.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/반바지/16.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/반바지/17.webp" class="cb_drag"></li>
						</ul>
					</div>
					<div>		
						<input type="radio" name="w_codi" id="w_sk">
						<label for="w_sk">스커트</label>
						<ul>
							<li><img src="/img/dress/여성/스커트/1.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/스커트/2.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/스커트/3.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/스커트/4.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/스커트/5.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/스커트/6.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/스커트/7.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/스커트/8.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/스커트/9.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/스커트/10.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/스커트/11.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/스커트/12.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/스커트/13.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/스커트/14.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/스커트/15.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/스커트/16.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/스커트/17.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/스커트/18.webp" class="cb_drag"></li>
						</ul>
					</div>
					<div>		
						<input type="radio" name="w_codi" id="w_j">
						<label for="w_j">자켓</label>
						<ul>
							<li><img src="/img/dress/여성/자켓/1.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/자켓/2.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/자켓/3.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/자켓/4.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/자켓/5.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/자켓/6.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/자켓/7.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/자켓/8.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/자켓/9.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/자켓/10.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/자켓/11.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/자켓/12.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/자켓/13.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/자켓/14.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/자켓/15.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/자켓/16.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/자켓/17.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/자켓/18.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/자켓/19.webp" class="cb_drag"></li>
						</ul>
					</div>
					<div>		
						<input type="radio" name="w_codi" id="w_c">
						<label for="w_c">코트</label>
						<ul>
							<li><img src="/img/dress/여성/코트/1.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/코트/2.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/코트/3.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/코트/4.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/코트/5.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/코트/6.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/코트/7.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/코트/8.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/코트/9.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/코트/10.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/코트/11.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/코트/12.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/코트/13.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/코트/14.webp" class="cb_drag"></li>
							<li><img src="/img/dress/여성/코트/15.webp" class="cb_drag"></li>
						</ul>
					</div>
					<div>		
						<input type="radio" name="w_codi" id="w_shoes">
						<label for="w_shoes">신발</label>
						<ul>
							<li><img src="/img/dress/신발/신발1.webp" class="cb_drag"></li>
							<li><img src="/img/dress/신발/신발2.webp" class="cb_drag"></li>
							<li><img src="/img/dress/신발/신발3.webp" class="cb_drag"></li>
							<li><img src="/img/dress/신발/신발4.webp" class="cb_drag"></li>
							<li><img src="/img/dress/신발/신발5.webp" class="cb_drag"></li>
							<li><img src="/img/dress/신발/신발6.png" class="cb_drag"></li>
							<li><img src="/img/dress/신발/신발7.webp" class="cb_drag"></li>
							<li><img src="/img/dress/신발/신발8.webp" class="cb_drag"></li>
							<li><img src="/img/dress/신발/신발9.webp" class="cb_drag"></li>
							<li><img src="/img/dress/신발/신발10.webp" class="cb_drag"></li>
							<li><img src="/img/dress/신발/신발11.webp" class="cb_drag"></li>
							<li><img src="/img/dress/신발/신발12.webp" class="cb_drag"></li>
							<li><img src="/img/dress/신발/신발13.webp" class="cb_drag"></li>
							<li><img src="/img/dress/신발/신발14.webp" class="cb_drag"></li>
							<li><img src="/img/dress/신발/신발15.webp" class="cb_drag"></li>
							<li><img src="/img/dress/신발/신발16.webp" class="cb_drag"></li>
							<li><img src="/img/dress/신발/신발17.webp" class="cb_drag"></li>
							<li><img src="/img/dress/신발/신발18.webp" class="cb_drag"></li>
							<li><img src="/img/dress/신발/신발19.webp" class="cb_drag"></li>
							<li><img src="/img/dress/신발/신발20.webp" class="cb_drag"></li>
							<li><img src="/img/dress/신발/신발25.png" class="cb_drag"></li>
							<li><img src="/img/dress/신발/신발26.png" class="cb_drag"></li>
							<li><img src="/img/dress/신발/신발27.png" class="cb_drag"></li>
							<li><img src="/img/dress/신발/신발24.webp" class="cb_drag"></li>
						</ul>
					</div>
					<div>
						<input type="radio" name="w_codi" id="w_insert_img">
						<label for="w_insert_img">이미지추가</label>
						<ul>
							<li><button>이미지 추가</button></li>
						</ul>
					</div>
				</div>
			</li>
		</ul>
	</div>
</div>