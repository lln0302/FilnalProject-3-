<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/camping/campingView.css" type="text/css"/>

<div id="wrap">
	<div id="campingTitle">
		<h2>
			<span>
				${vo.facltNm }
			</span>
		</h2>
	</div>
	<div class="gray_bar"></div>
	<div id="siteSection">
		<div class="boxSection">
			<div id="imagebox">
				<img src="${vo.firstImageUrl }">
			</div>
			<div id="infobox">
				<table>
					<colgroup>
						<col style="width:35%;">						
					</colgroup>
					<tbody>
						<c:if test="${vo.addr1 != null || vo.addr2 != null }">
							<tr>
								<th scope="col">주소</th>
									<td>${vo.addr1}  ${vo.addr2 } </td>
							</tr>
						</c:if>
						<c:if test="${vo.tel != null}">
							<tr>
								<th scope="col">문의처</th>
								<td>${vo.tel }</td>
							</tr>
						</c:if>
						<c:if test="${vo.lctCl != null}">
							<tr>
								<th scope="col">캠핑장 환경</th>
								<td>${vo.lctCl }</td>
							</tr>
						</c:if>
						<c:if test="${vo.induty != null}">
							<tr>
								<th scope="col">캠핑장 유형</th>
								<td>${vo.induty }</td>
							</tr>
						</c:if>
						<c:if test="${vo.operPdCl != null}">
							<tr>
								<th scope="col">운영기간</th>
								<td>${vo.operPdCl }</td>
							</tr>
						</c:if>
						<c:if test="${vo.operDeCl != null}">
							<tr>
								<th scope="col">운영일</th>
								<td>${vo.operDeCl }</td>
							</tr>
						</c:if>
						<c:if test="${vo.homepage != null}">
							<tr>
								<th scope="col">홈페이지</th>
								<td><a href="${vo.homepage }">홈페이지 바로가기</a></td>
							</tr>
						</c:if>
						<c:if test="${vo.resveCl != null}">
							<tr>
								<th scope="col">예약방법</th>
								<td>${vo.resveCl }</td>								
							</tr>
						</c:if>
						<c:if test="${vo.posblFcltyCl != null}">
							<tr>
								<th scope="col">주변이용가능시설</th>
								<td>${vo.posblFcltyCl }</td>
							</tr>
						</c:if>
					</tbody>
				</table>								
				<div id="btn_zzim">										
					<button type="button" class="btn_zzim btn" onclick="">찜하기</button>										
				</div>
			</div>
		</div>
	</div>

	<div id="contents">
		<ul class="contents_Select">
			<li class="contents_Select"><a href="/camping/campingViewIntro" class="campIntro">캠핑장 소개</a></li>
			<li class="contents_Select"><a href="/camping/campingViewGuide" class="campGuide">이용안내</a></li>
			<li class="contents_Select"><a href="/camping/campingViewMap" class="campMap">위치/주변정보</a></li>
			<li class="contents_Select"><a href="javascript:void(0);" class="campReview">캠핑&amp;여행후기</a></li>					
		</ul>
	<script>
	$(function(){

		// 후기 작성 
		$(".campReview").click(function(){
			alert("후기를 작성하면 리스트가 보입니다.");
			
		});
		
	});
	</script>
		<div>
		
		</div>
		<div>
		
		</div>
		<div>
		
		</div>
		<div class="review">
			<h3 style="text-align:center">캠핑 후기</h3>
			<div class="container p-3 my-3 border list">
				 <table class="table table-striped text-center">
					<thead>
						<tr>
							<th class="text-center">닉네임</th>
							<th class="text-center">후기</th>
							<th class="text-center">작성날짜</th>
							<th class="text-center"><i class="fa fa-thumbs-up"></i> /
													<i class="fa fa-thumbs-down"></i></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>지향 리</td>
							<td>깨끗하고 불멍하기 좋은 캠핑장ㄱ숑ㅅ곡소곳공ㄱ속솟ㅇ곡송공ㅅ</td>
							<td>2022-04-15</td>
							<td><i class="fa fa-thumbs-up"></i></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>