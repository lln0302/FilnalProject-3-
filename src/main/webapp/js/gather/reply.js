$(function(){
	
	// 댓글 리스트
	function replyList(){
		let url = "/gather/replyList"
		let data = "gatherno="+$('#gatherno').val();
		$.ajax({
			url:url,
			data:data,
			success:function(success){
				let sucResult = success;
				
				let body = "<ul id='rList'>";
				$.each(sucResult, function(idx, item){
					body += "<li class='col-12'><div><span>"
					+item.nickname+ " | " + item.writedate + "</span>";
					if(nickname == item.nickname){
						body += "<span><button class='btn' id='edit'>수정</button>";
						body += "<input type='button' class='btn' id='del' value='삭제'></button>";	
					}
					body += "<br/><br/>" + item.content + "</span></div>"
					if(nickname == item.nickname){
						body += "<div class='editForm'><form method='post' class='form-inline'}>";
						body += "<textarea name='content' class='col-11 form-control'>"+item.content+"</textarea>"
						body += "<input type='hidden' name='replyno' value="+item.replyno+">";
						body += "<input type='submit' class='btn' value='수정' style='margin-left:10px; height:100%'></form></div>";	
					}
					body += "</li><hr/>";
				});
				body += "</ul>";
				$("#replyList").html(body);
			},error:function(){
				console.log('show replyList error');
			}
		});
	}
	
	// 댓글 개수 보이기
	function replyCount(){
		$.ajax({
				url:'/gather/replyCountSelect',
				data:"gatherno="+$("#gatherno").val(),
				type:'GET',
				success:function(result){
					$("#replyCount").html(result);
					},error:function(){
					alert("댓글 표시 에러")
				}
			});
	}
	
	// 댓글 등록
	$("#replyLine").on('submit', function(event){
		event.preventDefault();
		
		if($("#content").val()==""){ // 댓글을 입력안했을 때
			alert("댓글을 작성 후 등록해주세요");
		}else{
			$.ajax({
				url:'/gather/replyWrite',
				data:$("#replyLine").serialize(),
				type:'POST',
				success:function(){
					$("#content").val(""); // 댓글창 비우기
					replyList();           // 댓글 리스트 보이기
					replyCount();
				},error:function(){
					alert("로그인 후 이용해주세요!!");
				}
			});
			
		}
	})
	
	// 댓글 수정 버튼을 누르면 댓글 폼 보이기
	$(document).on('click', '#edit', function(){
		$(this).parent().css("display", "none");  // 댓글 내용 안보이게 하기
		$(this).parent().parent().siblings().css("display", "block"); // 댓글 수정 내용 보이게 하기
	})
	
	// 댓글 수정
	$(document).on('submit', '.editForm form', function(event){
		event.preventDefault();
		$.ajax({
			url:'/gather/replyEdit',
			data: $(this).serialize(),
			type:'POST',
			success:function(){
				alert('댓글이 수정되었습니다.');
				replyList();
				replyCount();
			},error:function(){
				console.log("Edit error")
			}
		});
	});
	
	// 댓글 삭제
	$(document).on('click', '#del', function(){
		if(confirm('댓글을 삭제하시겠어요?')){
			$.ajax({
				url:'/gather/replyDel',
				data:"replyno="+$('.editForm input[name=replyno]').val(),
				type:'GET',
				success:function(){
					alert('댓글이 삭제되었습니다.');
					replyList();
					replyCount();
				}
			});	
		}
	});
	
	replyList();  // 항상 댓글 리스트 보이기
	replyCount(); // 비동기식으로 댓글 추가되면 +1 삭제되면 -1
});