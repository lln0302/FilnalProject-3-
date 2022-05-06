<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/css/gather/list.css" type="text/css"/>
<script src="https://kit.fontawesome.com/76aefe2b67.js"></script>
<div class="container gatherList">
	<h1>캠핑 같이 해볼래요?</h1>
	<div class="col-12">
		<a href="/gather/gatherWrite"><i class="fa fa-pen writeBtn"></i></a>
	</div>
		<div id="list">
			<div class="container p-3 my-3 border listBox">
			  	<ul>
			  		<li>
			  			<a href="/gather/gatherView"><span id="camperTitle">00 캠핑장 갈 캠퍼 모집합니다.</span></a>
			  			<span id="camperName">캠핑러버</span>
			  		</li>
				  	<li id="listBody">
				  		<div class="row">
					  		<div class="col-6 listContent">
					  			<div><h5><i class="fa fa-location-arrow"></i> 전라북도 순천시 00 캠핑장</h5></div>
					  			<div><h5><i class="fa fa-calendar"></i> 2022/04/26 ~ 2022/04/27</h5></div>
					  			<div><h5>1/5</h5></div>
					  			<div>
					  				<i class="fa fa-eye fa-lg"></i> 1 
					  				<i class="fa fa-clock fa-lg"></i> 2022-05-02
					  			</div>
					  		</div>
					  		<div class="col-6">
					  			<a href="/gather/gatherView"><img src="/img/logo/mulcamping_logo-03.png"/></a>
					  		</div>	
				  		</div>
				  	</li>
			 	</ul>
			</div>
			<hr/>
		</div><!-- list-->
		<ul class="pagination justify-content-center" id="paging">
			<li class="page-item"><a class="page-link" href="javascript:void(0);" id="prevBtn" 
			onclick="goPrev()"><i class="fa fa-angle-left"></i></a></li>
			<li class="page-item"><a class="page-link"href="javascript:void(0);"
			onclick="goPage()">1</a></li>
			<li class="page-item"><a class="page-link"href="javascript:void(0);"
			onclick="goPage()">2</a></li>
			<li class="page-item"><a class="page-link" href="javascript:void(0);" id="nextBtn"
			onclick="goNext()"><i class="fa fa-angle-right"></i></a></li>
		</ul>
</div>
