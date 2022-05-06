<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="/css/admin/adminMain.css" type="text/css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script async src='/cdn-cgi/bm/cv/669835187/api.js'></script>
<script type="text/javascript" src="/js/admin/adminSideTab.js"></script>
<style>
.containerAddCamperList {
	float:left;
	width: 1000px;
	height: 1000px;
	border: 1px solid #ddd;
	padding: 10px;
	border-radius: 4px;
}
#header, footer {
	display: none;
}
#addCamperList{
	overflow:auto;
}
#addCamperList>li{
	list-style-type: none;
	float:left;
	height: 50px;
	line-height: 50px;
	width:10%;
	border-bottom:solid 3px gray;
	text-align: center;
	background-color: rgba(205, 188, 171, 0.5);
	font-weight: bold;
}
#addCamperList>li:nth-child(5n+1){
	width:50%;
}
#addCamperList>li:nth-child(5n+5){
	width:20%
}
</style>
<body>
	<div id="adminPage">
		<%@ include file="/WEB-INF/views/admin/adminTop.jsp" %>
		<div id="adminMainContent">
		
			<ul style="z-index:2;">
				<li>
					<div class='menu_img' id="menu1">
						<div>1</div>
						<div>2</div>
						<div>3</div>
						<div>4</div>
						<div>5</div>
						<div>6</div>
						<div>7</div>
						<div>8</div>
					</div>
				</li>
					
				<li class='menuExpansion'>
					<div class='menu_img' id="menu2">
							<a class="menuATag" href="/admin/adminMain"><div class="menu2right">대시보드</div></a><div class="menu2left">1</div>
							<a class="menuATag" href="/admin/adminMembers"><div class="menu2right">회원목록</div></a><div class="menu2left">2</div>
							<a class="menuATag" href="/admin/adminCampList"><div class="menu2right">캠핑장목록</div></a><div class="menu2left">3</div>
							<a class="menuATag" href="/admin/adminAddCamperList"><div class="menu2right">캠퍼모집목록</div></a><div class="menu2left">4</div>
							<a class="menuATag" href="/admin/adminAutoCampList"><div class="menu2right">차박지공유목록</div></a><div class="menu2left">5</div>
							<a class="menuATag" href="/admin/adminShareList"><div class="menu2right">캠핑용품나눔목록</div></a><div class="menu2left">6</div>
							<a class="menuATag" href="/admin/adminReviewList"><div class="menu2right">리뷰목록</div></a><div class="menu2left">7</div>
							<a class="menuATag" href="/admin/adminCommentList"><div class="menu2right">댓글목록</div></a><div class="menu2left">8</div>
					</div>
				</li>
			</ul>
			<div id="adminMainContentTop">
				<hr id="hr2px_red">
				캠퍼모집목록
			</div>
			<hr id="hr2px">
				<div class="containerAddCamperList">
					<ul id="addCamperList">
						<li>글제목</li>
						<li>인원</li>
						<li>작성자</li>
						<li>매너온도</li>
						<li>작성일</li>
					
						<!--<c:forEach var="vo" items="${lst}">
							<li>${vo}</li>
							<li><a href="/admin/adminAddCamperListInfo?no=${vo}">${vo}</a></li>
							<li>${vo}</li>
							<li>${vo}</li>
							<li>${vo}</li>
							<li>${vo}</li>
						</c:forEach>-->
					</ul>
				
				</div>
		</div>
	</div>
	
</body>
</html>