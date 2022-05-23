/**
 * 
 */

$(function(){
	// 채팅방 리스트
	function replyList(){
		let url = "/supply/chatList"
		let data = "supplyno="+parseInt($("#supplyno").val());
		$.ajax({
			url:url,
			data:data,
			success:function(success){
				let sucResult = success;
				//<c:if test="${nickname == vo.nickname || item.clientNickname == nickname}">
				//</c:if> ""
				var nick = $("#clientNickname").val();
				let body = '<table id="roomList" class="roomList col-12">';
				$.each(sucResult, function(idx, item){
					console.log(item);
					body += "<tr class='chatTr"+ idx +"'>" +
							"<td class='num col-1'>" + (idx + 1) + "</td>" +
							"<td class='room col-9'>" + item.clientNickname+" 님 - 나눔 원합니다!!&nbsp;&nbsp;|&nbsp;&nbsp;" + item.writedate + "</td>" +
							"<td class='chatDel col-1'>";
					if(nick == item.clientNickname || nick == $("#masterNickname").val()) {		
					body += "<input type='hidden' name='roomno' value='"+ item.roomno +"'/>" +
							"<button class='chatDelButton'>삭제</button></td>" +
							"<td class='go col-1'>" +
							"<button onclick='goRoom(" + item.roomno + ")'>참여</button></td>";
					}
							
					body +=	"</tr>";
				});
				body += "</table>";
				$("#roomContainer").html(body);
			},error:function(){
				console.log('show replyList error');
			}
		});
	}
	
	// 채팅방 개수 표시
	function replyCount(){
		$.ajax({
				url:'/supply/chatCountSelect',
				data:"supplyno="+parseInt($("#supplyno").val()),
				type:'GET',
				success:function(result){
					$("#spReplyCount").html(result);
					},error:function(){
					alert("채팅방 표시 에러")
				}
			});
	}
	
	// 채팅방 생성
	$("#createRoom").click(function() {
		if($("#clientNickname").val() == "") {
			alert("로그인 후 이용해주세요");
			location.href="/member/loginForm";
			return false; 
		}else{
			$.ajax({
				url:'/supply/chatWrite',
				data:$("#chatFrm").serialize(),
				type:'POST',
				success:function(){
					replyList();           // 리스트 보이기
					replyCount();
				},error:function(){
					alert("로그인 후 이용해주세요!!");
				}
			});
			
		}
	});
	
	
	// 채팅방 삭제
	$(document).on('click', '.chatDelButton', function(){
		if(confirm('채팅방을 삭제하시겠어요?')){
			$.ajax({
				url:'/supply/chatDel',
				data:"roomno="+$('.chatDel input[name=roomno]').val(),
				type:'GET',
				success:function(){
					alert('채팅방이 삭제되었습니다.');
					replyList();
					replyCount();
				}
			});	
		}
	});
	replyList();
	replyCount();
	
	
});


function goRoom(number) {
	//location.href = "/supply/moveChating?roomName=" + name + "&" + "roomNumber=" + number;
	window.open("/supply/moveChat?roomno=" + number, "chatting",
		"width=450,height=700,top=" + (window.innerHeight - 400)
		+ ",left=" + (window.innerWidth - 400));
}



/*
function commonAjax(url, parameter, type, calbak, contentType) {
	$.ajax({
		url: url,
		data: parameter,
		type: type,
		contentType: contentType != null ? contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
		success: function(res) {
			calbak(res);
		},
		error: function(err) {
			console.log('error');
			calbak(err);
		}
	});
}*/