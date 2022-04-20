window.onload=function(){
// (4) 구매후기 게시물 리스트
	var startNum04 = $("#my_list_contents04 li").length/5; // list안의 li태그의 개수
	var addListHtml04 = "";
	var url04 = '/member/myPage04';
	var param04 = {"startNum04" : startNum04};
	var pathname04 = window.location.pathname;
	var pn04 = pathname04.substring(pathname04.lastIndexOf('/')+1);
		console.log(startNum04);
	
	$.ajax({
		url : url04,
		type : 'GET',
		dataType : 'json',
		data :param04,
		success : function(data){
			for (var i = 0; i < data.length; i++) {
				addListHtml04 += "<li>";
                addListHtml04 += "<ul>";
				addListHtml04 += "<li class='my_list_subtitle'>"+data[i].title+"</li>";
				addListHtml04 += "<li class='my_list_subcontent'>"+data[i].content+"</li>";
				addListHtml04 += "<li class='my_list_hit'>"+data[i].hit+"</li>";
				addListHtml04 += "<li class='my_list_date'>"+data[i].write_date+"</li>";
				addListHtml04 += "</ul>";
                addListHtml04 += "<a href='/board/review/reivewView?board_num="+data[i].board_num+"'></a></li>";
				
			}
			if(data.length<5){
				$("#moreView04").remove();
			} 
			$("#my_list_contents04").append(addListHtml04);
			console.log(addListHtml04);
		}
	});
}
		