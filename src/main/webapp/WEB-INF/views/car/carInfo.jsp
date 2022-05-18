<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<link rel="stylesheet" href="/css/car/carInfo.css" type="text/css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1ba94570565044323eac417fcde53827&libraries=services"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

<script>
	let nickname = "${nickname}"; // 세션에 있는 닉네임 사용
	
	function carDelOk() {
		if(confirm("게시물을 삭제하시겠어요?"))
			location.href="/car/carDelete?carno=${vo.carno}";
	}
</script>

<div class="container" id="ciBody">
	<h1>${vo.title }</h1>
	<input type="hidden" id="locX" name="locX" value="${vo.locX}"/>
	<input type="hidden" id="locY" name="locY" value="${vo.locY}"/>
	
	<div id="ciHead">
		<span id="ciNick">${vo.nickname }</span> | <i class="fa fa-clock clock"></i> <span id="ciDate">${vo.writedate }</span>
	</div>
	<hr>
	<!-- 본인 게시물인 경우에만 나타나도록 설정해줘야 함 -->
	<c:if test="${nickname == vo.nickname}">
		<div style="text-align: right;"> 
			<button id="ciEdit" onclick="location.href='/car/carEdit?carno=${vo.carno}'">수정</button>
			<button id="ciDel" onclick="carDelOk()">삭제</button>
		</div>
	</c:if>
	
	<div id="ciMapWrap">
		<div id="staticMap" style="height:350px;"></div>
	</div><br>
	
	<div id="ciContent">
	${vo.content }
	</div>
	
	<div id="ciFoot">
		<i class='fas fa-eye'></i> <span id="ciView">${vo.views}</span>
		&nbsp;&nbsp;&nbsp;	
		<i class='fas fa-comment'></i> <span id="ciReplyCount">${vo.count }</span>
	</div>
	
	<div id="ciRep">
		<form method="post" id="ciFrm">
			<input type="hidden" name="carno" id="carno" value="${vo.carno}">
			<textarea id="ciReply" name="content" placeholder="댓글 입력 ..."></textarea>
			<input type="submit" id="ciReplyButton" value="댓글 등록">
		</form>
		
		<!-- 댓글목록 -->
		<div id="replyList" class="col-12 form-group"></div>
		
	</div>
</div>

<script src="/js/car/carInfo.js"></script>