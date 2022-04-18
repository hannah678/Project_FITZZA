<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="/css/qnaWrite.css" type="text/css">
<link rel="stylesheet" href="/css/gradientStars.css" type="text/css">
<script type="text/javascript" src="/js/gradientStars.js"></script>
<script>
	$(function(){
		$("#boardFrm").submit(function(){
			if($("#title").val()==''){
				alert("질문 제목을 입력하세요");
				$("#title").focus();
				return false;
			}
			if($("#introduce").val()==''){
				alert("질문 내용을 입력하세요");
				$("#introduce").focus();
				return false;
			}
			if($("#upload_file").val()==''){
				alert("이미지를 첨부하세요");
				$("#upload_file").focus();
				return false;
			}
		});
	});
</script> 

<body>
    <div class="boardcontainer">
		<br><br><br><br><br><br><br><br>
        <h1>질문하기</h1>
        <form method="post" action="/board/qna/qnaWriteOk" id="boardFrm" enctype="multipart/form-data">
        <input type="hidden" name="type_num" value="5"/>
        <input type="hidden" name="gender_type" value="U">
            <ul>
                <li>제목 &emsp; <input type="text" name="title" id="title" placeholder='	질문 제목을 입력해주세요.'/></li>
				<hr/>
				<li class="qna_introduce">
					<span>내용</span>
					<textarea name="content" id="introduce" rows="10" cols="90" placeholder='	질문 내용을 입력해주세요.'></textarea>
				</li>
				<hr/>
				<li class="qna_img_area"><span>이미지</span> &emsp; <input type="text" id="file_route" disabled="disabled" value="파일 선택">
					<label for="upload_file" id="upload">업로드</label>
					<input type="file" id="upload_file" name="filename" accept="image/*"
						style="position:absolute; clip:rect(0, 0, 0, 0);">
					<img style="width: 300px; height:300px; display:inline-block" id="img_section" src="/img/이미지 없음.png"></li>
					<script>
						const reader = new FileReader();
				
						reader.onload = (readerEvent) => {
							document.querySelector("#img_section").setAttribute("src", readerEvent.target.result);
						};
				
						document.querySelector("#upload_file").addEventListener("change", (changeEvent) => {
				
							const imgFile = changeEvent.target.files[0];
							reader.readAsDataURL(imgFile);
				
							const fileName = document.getElementById("file_route");
							fileName.value = imgFile.name;
						})
					</script>
					<script>
						const reader = new FileReader();
					
						reader.onload = (readerEvent) => {
							document.querySelector("#img_section").setAttribute("src", readerEvent.target.result);
						};
					
						document.querySelector("#upload_file").addEventListener("change", (changeEvent) => {
							const imgFile = changeEvent.target.files[0];
							reader.readAsDataURL(imgFile);
						})
					</script>
				<hr/>
				<li><input type='submit' value='등록하기' id="enter"/></li>
            </ul>
        </form>
    </div>
</body>
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