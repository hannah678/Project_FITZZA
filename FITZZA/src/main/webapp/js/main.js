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

