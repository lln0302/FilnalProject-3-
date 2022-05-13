<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/css/home/jquery.fullPage.css">
<link rel="stylesheet" href="/css/home/home.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="/js/home/jquery.fullPage.js"></script>



<script>
	$(document).ready(function() {
		$('#fullpage').fullpage({
			//options here
			navigation: true,
			anchors: ['section1', 'section2', 'section3', 'section4', 'section5'],
 			sectionsColor: ['#f2f2f2', '#4BBFC3', '#7BAABE', 'black'],		 
		});
	});
</script>



<nav class="home__nav">
	<ul class="h__myMenu">
		<li data-menuanchor="section1" class="menu1"><a href="#section1">SEARCH</a>
			<ul class="h__menu1__s h__submenu">
				<li data-menuanchor="section2"><a href="camping/campingSearch">camping list</a></li>
				<li data-menuanchor="section3"><a href="#section3">hash tag</a></li>
				<li data-menuanchor="section4"><a href="#section4">recommend</a></li>
			</ul>
		</li>
		<li data-menuanchor="section1" class="menu2"><a href="#section1">CAMPING TOGETHER</a>
			<ul class="h__menu2__s h__submenu">
				<li data-menuanchor="section2"><a href="/car/carList">car camping</a></li>
				<li data-menuanchor="section3"><a href="/supply/supplyList">camping supplies</a></li>
				<li data-menuanchor="section4"><a href="/gather/gatherList">gather people</a></li>
			</ul>
		</li>
	</ul>
</nav>


<main id="fullpage">
	<section class="section demo" id="section1">
		<div class="s1_container">
			<div><img alt="logo" src="/img/logo/mulcamping_logo-05.png" width="160px"></div>
			<h1>멀캠핑에서 <br/> 캠핑을 시작해보세요</h1>
			<c:if test="${logStatus == 'Y'}">
				<div id="logout">
					<input type="button" value="mypage" onclick="location.href='${url}/member/myPageMain'"/>
					<input type="button" value="logout" onclick="location.href='${url}/member/logout'"/>
				</div>
			</c:if>
			<c:if test="${logStatus != 'Y'}">
				<div id="login">
					<input type="button" value="sign in" onclick="location.href='${url}/member/loginForm'"/>
					<input type="button" value="sign up" onclick="location.href='${url}/member/memberForm'"/>
				</div>
			</c:if>
	  		<a href="#section2"><span></span>Scroll</a>
  		</div>
	</section>
	
	<section class="section" id="section3">
		<div class="slide">
<!-- 			<h1>캠핑장소를 찾아보세요</h1> -->

		<div class='h__card'>
		<a href="#">
			<div class="h__card1">
				<h3 class="h__card1__title">
	              <strong>캠핑장 둘러보기</strong><br/>
	              <span>Camping List</span>              
	            </h3>
	            <img alt="thumbnail" src="/img/home/06.png" width="80%">
	            <div class="h__card1__contents">밤이면 별이 쏟아지는 <br/> 캠핑 장소를 찾고 계신가요? <br/> 가고싶은 캠핑 사이트를 찾아보세요</div>
			</div>
		</a>

		<a href="#">
			<div class="h__card1">
				<h3 class="h__card1__title">
	              <strong>해쉬태그로 캠핑장 찾기</strong><br/>
	              <span>hash tag(#)</span>              
	            </h3>
	            <img alt="thumbnail" src="/img/home/04.jpg" width="80%">
	            <div class="h__card1__contents">#주차가 편한 <br/> #물놀이 하기 좋은 <br/> #사이트 간격이 넓은 </div>
			</div>
		</a>
				
		<a href="#">
			<div class="h__card1">
				<h3 class="h__card1__title">
	              <strong>멀캠핑이 추천하는</strong><br/>
	              <span>recommend</span>              
	            </h3>
	            <img alt="thumbnail" src="/img/home/05.jpg" width="80%">
	            <div class="h__card1__contents">아직 정하지 못하셨나요?<br/> 멀캠핑이 추천하는 <br/> 캠핑장 리스트를 보세요! </div>
			</div>
		</a>				
		</div>
	</div>

		
		
		<div class="slide" >
		<div class='h__card'>
			<a href="${url}/car/carList">
			<div class="h__card2"> 
				<h3 class="h__card2__title">
	              <strong>차박지 공유</strong><br/>
	              <span>car camping</span>              
	            </h3>
	            <img alt="thumbnail" src="/img/home/08.png" width="80%">
	            <div class="h__card2__contents">추억이 가득한 차박장소를 공유해주세요!<br/>뒷처리는 깔끔하게합시다!</div>
			</div>
		</a>				
		</div>
		</div>
		
		
		<div class="slide">
		<div class='h__card'>
			<a href="${url}/supply/supplyList">
			<div class="h__card3">
				<h3 class="h__card3__title">
	              <strong>캠핑용품</strong><br/>
	              <span>camping supplies</span>              
	            </h3>
	            <img alt="thumbnail" src="/img/home/10.jpg" width="80%">
	            <div class="h__card3__contents">안쓰는 캠핑용품<br/>나눔 합시다 :)</div>
			</div>
		</a>				
		</div>
	</div>
	</section>
	
	<section class="section" id="section4">
		<video id="myVideo" loop muted data-autoplay>
			<source src="/img/home/fire.mp4" type="video/mp4">
		</video>
		<div class="layer">
			<h1>혼자 가기 쓸쓸할땐, <br/> 함께 캠핑을 즐겨보세요. </h1>
				<input type="button" value="함께하기" onclick="location.href='${url}/gather/gatherList'"/>
		</div>
	
	</section>
	
	<section class="section fp-auto-height" id="section5">
		<span style="color: white;">Copyrights(c) 2022 TEAM Campers ALL RIGHTS RESERVED.</span>
	</section>
	

</main>