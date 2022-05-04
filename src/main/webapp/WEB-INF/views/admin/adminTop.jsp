<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
	#header, footer {
		display: none;
	}
	#adminPage #adminTop:after {
		clear:both;
		display:block;
	}
	#adminPage #adminTop .adminTopMenu {
		float:left;
		width:238px;
		text-align: center;
		font-size: 21px;
	}
	#logoPart #adminMainHomeLogo {
		width: 100px;
	}
</style>
<body>
	
		<div id="adminTop" style="width:1200px;height:90px;background-color:orange;">
			<div class="adminTopMenu" id="logoPart">
				<a href="/adminMain"><img id="adminMainHomeLogo" src="/img/logo/mulcamping_logo-05.png" /></a>
			</div>
			<div class="adminTopMenu">　</div>
			<div class="adminTopMenu">　</div>
			<c:if test="${logId==null }">
				<div class="adminTopMenu" id="signInPart">
					<a href="/adminSignIn">로그인</a>
				</div>
				<div class="adminTopMenu" id="signUpPart">
					<a href="/member/memberForm">회원가입</a>
				</div>
			</c:if>
			<!--<c:if test="${logId==!null }">
				<div class="adminTopMenu">
					<b style="font-size:12px;color:orange;">관리자( ${username } )</b>님
				</div>
				<div class="adminTopMenu" id="signUpPart">
					<a href="/admin/adminSignOut">로그아웃</a>
				</div>
			</c:if>-->
		</div>
</body>
</html>