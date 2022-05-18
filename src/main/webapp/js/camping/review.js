function clickReview(){
		$("#campIntro").hide();
		$("#campGuide").hide();
		$("#campMap").hide();	
		$("#campReview").show();
	}

$(function(){
		$.ajax({
		url:"/camping/reviewList",
		data:"contentId="+$("#contentId").val(),
		success:function(success){
	
			let body = "<h3 style='text-align:center'>캠핑 후기</h3>"
			body += "<div class='container p-3 my-3 border list'>"
			body += "<table class='table table-hover text-center'>"
			body += "<thead><tr><th class='text-center'>닉네임</th>"
			body += "<th class='text-center reviewTitle' style='width:400px'>후기</th>"
			body += "<th class='text-center'>작성날짜</th>"
			body += "<th class='text-center'><i class='fa fa-thumbs-up'></i> /  "
			body += "<i class='fa fa-thumbs-down'></i></th></thead><tbody>";
			$.each(success, function(idx, vo){
				body += "<tr><td>" + vo.nickname + "</td>"
				body += "<td class='reviewTitle'><a href='#'><span>" + vo.content + "</a></span></td>"
				body += "<td>" + vo.createdate +"</td><td>"
				if(vo.recommend == '추천'){
					body += "<i class='fa fa-thumbs-up'></i>&nbsp;" + vo.recommend + "</td></tr>"
				}else{		
					body += "<i class='fa fa-thumbs-down'></i>&nbsp;" + vo.recommend + "</td></tr>"
				}
			})
			body += "<button id='writeBtn' data-toggle='modal' data-target='#myModal' class='btn'>후기 작성</button>"
			body += "</tbody></table></div>"
		
			$("#campReview").html(body);
		},error:function(){
			alert('show reviewList error');
		}
	});
		
});
