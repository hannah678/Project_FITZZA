<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="/css/todayCodi.css" type="text/css">
	<script>
	$(function(){
		$("#tc_boardFrm").submit(function(){
			if($("#tc_title").val()==''){
				alert("제목을 입력하세요");
				return false;
			}
            if($("#upload_file1").val()==''){
				alert("이미지를 첨부하세요");
				return false;
			}
		});
	});
</script>
	<div class="tcw_container">
        <h1>오늘의 코디 올리기</h1>
        <form method="post" action="/board/todayCodi/todayCodiWriteOk" id="tc_boardFrm" enctype="multipart/form-data">
        	<input type="hidden" name="type_num" value="1"/>
            <ul>
                <li>제목 &emsp; <input type="text" name="title" id="tc_title" placeholder='	제목을 입력해주세요.'/></li>
				<hr/>
				<li>설명 &emsp; <br/><textarea name="content" id="content" rows="10" cols="100"></textarea></li>
				<hr/>
				<li style="display:none">의상 타입 &emsp;  <select id="gender_type" name="gender_type">
					<option value="W" name="W">여성의류</option>
					<option value="M" name="M">남성의류</option>
					<option value="U" name="U">남여공용</option>
				</select></li>
				<div class="tc_img1">
                    <li id="tc_img1">대표이미지<br/>
                        <div>
                            <img style="width: 500px;" id="tc_img_section" src="/img/이미지 없음.png"><br/>
                            <input type="text" id="file_route1"  disabled="disabled" value="파일 선택" >
                            <label for="upload_file1">업로드</label>
                            <input type="file" id="upload_file1" name="filename" accept="image/*" required=true style="position:absolute; clip:rect(0, 0, 0, 0);"><br/>
                        </div>
                    </li>
                </div>
                
				<script>
						const reader = new FileReader();
						reader.onload = (readerEvent) => {
							document.querySelector("#tc_img_section").setAttribute("src", readerEvent.target.result);
						};
						document.querySelector("#upload_file1").addEventListener("change", (changeEvent) => {
							const imgFile = changeEvent.target.files[0];
							reader.readAsDataURL(imgFile);
							const fileName = document.getElementById("file_route1");
							fileName.value = imgFile.name;
						});
				</script>
				<li class="enter_box"><input type='submit' value='등록하기' id="tc_enter"/></li>
			</ul>
        </form>
    </div>
	<!-- particles.js container -->
    <div id="particles-js"></div>
            
    <!-- scripts -->
    <script src="/js/particles.js"></script>
    <script>
    particlesJS('particles-js',
    		  
    		  {
    		    "particles": {
    		      "number": {
    		        "value": 100,
    		        "density": {
    		          "enable": true,
    		          "value_area": 1000
    		        }
    		      },
    		      "color": {
    		        "value": "#276968"
    		      },
    		      "shape": {
    		        "type": "star",
    		        "stroke": {
    		          "width": 0,
    		          "color": "#000000"
    		        },
    		        "polygon": {
    		          "nb_sides": 5
    		        },
    		        "image": {
    		          "src": "img/github.svg",
    		          "width": 50,
    		          "height": 50
    		        }
    		      },
    		      "opacity": {
    		        "value": 0.5,
    		        "random": false,
    		        "anim": {
    		          "enable": false,
    		          "speed": 3,
    		          "opacity_min": 0.1,
    		          "sync": false
    		        }
    		      },
    		      "size": {
    		        "value": 4,
    		        "random": true,
    		        "anim": {
    		          "enable": false,
    		          "speed": 2,
    		          "size_min": 0.1,
    		          "sync": false
    		        }
    		      },
    		      "line_linked": {
    		        "enable": true,
    		        "distance": 150,
    		        "color": "#54bab9",
    		        "opacity": 0.4,
    		        "width": 1
    		      },
    		      "move": {
    		        "enable": true,
    		        "speed": 1,
    		        "direction": "none",
    		        "random": false,
    		        "straight": false,
    		        "out_mode": "out",
    		        "attract": {
    		          "enable": false,
    		          "rotateX": 600,
    		          "rotateY": 1200
    		        }
    		      }
    		    },
    		    "interactivity": {
    		      "detect_on": "canvas",
    		      "events": {
    		        "onhover": {
    		          "enable": true,
    		          "mode": "repulse"
    		        },
    		        "onclick": {
    		          "enable": true,
    		          "mode": "push"
    		        },
    		        "resize": true
    		      },
    		      "modes": {
    		        "grab": {
    		          "distance": 400,
    		          "line_linked": {
    		            "opacity": 1
    		          }
    		        },
    		        "bubble": {
    		          "distance": 400,
    		          "size": 40,
    		          "duration": 3,
    		          "opacity": 8,
    		          "speed": 3
    		        },
    		        "repulse": {
    		          "distance": 200
    		        },
    		        "push": {
    		          "particles_nb": 4
    		        },
    		        "remove": {
    		          "particles_nb": 2
    		        }
    		      }
    		    },
    		    "retina_detect": true,
    		    "config_demo": {
    		      "hide_card": false,
    		      "background_color": "#b61924",
    		      "background_image": "",
    		      "background_position": "50% 50%",
    		      "background_repeat": "no-repeat",
    		      "background_size": "cover"
    		    }
    		  }

    		);
    </script>
</body>
