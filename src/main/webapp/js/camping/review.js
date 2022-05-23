// 캠핑&여행후기 탭 누르면 실행되는 함수
function clickReview(){
	$("#campIntro").hide();
	$("#campGuide").hide();
	$("#campMap").hide();	
	$("#campReview").show();
}

// 후기 등록 로그인 여부 함수
function modalLogin(){
	if(nickname==""){
		location.href="/member/loginForm";
	}
}

// 모달 창 내용 초기화 함수
function modalReset(){
	$("input:radio[name=recommend]").prop('checked', false);
	$("#modalContent").val("");
	$("#modifyContent").val("");
}

// 후기 작성 버튼 클릭시 후기 수정 모달 창 안보이게
function modalInsert(){
	$("#myModal").show();
	$("#modalModify").hide();
}

// 후기 클릭 시 후기 내용만 표시
function modalView(no){
	$.ajax({
		url:"/camping/modalView",
		data:"reviewno="+no,
		dataType:'json',
		success:function(result){
			$("#viewModalContent").html(result.content);
		},error:function(){
			alert("내용 표시 에러");
		}
	});
}

// 수정 버튼 클릭시 모달창에 수정 폼 표시
function modalUpdate(no){
	$("#myModal").hide();
	$("#modalModify").show();
	$.ajax({
		url:"/camping/reviewModal",
		data:"reviewno="+no,
		dataType:'json',
		success:function(result){
			if(result.recommend=='추천'){
				$("#modifyRecommend1").prop("checked", true);
				$("#modifyContent").val(result.content);
				$("#reviewno").val(result.reviewno);
			}
			if(result.recommend=='비추천'){
				$("#modifyRecommend2").prop("checked", true);
				$("#modifyContent").val(result.content);
				$("#reviewno").val(result.reviewno);
			}
		}
	});
}

// 삭제 버튼 클릭시 삭제
function modalDelete(no){
	if(confirm('후기를 삭제하시겠어요?')){
		$.ajax({
			url:"/camping/reviewDelete",
			data:"reviewno="+no,
			success:function(){
				alert("후기가 성공적으로 삭제되었습니다.");
				reviewList();
			},error:function(){
				alert('삭제 실패')
			}
		});
	}
}

// 캠핑 리뷰 리스트 함수
function reviewList(){
	$.ajax({
		url:"/camping/reviewList",
		data:"contentId="+$("#contentId").val(),
		success:function(success){
			let body = "<h2 id='titleText'>캠핑 후기</h2>"
			body += "<div class='container p-3 my-3 border list'>"
			body += "<table class='table table-hover text-center'>"
			body += "<button type='button' id='writeBtn' data-toggle='modal'"
			body += "data-target='#myModal' class='btn' onclick='modalLogin();"
			body += "modalInsert();'>후기 작성</button>"
			body += "<thead><tr><th class='text-center'>닉네임</th>"
			body += "<th class='text-center reviewTitle'>후기</th>"
			body += "<th class='text-center'>작성날짜</th>"
			body += "<th class='text-center'><i class='fa fa-thumbs-up'></i> /  "
			body += "<i class='fa fa-thumbs-down'></i></th></tr></thead><tbody>";
			$.each(success, function(idx, vo){
				if(nickname==vo.nickname){ // 글 작성한 유저와 로그인한 유저가 같을 때 수정 삭제 버튼 표시
					body += "<tr><td><input type='button' class='btn updateBtn' data-toggle='modal'"
					body += "data-target='#modalModify' onclick='modalLogin();"
					body += "modalUpdate("+vo.reviewno+");' value='수정'>&nbsp;"
					body += "<input type='button' class='btn delBtn'class='btn'"
					body += "onclick='modalLogin(); modalDelete("+vo.reviewno+");'value='삭제'></td>"
					body += "<td class='reviewTitle'><a href='#viewModal' data-toggle='modal'"
					body += "onclick='modalView("+vo.reviewno+")'><span>" + vo.content + "</span></a>"
					body += "</td><td>" + vo.createdate +"</td><td>"
					if(vo.recommend == '추천'){
						body += "<i class='fa fa-thumbs-up'></i>&nbsp;" 
						+ vo.recommend + "</td></tr>"
					}else{		
						body += "<i class='fa fa-thumbs-down'></i>&nbsp;" 
						+ vo.recommend + "</td></tr>"
					}
				}else{
					body += "<tr><td>" + vo.nickname + "</td>"
					body += "<td class='reviewTitle'><a href='#viewModal' data-toggle='modal'"
					body += "onclick='modalView("+vo.reviewno+");'><span>" + vo.content + "</span>"
					body += "</a></td><td>" + vo.createdate +"</td><td>"
					if(vo.recommend == '추천'){
					body += "<i class='fa fa-thumbs-up'></i>&nbsp;" 
					+ vo.recommend + "</td></tr>"
					}else{		
						body += "<i class='fa fa-thumbs-down'></i>&nbsp;" 
						+ vo.recommend + "</td></tr>"
					}
				}
			})
			body += "<nav aria-label=''Page navigation example''></tr></tbody></table></div>"
			body += "<ul class='pagination justify-content-center'>"
			body += "<li class='page-item prev'><a class='page-link'"
			body += "href='javascript:void(0);' onclick='prev()'>"
			body += "<i class='fa fa-angle-left'></i></a></li>"
			body += "<li class='page-item'><a class='page-link' href='javascript:void(0);'"
			body += "onclick='current();'></a><li class='page-item next'>"
			body += "<a class='page-link' href='javascript:void(0);' onclick='next()'>"
			body += "<i class='fa fa-angle-right'></i></a></li></ul>"
			body += "</ul></nav><br/>"
			
			$("#campReview").html(body);
			
		},error:function(){
			alert('show reviewList error');
		}
	});
}

$(function(){
	
	// 항상 후기 리스트 보이기
	reviewList();

	// 모달 창 닫기 버튼 클릭 시 초기화
	$('.modalClose').on('click', function() {
		modalReset();
	});

	// 모달 창 글 등록 버튼 클릭 시
	$("#modalSubmit").on('click', function(event){
		event.preventDefault();
		
		if(!$("input:radio[name=recommend]").is(":checked")){
			alert("추천인지 비추천인지 눌러주세요.");
			return false;
		}
		if($("#modalContent").val()==""){
			alert("후기 작성 후 수정해주세요");
			return false;
		}
		else{ // 모든 내용 입력 시
			$.ajax({
				url:"/camping/reviewInsert",
				data:$(".mBody").serialize(),
				success:function(){
					modalReset();
					$("#myModal").modal('hide');
					alert('후기가 성공적으로 등록되었습니다.');
					reviewList();
				},error:function(){
					alert('로그인을 해주시기 바랍니다.');
					location.href="/member/loginForm";
				}
			});
		}
	});

	// 모달 창 글 수정 버튼 클릭 시
	$("#modalUpdate").on('click', function(event){
		event.preventDefault();

		if(!$("input:radio[name=recommend]").is(":checked")){
			alert("추천인지 비추천인지 눌러주세요.");
			return false;
		}
		if($("#modifyContent").val()==""){
			alert("후기 작성 후 수정해주세요");
			return false;
		}
		else{ // 모든 내용 입력 시
			$.ajax({
				url:'/camping/reviewUpdate',
				data:$('.body').serialize(),
				success:function(){
					modalReset();
					$("#modalModify").modal('hide');
					alert('후기가 성공적으로 수정되었습니다.');
					reviewList();
				}
			});
		}
	})

});