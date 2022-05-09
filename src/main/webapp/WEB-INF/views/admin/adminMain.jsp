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
.containerPie {
	float:left;
	width: 500px;
	height: 500px;
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
	<div id="adminPage">
		<%@ include file="/WEB-INF/views/admin/adminTop.jsp" %>
		<div id="adminMainContent">
			
			<ul style="z-index:2;">
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
							
							<a class="menuATag" href="/admin/adminCommentList">
								<img src="/img/admin/adminLeftTap2/commentList_none.PNG" class="menu2right" id="commentList_img"/>
							</a><img src="/img/admin/adminLeftTap1/commentList.PNG" class="menu2left" id="menu_img_commentList" />
					</div>
				</li>
			</ul>
			<div id="adminMainContentTop">
				<hr id="hr2px_red">
				대시보드
			</div>
			<hr id="hr2px">
				<div class="containerPie">
					<h4>캠핑장 태그별 사용 통계</h4>
					<canvas id="myChartPie1" width="450" height="450"></canvas>
				</div>
				<div class="containerPie">
					<h4>캠퍼 모집 인원별 모집 통계</h4>
					<canvas id="myChartPie2" width="450" height="450"></canvas>
				</div>
				<div class="containerBar">
					<h4>차박지 지역별 순위 통계</h4>
					<canvas id="myChartBar1" width="950" height="950"></canvas>
				</div>
		</div>
	</div>
	<script>
	var ctx = document.getElementById('myChartPie1');
	var myChartPie1 = new Chart(ctx, {
		type: 'pie',
		data: {
			labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
			datasets: [{
				label: '# of Votes',
				data: [12, 19, 3, 5, 2, 3],
				backgroundColor: [
					'rgba(255, 99, 132, 0.2)',
					'rgba(54, 162, 235, 0.2)',
					'rgba(255, 206, 86, 0.2)',
					'rgba(75, 192, 192, 0.2)',
					'rgba(153, 102, 255, 0.2)',
					'rgba(255, 159, 64, 0.2)'
				],
				borderColor: [
					'rgba(255, 99, 132, 1)',
					'rgba(54, 162, 235, 1)',
					'rgba(255, 206, 86, 1)',
					'rgba(75, 192, 192, 1)',
					'rgba(153, 102, 255, 1)',
					'rgba(255, 159, 64, 1)'
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
			labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
			datasets: [{
				label: '# of Votes',
				data: [12, 19, 3, 5, 2, 3],
				backgroundColor: [
					'rgba(255, 99, 132, 0.2)',
					'rgba(54, 162, 235, 0.2)',
					'rgba(255, 206, 86, 0.2)',
					'rgba(75, 192, 192, 0.2)',
					'rgba(153, 102, 255, 0.2)',
					'rgba(255, 159, 64, 0.2)'
				],
				borderColor: [
					'rgba(255, 99, 132, 1)',
					'rgba(54, 162, 235, 1)',
					'rgba(255, 206, 86, 1)',
					'rgba(75, 192, 192, 1)',
					'rgba(153, 102, 255, 1)',
					'rgba(255, 159, 64, 1)'
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
			labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
			datasets: [{
				label: '# of Votes',
				data: [12, 19, 3, 5, 2, 3],
				backgroundColor: [
					'rgba(255, 99, 132, 0.2)',
					'rgba(54, 162, 235, 0.2)',
					'rgba(255, 206, 86, 0.2)',
					'rgba(75, 192, 192, 0.2)',
					'rgba(153, 102, 255, 0.2)',
					'rgba(255, 159, 64, 0.2)'
				],
				borderColor: [
					'rgba(255, 99, 132, 1)',
					'rgba(54, 162, 235, 1)',
					'rgba(255, 206, 86, 1)',
					'rgba(75, 192, 192, 1)',
					'rgba(153, 102, 255, 1)',
					'rgba(255, 159, 64, 1)'
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
</body>
</html>