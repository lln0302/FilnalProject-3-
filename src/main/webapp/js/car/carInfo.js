/**
 * 
 */
var locx, locy;
locx = $("#locX").val();
locy = $("#locY").val();

$(function(){
	// 댓글 리스트
	function replyList(){
		let url = "/car/replyList"
		let data = "carno="+parseInt($("#carno").val());
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
						body += "<span><button class='btn' id='ciReplyEdit'>수정</button>";
						body += "<button class='btn' id='ciReplyDel'>삭제</button>";	
					}
					body += "<br/><br/>" + item.content + "</span></div>"
					if(nickname == item.nickname){
						body += "<div class='editForm'><form method='post' class='form-inline'}>";
						body += "<textarea name='content' id='content'class='col-11 form-control'>"+item.content+"</textarea>"
						body += "<input type='hidden' name='replyno' value="+item.replyno+">";
						body += "<input type='submit' class='btn' id='ciReplyButton' value='수정' style='margin-left:10px; height:100%'></form></div>";	
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
				url:'/car/replyCountSelect',
				data:"carno="+parseInt($("#carno").val()),
				type:'GET',
				success:function(result){
					$("#ciReplyCount").html(result);
					},error:function(){
					alert("댓글 표시 에러")
				}
			});
	}
	
	// 댓글 등록
	$("#ciFrm").on('submit', function(event){
		event.preventDefault();
		
		if($("#ciReply").val()==""){ // 댓글을 입력안했을 때
			alert("댓글을 작성 후 등록해주세요");
		}else{
			$.ajax({
				url:'/car/replyWrite',
				data:$("#ciFrm").serialize(),
				type:'POST',
				success:function(){
					$("#ciReply").val(""); // 댓글창 비우기
					replyList();           // 댓글 리스트 보이기
					replyCount();
					//var cnt = parseInt($("#ciReplyCount").text());
					//$("#ciReplyCount").text(cnt+1);
				},error:function(){
					alert("로그인 후 이용해주세요!!");
				}
			});
			
		}
	})
	
	// 댓글 수정 버튼을 누르면 댓글 폼 보이기
	$(document).on('click', '#ciReplyEdit', function(){
		$(this).parent().css("display", "none");  // 댓글 내용 안보이게 하기
		$(this).parent().parent().siblings().css("display", "block"); // 댓글 수정 내용 보이게 하기
	})
	
	// 댓글 수정
	$(document).on('submit', '.editForm form', function(event){
		event.preventDefault();
		$.ajax({
			url:'/car/replyEdit',
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
	$(document).on('click', '#ciReplyDel', function(){
		if(confirm('댓글을 삭제하시겠어요?')){
			$.ajax({
				url:'/car/replyDel',
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
	replyList();
	replyCount();
});












// 이미지 지도에서 마커가 표시될 위치입니다 
var markerPosition = new kakao.maps.LatLng(locx, locy);

// 이미지 지도에 표시할 마커입니다
// 이미지 지도에 표시할 마커는 Object 형태입니다
var marker = {
	position: markerPosition
};

var staticMapContainer = document.getElementById('staticMap'), // 이미지 지도를 표시할 div  
	staticMapOption = {
		center: new kakao.maps.LatLng(locx, locy), // 이미지 지도의 중심좌표
		level: 2, // 이미지 지도의 확대 레벨
		marker: marker // 이미지 지도에 표시할 마커 
	};

// 이미지 지도를 생성합니다
var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);