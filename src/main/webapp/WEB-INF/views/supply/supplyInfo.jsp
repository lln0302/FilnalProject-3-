<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" href="/css/supply/supplyInfo.css" type="text/css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

<h1>상태는 괜찮은데 쓰지 않게 된 캠핑용품들...</h1>
<h5>이곳에서 다른 사람들과 나눠보세요</h5>

<div class="container" id="spBody">
	<h1>나눔)제목이 들어갈 부분입니다</h1>
	
	<div id="spHead">
		<span id="ciNick">[닉네임]</span> | <i class="fa fa-clock clock"></i> <span id="ciDate">[등록일]</span>
	</div>
	<hr>
	<!-- 본인 게시물인 경우에만 나타나도록 설정해줘야 함 -->
	<c:if test="${logStatus=='Y' }">
		<div style="text-align: right;"> <button id="ciEdit">수정</button><button id="ciDel">삭제</button></div>
	</c:if>
	<img src="/img/supply/cat.jpg" id="spInfoImg">
	
	<div id="spContent">
		[글 내용이 들어갈 부분입니다]<br>
		[글 내용이 들어갈 부분입니다]<br>
		[글 내용이 들어갈 부분입니다]<br>
		[글 내용이 들어갈 부분입니다]<br>
		[글 내용이 들어갈 부분입니다]<br>
		[글 내용이 들어갈 부분입니다]<br>
	</div>
	
	<div id="spFoot">
		<i class='fas fa-eye'></i> <span id="spView">[조회수]</span>
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