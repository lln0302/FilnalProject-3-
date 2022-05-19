<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" href="/css/supply/supplyInfo.css" type="text/css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

<script>
	let nickname = "${nickname}"; // 세션에 있는 닉네임 사용
	
	function supplyDelOk() {
		if(confirm("게시물을 삭제하시겠어요?"))
			location.href="/supply/supplyDelete?supplyno=${vo.supplyno}";
	}
</script>

<h1>상태는 괜찮은데 쓰지 않게 된 캠핑용품들...</h1>
<h5>이곳에서 다른 사람들과 나눠보세요</h5>

<div class="container" id="spBody">
	<h1>${vo.title }</h1>
	
	<div id="spHead">
		<span id="ciNick">${vo.nickname }</span> | <i class="fa fa-clock clock"></i> <span id="ciDate">${vo.writedate }</span>
	</div>
	<hr>
	<!-- 본인 게시물인 경우에만 나타나도록 설정해줘야 함 -->
	<c:if test="${nickname==vo.nickname }">
		<div style="text-align: right;"> 
			<button id="ciEdit"  onclick="location.href='/supply/supplyEdit?supplyno=${vo.supplyno}'">수정</button>
			<button id="ciDel" onclick="supplyDelOk()">삭제</button>
		</div>
	</c:if>
	<img src="/img/supply/thumbnailImg/${vo.photo }" id="spInfoImg">
	
	<div id="spContent">
		${vo.content}
	</div>
	
	<div id="spFoot">
		<i class='fas fa-eye'></i> <span id="spView">${vo.views }</span>
		&nbsp;&nbsp;&nbsp;	
		<i class='fas fa-comment'></i> <span id="spReplyCount">[채팅방수]</span>
	</div>
	
	<div id="spRep">
		<button onclick="" id="spReplyButton">채팅방 생성 요청</button>
		<ul id="spReplyList">
			<li>
				<div class="spUserInfo">
					[닉네임1] 님 - 나눔 원합니다!! | [등록일]
				</div>
				<div class="goChatDiv">
					<button class="goChat" onclick="popup()">채팅방 이동</button>
				</div>
				<br>
			</li>
			<hr/>
			<li>
				<div>
					[닉네임2] 님 - 나눔 원합니다!! | [등록일]
				</div>
				<div class="goChatDiv">
					<button class="goChat">채팅방 이동</button>
				</div>
				<br>
			</li>
			<hr/>
		</ul>
	</div>
	
	
</div>

<script src="/js/supply/supplyInfo.js"></script>