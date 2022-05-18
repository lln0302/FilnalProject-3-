<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/camping/campingView.css" type="text/css"/>
<link rel="stylesheet" href="/css/camping/review.css" type="text/css"/>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b0f683cf3769f84d841b883357269e47&libraries=services"></script>
<c:set value="${vo[0]}" var="cmmvo"/>
<div id="wrap">
	<script>
		Listupcampingimages(${cmmvo.contentId});	
	</script>
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
				<div id="btn_zzim">										
					<button type="button" class="btn_zzim btn" onclick="">찜하기</button>										
				</div>
			</div>
		</div>
	</div>

	<div id="contents">
		<input type="hidden" id="contentId" value="${cmmvo.contentId}"/>
		<ul class="contents_Select">
			<li class="contents_SelectBtn"><a href="#" class="campIntro" onclick=clickIntro()>캠핑장 소개</a></li>
			<li class="contents_SelectBtn"><a href="#" class="campGuide"onclick=clickGuide()>이용안내</a></li>
			<li class="contents_SelectBtn"><a href="#" class="campMap" onclick=clickMap()>위치/주변정보</a></li>
			<li class="contents_SelectBtn"><a href="#" class="campReview" onclick=clickReview()>캠핑&amp;여행후기</a></li>					
		</ul>
		<!-- 캠핑장 소개 -->
		<div class="campIntro" id="campIntro" style="display:block;">
			<h3 class="icon_h3 mt_50">전경 이미지</h3>
				<div class="campIntro_image" id="campIntro_image">
					<ul>
						<c:forEach var="itmvo" items="${vo }">
							<li class="img_box"><img src="${itmvo.imageUrl }" onclick="window.open(this.src)" style="width:100%; height:100%; object-fit:cover;"></li>
						</c:forEach>
					</ul>
				</div>				
			<p class="campIntro_txt">
				<span>${cmmvo.intro }</span>
			</p>			
			<p class="campIntro_txt">
				<span class="info_notice">
					&nbsp;* 고캠핑에 등록된 정보는 현장상황과 다소 다를 수 있으니 <span class="info_f_red">반려동물 동반 여부, 부가 시설물, 추가차량</span> 등 원활한 캠핑을 위해 꼭 필요한 사항은 해당 캠핑장에 미리 확인하시기 바랍니다.
				</span> 
			</p>					
		</div>
		<!-- 이용안내 -->
		<div class="campGuide" id="campGuide" style="display:none;">
			<h3 class="h3">캠핑장 시설정보</h3>
			<div class="campGuide_item">
				<c:if test="${cmmvo.sbrsCl != ''}">									
					<ul>
						<li>${cmmvo.sbrsCl }</li>		
						<li>${cmmvo.posblFcltyCl }</li>
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
		</div>
		<!-- 위치/주변정보 -->
		<div class="campMap" id="campMap" style="display:none;">
			<div id="map" style="width:100%;height:350px;"></div>	
		</div>
		<!-- 캠핑후기 -->
		<div id="campReview" style="display:none;">
		</div><!-- review -->
	</div><!-- contents -->
</div><!-- wrap -->
<!-- modal -->
<div class="modal fade" id="myModal">
	<div class="modal-dialog modal-dialog-centered">
		<!-- Modal content -->
		<div class="modal-content">
			<div class="modal-header">
				<h3 id="modal-title" class="modal-title">후기 글</h3>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			
			<div class="modal-body">
				<div>
					<h5>추천</h5><hr/>
					 <input type="radio" id="recommend" name="recommend" value="추천">
     				 <label for="추천"><i class='fa fa-thumbs-up'></i>&nbsp;추천</label>
     				 <input type="radio" id="recommend" name="recommend" value="비추천">
     				 <label for="비추천"><i class='fa fa-thumbs-down'></i>&nbsp;비추천</label>
				</div>
				<br/>
				<div>
					<h5>후기</h5><hr/>
					<textarea class="form-control" id="content" name="content" rows="5" placeholder="캠핑장의 장단점과 솔직한 후기를 남겨주세요"></textarea>
				</div>
			</div>
			
			<div class="modal-footer">
				<button type="button" id="modalSubmit" class="btn">등록</button>
				<button type="button" data-dismiss="modal" id="modalClose" class="btn">닫기</button>
			</div>
		</div><!-- modal-content -->
	</div><!-- modal-dialog -->
</div>
<script src="/js/camping/review.js"></script>
<script src="/js/camping/campingView.js"></script>