<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" href="/css/supply/supplyChat.css" type="text/css">


<div class="container" id="scBody">

	<h4>${vo.masterNickname} 님의 게시물에서 생성된 채팅방입니다</h4>
	<input type="hidden" id="nickname" value="${nickname }">
	<input type="hidden" id="sessionId" value="">
	<input type="hidden" id="roomno" value="${vo.roomno}">
	<h5>
		방 생성(client): ${vo.clientNickname }
	</h5>

	<form method="post" id="chatFrm">
		<div class="chatBoxWrap">
			<div id="chattingBox" class="chatinggg">${vo.content }</div>
		</div>
		<input type="hidden" name="roomno" value="${vo.roomno}">
		<textarea name="content" id="content" style="display: none;">${vo.content }</textarea>
		<div id="yourMsg">
			
			<table class="inputTable">
				<tr>
					<th>메시지</th>
					<th><textarea id="chatting" placeholder="보내실 메시지를 입력하세요."></textarea></th>
					<th><button type="button" id="sendBtn">전송</button></th>
				</tr>
			</table>
			
		</div>
	</form>

</div>
<script src="/js/supply/supplyChat.js"></script>