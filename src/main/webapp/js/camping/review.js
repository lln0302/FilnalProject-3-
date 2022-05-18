function clickReview(){
		$("#campIntro").hide();
		$("#campGuide").hide();
		$("#campMap").hide();	
		$("#campReview").show();
}
$(function(){
		
	// 캠핑 리뷰 리스트 보여주는 함수
	function reviewList(){
	$.ajax({
		url:"/camping/reviewList",
		data:"contentId="+$("#contentId").val(),
		success:function(success){
	
			let body = "<h2 id='titleText'>캠핑 후기</h2>"
			body += "<div class='container p-3 my-3 border list'>"
			body += "<table class='table table-hover text-center'>"
			body += "<thead><tr><th class='text-center'>닉네임</th>"
			body += "<th class='text-center reviewTitle'>후기</th>"
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
	}
	
	// 모달 창 닫기 버튼 클릭 시 데이터 초기화
	$('.modalClose').on('click', function() {
		$("input:radio[name=recommend]").prop('checked', false);
		$("#modalContent").val("");
	});
	
	// 모달 창 글 등록 버튼 클릭 시
	$("#modalSubmit").on('click', function(event){
		event.preventDefault();
		
		// 내용 미입력시 alert창 
		if(!$("input:radio[name=recommend]").is(":checked")){
			alert("추천인지 비추천인지 눌러주세요.");
			return false;
		}
		if($("#modalContent").val()==""){
			alert("후기 작성 후 등록해주세요");
			return false;
		}
		else{
			let data = $(".modal-body").serialize();
			console.log(data);
		/*	$.ajax({
				url:"/camping/reviewInsert",
				data:$(".modal-body").serialize(),
			})
*/		}
	});
	
	reviewList();
});
