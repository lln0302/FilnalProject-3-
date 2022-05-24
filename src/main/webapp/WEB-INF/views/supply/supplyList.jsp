<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" href="/css/supply/supplyList.css" type="text/css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">

<script>
	$(function(){
		
		// 페이징 하기
		if('${pvo.currentPage}'==1){
			$('.prevBtn').addClass('prevBtn disabled');
		}
		
		if('${pvo.currentPage}'=='${pvo.totalPages}'){
			$('.nextBtn').addClass('disabled');
		}
		
	});
</script>



<h1>상태는 괜찮은데 쓰지 않게 된 캠핑용품들...</h1>
<h5>이곳에서 다른 사람들과 나눠보세요</h5>

<div class="container">
	<div class="col-12" style="text-align: right">
		<a href="/supply/supplyWrite"><i class="fa fa-pen writeBtn fa-lg"></i></a>
	</div>
	<ul id="spList">
		<c:forEach var="vo" items="${list}" varStatus="status">
			<li><a href="/supply/supplyInfo?no=${vo.supplyno }">
					<div>
						<img src="/img/supply/thumbnailImg/${vo.photo }" id="spListImg" />
						<p id="spTitle">${vo.title }</p>
						<p id="spNick">
							by <b>${vo.nickname }</b>
						</p>
						<div id="spFoot">
							<i class='fas fa-eye'></i> <span id="spView">${vo.views }</span>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <i class='fas fa-comment'></i>
							<span id="spReplyCount">${vo.count }</span><br /> <i
								class="fa fa-clock clock"></i> <span id="spWriteDate">${vo.writedate }</span>
						</div>
					</div>
			</a></li>
		</c:forEach>

	</ul>
	<!-- paging -->
	<ul class="pagination justify-content-center">
		<c:if test="${pvo.totalPages>0}">
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
		</c:if>
	</ul>
</div>

<script src="/js/supply/supplyList.js"></script>