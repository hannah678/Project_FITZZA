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

/*var html = $("html");
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
});*/

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