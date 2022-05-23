var ws;
var userName;

function wsOpen() {
	ws = new WebSocket("ws://" + location.host + "/chating/" + $("#roomno").val());
	wsEvt();
}

function wsEvt() {
	ws.onopen = function(data) {
		//소켓이 열리면 동작
	}

	ws.onmessage = function(data) {
		//메시지를 받으면 동작
		var msg = data.data;
		if (msg != null && msg.trim() != '') {
			var d = JSON.parse(msg);
			if (d.type == "getId") {
				var si = d.sessionId != null ? d.sessionId : "";
				if (si != '') {
					$("#sessionId").val(si);
				}
			} else if (d.type == "message") {
				if (d.sessionId == $("#sessionId").val()) {
					$("#chattingBox").append("<p class='item me'>" + `${userName}` + "<br><span class='meMsg'>" + d.msg + "</span></p>");
				} else {
					$("#chattingBox").append("<p class='item others'>" + d.userName + "<br><span class='othersMsg'>" + d.msg + "</span></p>");
				}

			} else {
				console.warn("unknown type!")
			}
		}
	}

	document.addEventListener("keypress", function(e) {
		if (e.keyCode == 13) { //enter press

			send();
		}
	});
}

function chatName() {
	var userName = $("#userName").val();
	if (userName == null || userName.trim() == "") {
		alert("사용자 이름을 입력해주세요.");
		$("#userName").focus();
	} else {
		wsOpen();
		$("#yourName").hide();
		$("#yourMsg").show();
	}
}

function send() {
	var option = {
		type: "message",
		roomno: $("#roomno").val(),
		sessionId: $("#sessionId").val(),
		userName: $("#nickname").val(),
		msg: $("#chatting").val()
	}
	ws.send(JSON.stringify(option))
	$('#chatting').val("");

	var lastItem = $(".chatBoxWrap #chattingBox").find(".item:last");
	setTimeout(function() {
		lastItem.addClass("on");
	}, 10);
	var position = lastItem.position().top + $(".chatBoxWrap #chattingBox").scrollTop();
	console.log(position);

	$(".chatBoxWrap #chattingBox").stop().animate({ scrollTop: position }, 500);

	//location.href = "/supply/chatSend?roomno=" + parseInt($("#roomno").val());

}


function close() {
	window.onbeforeunload = function(e) {
		var txt = $("#chattingBox").html();
		txt += "<p class='chatInfo'>- - - - - - - - 위는 이전 대화내용입니다 - - - - - - - -</p><br>"
		$("#content").val(txt);
		alert($("#content").val());

		$.ajax({
			url: '/supply/chatSend',
			data: $("#chatFrm").serialize(),
			type: 'POST',
			success: function() {
				
				//send();
			}, error: function() {
				alert("채팅 전송 오류..");
			}
		});
		
		return "종료하시겠습니까";
	}
}


$(function() {
	close();

	//탑, 푸터 부분 가리기
	$("#header").css('display', 'none');
	$("#footer").css('display', 'none');

	userName = $("#nickname").val();
	console.log(userName);
	wsOpen();

	// 채팅 전송
	$("#sendBtn").click(function() {
		$("#content").val($("#chattingBox").html());
		alert($("#content").val());

		$.ajax({
			url: '/supply/chatSend',
			data: $("#chatFrm").serialize(),
			type: 'POST',
			success: function() {
				
				send();
			}, error: function() {
				alert("채팅 전송 오류..");
			}
		});


	});







})