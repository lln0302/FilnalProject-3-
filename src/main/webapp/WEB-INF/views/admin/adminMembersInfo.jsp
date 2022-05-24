<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<link rel="stylesheet" href="/css/base.css" type="text/css" />
<link rel="stylesheet" href="/css/admin/adminMain.css" type="text/css" />
<link rel="stylesheet" href="/css/admin/adminMenu.css" type="text/css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script async src='/cdn-cgi/bm/cv/669835187/api.js'></script>
<script type="text/javascript" src="/js/admin/adminSideTab.js"></script>
<script type="text/javascript" src="/js/admin/adminCheckBox.js"></script>
<script type="text/javascript" src="/js/admin/adminAlert.js"></script>
<style>
.leftTH_main{
	/*border-bottom:rgba(0, 84, 255, 1) solid 1px;*/
	border-bottom:rgba(170, 170, 170, 1) solid 1px;
}
.rightTH_main{
	border-bottom:black solid 1px;
}
.leftTH {
	width:30%;
	/*background-color:rgba(0, 84, 255, 0.2);
	border: rgba(0, 84, 255, 1) solid 1px;*/
	background-color:rgba(170, 170, 170, 0.3);
	border: rgba(170, 170, 170, 1) solid 1px;
}
.rightTH {
	width:70%;
	text-align: left;
	border: black solid 1px;
}

#listMenu>li:nth-child(9n+1) {
	width:4%;
}
#listMenu>li:nth-child(9n+2), #listMenu>li:nth-child(9n+5),
#listMenu>li:nth-child(9n+8), #listMenu>li:nth-child(9n+9)
{
	width:14%;
}
#listMenu>#listMenuFE>li:nth-child(9n+1) {
	width:4%;
}
#listMenu>#listMenuFE>li:nth-child(9n+2), #listMenu>#listMenuFE>li:nth-child(9n+5),
#listMenu>#listMenuFE>li:nth-child(9n+8), #listMenu>#listMenuFE>li:nth-child(9n+9)
{
	width:14%;
}

</style>
<body>
	<div id="adminPage">
		<%@ include file="/WEB-INF/views/admin/adminTop.jsp" %>
		<div id="adminMainContent">
		
			<ul id="sideTapFirst">
				<li>
					<div class='menu_img' id="menu1">
						<img src="/img/admin/adminLeftTap1/dash.PNG" class="menu_imgs" id="menu_img_dashBoard" />
						<img src="/img/admin/adminLeftTap1/members_red.PNG" class="menu_imgs" id="menu_img_members" />
						<img src="/img/admin/adminLeftTap1/campList.PNG" class="menu_imgs" id="menu_img_campList" />
						<img src="/img/admin/adminLeftTap1/addCamperList.PNG" class="menu_imgs" id="menu_img_addCamperList" />
						<img src="/img/admin/adminLeftTap1/autoCampList.PNG" class="menu_imgs" id="menu_img_autoCampList" />
						<img src="/img/admin/adminLeftTap1/shareList.PNG" class="menu_imgs" id="menu_img_shareList" />
						<img src="/img/admin/adminLeftTap1/reviewList.PNG" class="menu_imgs" id="menu_img_reviewList" />
						<img src="/img/admin/adminLeftTap1/commentList.PNG" class="menu_imgs" id="menu_img_commentList" />
					</div>
				</li>
					
				<li class='menuExpansion'>
					<div class='menu_img' id="menu2">
							<a class="menuATag" href="/admin/adminMain">
								<img src="/img/admin/adminLeftTap2/dashboard_none.PNG" class="menu2right" id="dashboard_img"/>
							</a><img src="/img/admin/adminLeftTap1/dash.PNG" class="menu2left" id="menu_img_dashBoard" />
							
							<a class="menuATag" href="/admin/adminMembers">
								<img src="/img/admin/adminLeftTap2/members_bold.PNG" class="menu2right" id="members_img"/>
							</a><img src="/img/admin/adminLeftTap1/members_red.PNG" class="menu2left" id="menu_img_members" />
							
							<a class="menuATag" href="/admin/adminCampList">
								<img src="/img/admin/adminLeftTap2/campList_none.PNG" class="menu2right" id="campList_img"/>
							</a><img src="/img/admin/adminLeftTap1/campList.PNG" class="menu2left" id="menu_img_campList" />
							
							<a class="menuATag" href="/admin/adminAddCamperList">
								<img src="/img/admin/adminLeftTap2/addCamperList_none.PNG" class="menu2right" id="addCamperList_img"/>
							</a><img src="/img/admin/adminLeftTap1/addCamperList.PNG" class="menu2left" id="menu_img_addCamperList" />
							
							<a class="menuATag" href="/admin/adminAutoCampList">
								<img src="/img/admin/adminLeftTap2/autoCampList_none.PNG" class="menu2right" id="autoCampList_img"/>
							</a><img src="/img/admin/adminLeftTap1/autoCampList.PNG" class="menu2left" id="menu_img_autoCampList" />
							
							<a class="menuATag" href="/admin/adminShareList">
								<img src="/img/admin/adminLeftTap2/shareList_none.PNG" class="menu2right" id="shareList_img"/>
							</a><img src="/img/admin/adminLeftTap1/shareList.PNG" class="menu2left" id="menu_img_shareList" />
							
							<a class="menuATag" href="/admin/adminReviewList">
								<img src="/img/admin/adminLeftTap2/reviewList_none.PNG" class="menu2right" id="reviewList_img"/>
							</a><img src="/img/admin/adminLeftTap1/reviewList.PNG" class="menu2left" id="menu_img_reviewList" />
							
							<a class="menuATag" href="" onclick="javascript:caution()">
								<img src="/img/admin/adminLeftTap2/commentList_none.PNG" class="menu2right" id="commentList_img"/>
							</a><img src="/img/admin/adminLeftTap1/commentList.PNG" class="menu2left" id="menu_img_commentList" />
					</div>
				</li>
			</ul>
			<div id="adminMainContentTop">
				<!-- <hr id="hr2px_red"> -->
				회원목록
			</div>
			<hr id="hr2px">
				<div class="containerList">
					
					<table class="table">
						<h2>기본정보</h2>
						<tr>
							<th class="leftTH_main" style="border-top:none;"></th>
							<th class="rightTH_main" style="border-top:none;">
						</tr>
						<tr>
							<th class="leftTH" style="border-top:none;" >아이디</th>
							<th class="rightTH" style="border-top:none;">${infoVO.userid}</th>
						</tr>
						<tr>
							<th class="leftTH" style="border-top:none;">이름</th>
							<th class="rightTH" style="border-top:none;">${infoVO.username}</th>
						</tr>
						<tr>
							<th class="leftTH" style="border-top:none;">닉네임</th>
							<th class="rightTH" style="border-top:none;">${infoVO.nickname}</th>
						</tr>
						<tr>
							<th class="leftTH" style="border-top:none;">비밀번호</th>
							<th class="rightTH" style="border-top:none;">${infoVO.userpwd}</th>
						</tr>
						<tr>
							<th class="leftTH" style="border-top:none;">전화번호</th>
							<th class="rightTH" style="border-top:none;">${infoVO.usertel}</th>
						</tr>
						<tr>
							<th class="leftTH" style="border-top:none;">생년월일</th>
							<th class="rightTH" style="border-top:none;">${infoVO.birth}</th>
						</tr>
						<tr>
							<th class="leftTH" style="border-top:none;">성별</th>
							<th class="rightTH" style="border-top:none;">${infoVO.gender}</th>
						</tr>
						<tr>
							<th class="leftTH" style="border-top:none;">이메일</th>
							<th class="rightTH" style="border-top:none;">${infoVO.email}</th>
						</tr>
						<tr>
							<th class="leftTH" style="border-top:none;">가입일</th>
							<th class="rightTH" style="border-top:none;">${infoVO.joindate}</th>
						</tr>
					</table>
					<table class="table">
						<h2>추가정보</h2>
						<tr>
							<th class="leftTH_main" style="border-top:none;"></th>
							<th class="rightTH_main" style="border-top:none;">
						</tr>
						<tr>
							<th class="leftTH" style="border-top:none;">관리자여부</th>
							<th class="rightTH" style="border-top:none;">${infoVO.isadmin}</th>
						</tr>
						<!-- 
						<tr>
							<th class="leftTH" style="border-top:none;">매너온도</th>
							<th class="rightTH" style="border-top:none;">${infoVO.userscore}</th>
						</tr>
						<tr>
							<th class="leftTH" style="border-top:none;">찜번호</th>
							<th class="rightTH" style="border-top:none;">${infoVO.zzim_zzimno}</th>
						</tr>
						 -->
					</table>
						
				</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/admin/adminBottom.jsp" %>
</body>
</html>