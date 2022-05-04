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
				<li data-menuanchor="section4"><a href="#section4">gather people</a></li>
			</ul>
		</li>
	</ul>
</nav>


<main id="fullpage">
	<section class="section demo" id="section0">
		<div class="s1_container">
			<div><img alt="logo" src="/img/logo/mulcamping_logo-05.png" width="160px"></div>
			<h1>멀캠핑에서 <br/> 캠핑을 시작해보세요</h1>
			<input type="button" value="sign in"/>
			<input type="button" value="sign up"/>
	  		<a href="#section2"><span></span>Scroll</a>
  		</div>
	</section>
	<section class="section">
		<div class="slide">
			<h3>slide 01</h3>
		</div>
		<div class="slide">
			<h3>slide 02</h3>
		</div>
		<div class="slide">
			<h3>slide 03</h3>
		</div>
	</section>
	<section class="section">
		<h2>section 3</h2>
	</section>
	<section class="section">
		<h2>section 4</h2>
	</section>
	<section class="section fp-auto-height">
		<h2>footer</h2>
	</section>
	

</main>

