<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/css/gather/list.css" type="text/css"/>
<script src="https://kit.fontawesome.com/76aefe2b67.js"></script>
<script src="/js/gather/list.js"></script>
<script>
	$(function(){
		
		// 페이징
		if('${pvo.currentPage}'==1){
			$('.prevBtn').addClass('prevBtn disabled');
		}
		
		if('${pvo.currentPage}'=='${pvo.totalPages}'){
			$('.nextBtn').addClass('disabled');
		}
		
	});
</script>
<div class="container gatherList">
	<h1>캠핑 같이 해볼래요?</h1>
	<div class="col-12 write">
		<a href="/gather/gatherWrite"><i class="fa fa-pen writeBtn fa-lg"></i></a>
	</div>
	<c:forEach var="list" items="${list}">
	<div id="list">
		<div class="container p-3 my-3 border listBox">
		  	<ul>
		  		<li>
		  			<a href="/gather/gatherView?gatherno=${list.gatherno}"><span id="camperTitle">${list.title}</span></a>
		  			<span id="camperName">${list.nickname}</span>
		  		</li>
			  	<li id="listBody">
			  		<div class="row">
				  		<div class="col-6 listContent">
				  			<div><h5><i class="fa fa-location-arrow"></i> ${list.place}</h5></div>
				  			<div><h5><i class="fa fa-calendar"></i> ${list.startdate} ~ ${list.enddate}</h5></div>
				  			<div><h5> ${list.gnewno} / ${list.gmemberno}</h5></div>
				  			<div>
				  				<i class="fa fa-eye fa-lg"></i> ${list.views}&nbsp; 
				  				<i class="fa fa-clock fa-lg"></i> ${list.createdate}
				  			</div>
				  		</div>
				  		<div class="col-6">
				  			<a href="/gather/gatherView?gatherno=${list.gatherno}"><img src="/img/logo/mulcamping_logo-03.png"/></a>
				  		</div>	
			  		</div>
			  	</li>
		 	</ul>
		</div>
	</div><!-- list-->
	</c:forEach>
	<ul class="pagination justify-content-center">
		<li class="page-item prevBtn">
			<a class="page-link" href="javascript:void(0);" onclick="prevBtn(${pvo.currentPage})">
				<i class="fa fa-angle-left"></i>
			</a>
		</li>
		<c:forEach var="p" begin="${pvo.startPage}" end="${pvo.totalPages}">
				<c:choose>
					<c:when test="${p!=pvo.currentPage}">
						<li class="page-item">
							<a class="page-link"href="javascript:void(0);" onclick="currentPage(${p})">${p}</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item disabled"><a class="page-link">${p}</a></li>
					</c:otherwise>
				</c:choose>
		</c:forEach>
		<li class="page-item nextBtn">
			<a class="page-link" href="javascript:void(0);" onclick="nextBtn(${pvo.currentPage})">
				<i class="fa fa-angle-right"></i>
			</a>
		</li>
	</ul>
</div>
