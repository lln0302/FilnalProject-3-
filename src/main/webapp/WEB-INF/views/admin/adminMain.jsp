<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet" href="/css/admin/adminMain.css" type="text/css" />
<link rel="stylesheet" href="/css/base.css" type="text/css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script async src='/cdn-cgi/bm/cv/669835187/api.js'></script>
<script type="text/javascript" src="/js/admin/adminSideTab.js"></script>
<script type="text/javascript" src="/js/admin/adminAlert.js"></script>


<style>
.containerPie {
	float:left;
	width: 500px;
	height: 600px;
	border: 1px solid #ddd;
	padding: 10px;
	border-radius: 4px;
}
.containerBar {
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
</style>

<body>
	<div>
	<div id="adminPage" style="height:1820px;">
		<%@ include file="/WEB-INF/views/admin/adminTop.jsp" %>
		<div id="adminMainContent" style="height:1720px">
			
			<ul id="sideTapFirst">
				<li>
					<div class='menu_img' id="menu1">
						<img src="/img/admin/adminLeftTap1/dash_red.PNG" class="menu_imgs" id="menu_img_dashBoard" />
						<img src="/img/admin/adminLeftTap1/members.PNG" class="menu_imgs" id="menu_img_members" />
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
								<img src="/img/admin/adminLeftTap2/dashboard_bold.PNG" class="menu2right" id="dashboard_img"/>
							</a><img src="/img/admin/adminLeftTap1/dash_red.PNG" class="menu2left" id="menu_img_dashBoard" />
							
							<a class="menuATag" href="/admin/adminMembers">
								<img src="/img/admin/adminLeftTap2/members_none.PNG" class="menu2right" id="members_img"/>
							</a><img src="/img/admin/adminLeftTap1/members.PNG" class="menu2left" id="menu_img_members" />
							
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
				<!-- <hr id="hr2px_red">-->
				대시보드
			</div>
			<hr id="hr2px">
			<div id="chartJScontents">
				<div class="containerPie">
					<h4>캠핑장 태그별 사용 통계</h4>
					<canvas id="myChartPie1" width="450" height="550"></canvas>
				</div>
				<div class="containerPie">
					<h4>캠퍼 모집 인원별 모집 통계</h4>
					<canvas id="myChartPie2" width="450" height="550"></canvas>
				</div>
				<div class="containerBar">
					<h4>차박지 지역별 순위 통계</h4>
					<canvas id="myChartBar1" width="950" height="950"></canvas>
				</div>
			</div>
		</div>
	</div>
	
	<script>
	var ctx = document.getElementById('myChartPie1');
	var myChartPie1 = new Chart(ctx, {
		type: 'pie',
		data: {
			labels: ['반려견동반', '온수', '전기',
					 '수영장', '무선인터넷', '마트',
					 '놀이터', '운동장', '낚시',
					 '해수욕', '봄', '여름',
					 '가을', '겨울'],
			datasets: [{
				label: '# of Votes',
				data: [${atvo.tagAnimal}, ${atvo.tagHotwater}, ${atvo.tagElectric},
					   ${atvo.tagPool}, ${atvo.tagWifi}, ${atvo.tagMart},
					   ${atvo.tagPlayGround}, ${atvo.tagGym}, ${atvo.tagFishing},
					   ${atvo.tagBeach}, ${atvo.tagSpring}, ${atvo.tagSummer},
					   ${atvo.tagFall}, ${atvo.tagwinter}],
				backgroundColor: [
					'rgba(241, 95, 95, 0.2)',
					'rgba(255, 0, 0, 0.2)',
					'rgba(255, 94, 0, 0.2)',
					'rgba(255, 187, 0, 0.2)',
					'rgba(255, 228, 0, 0.2)',
					'rgba(171, 242, 0, 0.2)',
					'rgba(29, 219, 22, 0.2)',
					'rgba(0, 216, 255, 0.2)',
					'rgba(0, 84, 255, 0.2)',
					'rgba(1, 0, 255, 0.2)',
					'rgba(95, 0, 255, 0.2)',
					'rgba(255, 0, 221, 0.2)',
					'rgba(255, 0, 127, 0.2)',
					'rgba(255, 178, 217, 0.2)'
				],
				borderColor: [
					'rgba(241, 95, 95, 1)',
					'rgba(255, 0, 0, 1)',
					'rgba(255, 94, 0, 1)',
					'rgba(255, 187, 0, 1)',
					'rgba(255, 228, 0, 1)',
					'rgba(171, 242, 0, 1)',
					'rgba(29, 219, 22, 1)',
					'rgba(0, 216, 255, 1)',
					'rgba(0, 84, 255, 1)',
					'rgba(1, 0, 255, 1)',
					'rgba(95, 0, 255, 1)',
					'rgba(255, 0, 221, 1)',
					'rgba(255, 0, 127, 1)',
					'rgba(255, 178, 217, 1)'
				],
				borderWidth: 1
			}]
		},
		options: {
			responsive: false,
			scales: {
				yAxes: [{
					ticks: {
						beginAtZero: true
					}
				}]
			},
		}
	});
	var ctx = document.getElementById('myChartPie2');
	var myChartPie2 = new Chart(ctx, {
		type: 'pie',
		data: {
			labels: ['1명', '2명', '3명',
					 '4명', '5명', '6~9명',
					 '10명 이상'],
			datasets: [{
				label: '# of Votes',
				data: [${atvo.tagOne}, ${atvo.tagTwo}, ${atvo.tagThree},
					   ${atvo.tagFour}, ${atvo.tagFive}, ${atvo.tagSixMoreThan},
					   ${atvo.tagTenMoreThan}],
				backgroundColor: [
					'rgba(255, 0, 0, 0.2)',
					'rgba(255, 94, 0, 0.2)',
					'rgba(255, 228, 0, 0.2)',
					'rgba(29, 219, 22, 0.2)',
					'rgba(0, 84, 255, 0.2)',
					'rgba(1, 0, 255, 0.2)',
					'rgba(95, 0, 255, 0.2)'
				],
				borderColor: [
					'rgba(255, 0, 0, 1)',
					'rgba(255, 94, 0, 1)',
					'rgba(255, 228, 0, 1)',
					'rgba(29, 219, 22, 1)',
					'rgba(0, 84, 255, 1)',
					'rgba(1, 0, 255, 1)',
					'rgba(95, 0, 255, 1)'
				],
				borderWidth: 1
			}]
		},
		options: {
			responsive: false,
			scales: {
				yAxes: [{
					ticks: {
						beginAtZero: true
					}
				}]
			},
		}
	});
	var ctx = document.getElementById('myChartBar1');
	var myChartBar1 = new Chart(ctx, {
		type: 'bar',
		data: {
			labels: ['서울', '경기', '강원',
					 '충북', '충남', '전북',
					 '전남', '경북', '경남',
					 '제주'],
			datasets: [{
				label: '',
				data: [${atvo.tagSeoul}, ${atvo.tagGyunggy}, ${atvo.tagGangwon},
					   ${atvo.tagChoongbook}, ${atvo.tagChoongnam}, ${atvo.tagJeonbook},
					   ${atvo.tagJeonnam},${atvo.tagGyeongbook}, ${atvo.tagGyeongnam},
					   ${atvo.tagJeju}],
				backgroundColor: [
					'rgba(255, 0, 0, 0.2)',
					'rgba(255, 94, 0, 0.2)',
					'rgba(255, 228, 0, 0.2)',
					'rgba(29, 219, 22, 0.2)',
					'rgba(0, 84, 255, 0.2)',
					'rgba(1, 0, 255, 0.2)',
					'rgba(95, 0, 255, 0.2)'
				],
				borderColor: [
					'rgba(255, 0, 0, 1)',
					'rgba(255, 94, 0, 1)',
					'rgba(255, 228, 0, 1)',
					'rgba(29, 219, 22, 1)',
					'rgba(0, 84, 255, 1)',
					'rgba(1, 0, 255, 1)',
					'rgba(95, 0, 255, 1)'
				],
				borderWidth: 1
			}]
		},
		options: {
			responsive: false,
			scales: {
				yAxes: [{
					ticks: {
						beginAtZero: true
					}
				}]
			},
		}
	});
</script>
</div>
<%@ include file="/WEB-INF/views/admin/adminBottom.jsp" %>
</body>
</html>