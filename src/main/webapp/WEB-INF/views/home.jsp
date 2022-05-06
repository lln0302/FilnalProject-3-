<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
 			sectionsColor: ['#f2f2f2', '#4BBFC3', '#7BAABE', 'whitesmoke', '#000'],		 
		});
	});
</script>



<nav class="home__nav">
	<ul class="h__myMenu">
		<li data-menuanchor="section1" class="menu1"><a href="#section1">SEARCH
			<ul class="h__menu1__s h__submenu">
				<li data-menuanchor="section2"><a href="#section2">camping list</a></li>
				<li data-menuanchor="section3"><a href="#section3">hash tag</a></li>
				<li data-menuanchor="section4"><a href="#section4">recommend</a></li>
			</ul>
		</li>
		<li data-menuanchor="section1" class="menu2"><a href="#section1">CAMPING TOGETHER
			<ul class="h__menu2__s h__submenu">
				<li data-menuanchor="section2"><a href="#section2">car camping</a></li>
				<li data-menuanchor="section3"><a href="#section3">camping supplies</a></li>
				<li data-menuanchor="section4"><a href="/gather/gatherList">gather people</a></li>
			</ul>
		</li>
	</ul>
</nav>


<main id="fullpage">
	<section class="section demo" id="section1">
		<div class="s1_container">
			<div><img alt="logo" src="/img/logo/mulcamping_logo-05.png" width="160px"></div>
			<h1>ë©ìº íìì <br/> ìº íì ììí´ë³´ì¸ì</h1>
			<input type="button" value="sign in"/>
			<input type="button" value="sign up"/>
	  		<a href="#section2"><span></span>Scroll</a>
  		</div>
	</section>
	
	<section class="section" id="section3">
		<div class="slide">
<!-- 			<h1>ìº íì¥ìë¥¼ ì°¾ìë³´ì¸ì</h1> -->

		<div class='h__card'>
		<a href="#">
			<div class="h__card1">
				<h3 class="h__card1__title">
	              <strong>ìº íì¥ ëë¬ë³´ê¸°</strong><br/>
	              <span>Camping List</span>              
	            </h3>
	            <img alt="thumbnail" src="/img/home/06.png" width="80%">
	            <div class="h__card1__contents">ë°¤ì´ë©´ ë³ì´ ììì§ë <br/> ìº í ì¥ìë¥¼ ì°¾ê³  ê³ì ê°ì? <br/> ê°ê³ ì¶ì ìº í ì¬ì´í¸ë¥¼ ì°¾ìë³´ì¸ì</div>
			</div>
		</a>

		<a href="#">
			<div class="h__card1">
				<h3 class="h__card1__title">
	              <strong>í´ì¬íê·¸ë¡ ìº íì¥ ì°¾ê¸°</strong><br/>
	              <span>hash tag(#)</span>              
	            </h3>
	            <img alt="thumbnail" src="/img/home/04.jpg" width="80%">
	            <div class="h__card1__contents">#ì£¼ì°¨ê° í¸í <br/> #ë¬¼ëì´ íê¸° ì¢ì <br/> #ì¬ì´í¸ ê°ê²©ì´ ëì </div>
			</div>
		</a>
				
		<a href="#">
			<div class="h__card1">
				<h3 class="h__card1__title">
	              <strong>ë©ìº íì´ ì¶ì²íë</strong><br/>
	              <span>recommend</span>              
	            </h3>
	            <img alt="thumbnail" src="/img/home/05.jpg" width="80%">
	            <div class="h__card1__contents">ìì§ ì íì§ ëª»íì¨ëì?<br/> ë©ìº íì´ ì¶ì²íë <br/> ìº íì¥ ë¦¬ì¤í¸ë¥¼ ë³´ì¸ì! </div>
			</div>
		</a>				
		</div>
	</div>

		
		
		<div class="slide" >
			<h3>car camping</h3>
		</div>
		
		<div class="slide">
			<h3>camping supplies</h3>
		</div>
	</section>
	
	<section class="section" id="section4">
		<h2>ì¬ëë¤ì ëª¨ì í¨ê» ìº íì ì¦ê²¨ë³´ì¸ì!</h2>
	</section>
	
	<section class="section fp-auto-height" id="section5">
		<h2>footer</h2>
	</section>
	

</main>

