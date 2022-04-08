/*토글 메뉴*/
$(document).ready(function(){
    $('#menu_bar').on('click',function(){
        $('#gnb').removeClass('hide').addClass('show');
    }); 
});

$(document).ready(function(){
    $('#close_btn').on('click',function(){
        $('#gnb').removeClass('show').addClass('hide');
    }); 
});

/*스크롤 무빙*/
var html = $("html");
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

/*style_reco*/
$(document).ready(function(){
	$('#person1').on('click',function(){
		$('#person1').css({
			"position" : "absolute",
   			"left" : "550px",
   			"top" : "360px",
   			"transform" : "rotate(0deg)"
		});
	});
	$('#person2').on('click',function(){
		$('#person2').css({
			"position" : "absolute",
   			"left" : "700px",
   			"top" : "380px",
   			"transform" : "rotate(0deg)"
		});
	});
	$('#person3').on('click',function(){
		$('#person3').css({
			"position" : "absolute",
   			"left" : "850px",
   			"top" : "420px",
   			"transform" : "rotate(0deg)"
		});
	});
	$('#person4').on('click',function(){
		$('#person4').css({
			"position" : "absolute",
   			"left" : "1000px",
   			"top" : "360px",
   			"transform" : "rotate(0deg)"
		});
	});
	$('#person5').on('click',function(){
		$('#person5').css({
			"position" : "absolute",
   			"left" : "1150px",
   			"top" : "410px",
   			"transform" : "rotate(0deg)"
		});
	});
});

$(document).ready(function(){
	var count = 0;
	$('.person').on('click',function(){
		count++;
		
		if(count==5){
			$('#style_reco h1').css("opacity","1");
			$('#style_reco h2 a').css("display","block");
			$('#text_effect').css("opacity","0");
		}	
	});
});
/*review*/

            $(document).ready(function ($) {

                "use strict";

                //Page loader
                if ($('.pageloader').length) {

                    $('.pageloader').toggleClass('is-active');

                    $(window).on('load', function () {
                        var pageloaderTimeout = setTimeout(function () {
                            $('.pageloader').toggleClass('is-active');
                            $('.infraloader').toggleClass('is-active')
                            clearTimeout(pageloaderTimeout);
                        }, 700);
                    })
                }

               
                //Index hero animated header
                if ($('#large-header').length) {
                    // http://paulirish.com/2011/requestanimationframe-for-smart-animating/
                    // http://my.opera.com/emoller/blog/2011/12/20/requestanimationframe-for-smart-er-animating

                    // requestAnimationFrame polyfill by Erik MÃ¶ller. fixes from Paul Irish and Tino Zijdel

                    // MIT license

                    (function () {
                        var lastTime = 0;
                        var vendors = ['ms', 'moz', 'webkit', 'o'];
                        for (var x = 0; x < vendors.length && !window.requestAnimationFrame; ++x) {
                            window.requestAnimationFrame = window[vendors[x] + 'RequestAnimationFrame'];
                            window.cancelAnimationFrame = window[vendors[x] + 'CancelAnimationFrame']
                            || window[vendors[x] + 'CancelRequestAnimationFrame'];
                        }

                        if (!window.requestAnimationFrame)
                            window.requestAnimationFrame = function (callback, element) {
                                var currTime = new Date().getTime();
                                var timeToCall = Math.max(0, 16 - (currTime - lastTime));
                                var id = window.setTimeout(function () { callback(currTime + timeToCall); },
                                                           timeToCall);
                                lastTime = currTime + timeToCall;
                                return id;
                            };

                        if (!window.cancelAnimationFrame)
                            window.cancelAnimationFrame = function (id) {
                                clearTimeout(id);
                            };
                    }());

                    (function () {

                        var width, height, largeHeader, canvas, ctx, circles, target, animateHeader = true;

                        // Main
                        initHeader();
                        addListeners();

                        function initHeader() {
                            width = window.innerWidth;
                            height = window.innerHeight;
                            target = { x: 0, y: height };

                            largeHeader = document.getElementById('large-header');
                            largeHeader.style.height = height + 'px';

                            canvas = document.getElementById('demo-canvas');
                            canvas.width = width;
                            canvas.height = height;
                            ctx = canvas.getContext('2d');

                            // create particles
                            circles = [];
                            for (var x = 0; x < width * 0.5; x++) {
                                var c = new Circle();
                                circles.push(c);
                            }
                            animate();
                        }

                        // Event handling
                        function addListeners() {
                            window.addEventListener('scroll', scrollCheck);
                            window.addEventListener('resize', resize);
                        }

                        function scrollCheck() {
                            if (document.body.scrollTop > height) animateHeader = false;
                            else animateHeader = true;
                        }

                        function resize() {
                            width = window.innerWidth;
                            height = window.innerHeight;
                            largeHeader.style.height = height + 'px';
                            canvas.width = width;
                            canvas.height = height;
                        }

                        function animate() {
                            if (animateHeader) {
                                ctx.clearRect(0, 0, width, height);
                                for (var i in circles) {
                                    circles[i].draw();
                                }
                            }
                            requestAnimationFrame(animate);
                        }

                        // Canvas manipulation
                        function Circle() {
                            var _this = this;

                            // constructor
                            (function () {
                                _this.pos = {};
                                init();
                                console.log(_this);
                            })();

                            function init() {
                                _this.pos.x = Math.random() * width;
                                _this.pos.y = height + Math.random() * 200;
                                _this.alpha = 0.1 + Math.random() * 0.3;
                                _this.scale = 0.3 + Math.random() * 0.3;
                                _this.velocity = Math.random();
                            }

                            this.draw = function () {
                                if (_this.alpha <= 0) {
                                    init();
                                }
                                _this.pos.y -= _this.velocity;
                                _this.alpha -= 0.0005;
                                ctx.beginPath();
                                ctx.arc(_this.pos.x, _this.pos.y, _this.scale * 15, 0, 2 * Math.PI, false);
                                ctx.fillStyle = 'rgba(255,255,255,' + _this.alpha + ')';
                                ctx.fill();
                            };
                        }

                    })();
                }

            })
            
/*vote*/
$(document).ready(function(){
	$('.heart_empty').on('click',function(){
		$(this).toggleClass('checked');
	});
});

$(document).ready(function(){
	$('.prev').on('click',function(){
		$(this).parent().prev().children().css({
			"transform" : "translateX(0px)"
		});
	});
	$('.next').on('click',function(){
		$(this).parent().prev().children().css({
			"transform" : "translateX(-400px)"
		});
	});
});

/*codi_book*/
var img_L = 0;
var img_T = 0;
var targetObj;
    
function getLeft(o){
     return parseInt(o.style.left.replace('px', ''));
}
function getTop(o){
     return parseInt(o.style.top.replace('px', ''));
}
    
// 이미지 움직이기
function moveDrag(e){
     var e_obj = window.event? window.event : e;
     var dmvx = parseInt(e_obj.clientX + img_L);
     var dmvy = parseInt(e_obj.clientY + img_T);
     targetObj.style.left = dmvx +"px";
     targetObj.style.top = dmvy +"px";
     return false;
}
  
// 드래그 시작
function startDrag(e, obj){
     targetObj = obj;
     var e_obj = window.event? window.event : e;
     img_L = getLeft(obj) - e_obj.clientX;
     img_T = getTop(obj) - e_obj.clientY;
   
     document.onmousemove = moveDrag;
     document.onmouseup = stopDrag;
     if(e_obj.preventDefault)e_obj.preventDefault();
}
    
// 드래그 멈추기
function stopDrag(){
     document.onmousemove = null;
     document.onmouseup = null;
}




