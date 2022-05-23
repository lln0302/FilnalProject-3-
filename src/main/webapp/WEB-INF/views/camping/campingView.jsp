<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b0f683cf3769f84d841b883357269e47&libraries=services"></script>
<link rel="stylesheet" href="/css/camping/campingView.css" type="text/css"/>
<link rel="stylesheet" href="/css/camping/review.css" type="text/css"/>
<script>
	let nickname = "${nickname}";
</script>
<c:set value="${vo[0]}" var="cmmvo"/>
<div id="wrap">	
	<div id="campingTitle">
		<h2>
			<span>
				${cmmvo.facltNm }
			</span>
		</h2>
	</div>
	<div class="gray_bar"></div>
	<div id="siteSection">
		<div class="boxSection">
			<div id="imagebox">
				<img src="${cmmvo.firstImageUrl }">
			</div>
			<div id="infobox">
				<table>
					<colgroup>
						<col style="width:35%;">						
					</colgroup>
					<tbody>
						<c:if test="${cmmvo.addr1 != null || cmmvo.addr2 != null }">
							<tr>
								<th scope="col">주소</th>
									<td>${cmmvo.addr1}  ${cmmvo.addr2 } </td>
							</tr>
						</c:if>
						<c:if test="${cmmvo.tel != null}">
							<tr>
								<th scope="col">문의처</th>
								<td>${cmmvo.tel }</td>
							</tr>
						</c:if>
						<c:if test="${cmmvo.lctCl != null}">
							<tr>
								<th scope="col">캠핑장 환경</th>
								<td>${cmmvo.lctCl }</td>
							</tr>
						</c:if>
						<c:if test="${cmmvo.induty != null}">
							<tr>
								<th scope="col">캠핑장 유형</th>
								<td>${cmmvo.induty }</td>
							</tr>
						</c:if>
						<c:if test="${cmmvo.operPdCl != null}">
							<tr>
								<th scope="col">운영기간</th>
								<td>${cmmvo.operPdCl }</td>
							</tr>
						</c:if>
						<c:if test="${cmmvo.operDeCl != null}">
							<tr>
								<th scope="col">운영일</th>
								<td>${cmmvo.operDeCl }</td>
							</tr>
						</c:if>
						<c:if test="${cmmvo.homepage != null}">
							<tr>
								<th scope="col">홈페이지</th>
								<td><a href="${cmmvo.homepage }">홈페이지 바로가기</a></td>
							</tr>
						</c:if>
						<c:if test="${cmmvo.resveCl != null}">
							<tr>
								<th scope="col">예약방법</th>
								<td>${cmmvo.resveCl }</td>								
							</tr>
						</c:if>
						<c:if test="${cmmvo.posblFcltyCl != null}">
							<tr>
								<th scope="col">주변이용가능시설</th>
								<td>${cmmvo.posblFcltyCl }</td>
							</tr>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<div id="contents">
		<ul class="contents_Select">
			<li class="contents_SelectBtn"><a href="#" class="campIntro" onclick=clickIntro()>캠핑장 소개</a></li>			
			<li class="contents_SelectBtn"><a href="#" class="campMap" onclick=clickMap()>위치/주변정보</a></li>
			<li class="contents_SelectBtn"><a href="#" class="campReview" onclick=clickReview()>캠핑 & 여행후기</a></li>					
		</ul>
		<!-- 캠핑장 소개 -->
		<div class="campIntro" id="campIntro" style="display:block;">
			<h2 class="h2">전경 이미지</h2>
				<div class="campIntro_image" id="campIntro_image">
					<ul>
						<c:forEach var="itmvo" items="${vo }">

							<li class="img_box"><img src="${itmvo.imageUrl }" onclick="window.open(this.src)"
								style="width:100%; height:100%; object-fit:cover; cursor:pointer;"></li>
						</c:forEach>
					</ul>
				</div>				
			<p class="campIntro_txt">
				<span>${cmmvo.intro }</span>
			</p>	
			<h2>캠핑장 시설정보</h2>
			<div class="campGuide_item">				
				<c:if test="${cmmvo.sbrsCl != ''}">									
					<ul>
						<li>${cmmvo.sbrsCl }</li>
					</ul>
				</c:if>
				<c:if test="${cmmvo.posblFcltyCl != ''}">
					<ul>
						<li>${cmmvo.posblFcltyCl}</li>
					</ul>
				</c:if>
				<c:if test="${cmmvo.animalCmgCl != ''}">
					<ul>
						<li>${cmmvo.animalCmgCl }</li>
					</ul>
				</c:if>	
			</div>							
			<p class="campIntro_txt">
				<span class="info_notice">
					&nbsp;* 멀캠핑에 등록된 정보는 현장상황과 다소 다를 수 있으니 
					<span class="info_f_red">반려동물 동반 여부, 부가 시설물, 추가차량</span> 
					등 원활한 캠핑을 위해 꼭 필요한 사항은 해당 캠핑장에 미리 확인하시기 바랍니다.
				</span> 
			</p>	
		</div>
		<!-- 위치/주변정보 -->	
		<div class="campMap" id="campMap" style="display:none;">
			<h2>위치/주변정보</h2>
			<div id="map" style="width:1200px;height:500px;"></div>	
		</div>
		<!-- 캠핑후기 -->
		<div id="campReview"></div>
	</div><!-- contents -->
</div><!-- wrap -->	
<%@ include file="/WEB-INF/views/camping/modal.jsp" %>
<script>
   Listupcampingimages(${cmmvo.contentId});      
</script>
<script src="/js/camping/campingView.js"></script>
<script src="/js/camping/campingMap.js"></script>