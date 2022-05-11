<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
	a, a:link, a:visited, a:hover, a:active{
		color:black;
		text-decoration: none;
	}
	#header, footer {
		display: none;
	}
	#adminPage #adminTop:after {
		clear:both;
		display:block;
	}
	#adminPage #adminTop .adminTopMenu {
		float:left;
		width:200px;/*238*/
		text-align: center;
		font-size: 21px;
	}
	#logoPart #adminMainHomeLogo {
		width: 100px;
	}
</style>
<body>
	
		<div id="adminTop" style="width:1200px;height:90px;background:rgba(170, 170, 170, 0.7);">
			<div class="adminTopMenu" id="logoPart">
				<a href="/admin/adminMain"><img id="adminMainHomeLogo" src="/img/logo/mulcamping_logo-05.png" /></a>
			</div>
			<div class="adminTopMenu">　</div>
			<div class="adminTopMenu">　</div>
			<div class="adminTopMenu">　</div>
				<c:if test="${logStatus == 'Y'}">
					<div class="adminTopMenu" id="signInPart">
						<a href="#">
						<span style="background:rgba(210, 210, 210, 0.7); border-radius: 8px;">
							<span style="color:orange;font-weight: bold;">관리자</span>
							<span>님</span>
						</span>
						</a>
					</div>
				</c:if>
				<c:if test="${logStatus != 'Y'}">
					<div class="adminTopMenu">　</div>
				</c:if>
				<!-- <div class="adminTopMenu" id="signUpPart">
					<a href="/">
						<span style="background:rgba(210, 210, 210, 0.7); border-radius: 8px;">메인페이지</span>
						</a>
				</div> -->
				<c:if test="${logStatus == 'Y'}">
					<div class="adminTopMenu" id="logoutPart">
						<input type="button" value="logout" onclick="location.href='${url}/member/logout'"/>
					</div>
				</c:if>
				<c:if test="${logStatus != 'Y'}">
					<div class="adminTopMenu" id="loginPart">
						<input type="button" value="login" onclick="location.href='${url}/member/loginForm'"/>
					</div>
				</c:if>
		</div>
</body>
</html>