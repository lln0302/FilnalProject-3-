<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/camping/campingView.css" type="text/css"/>
<link rel="stylesheet" href="/css/camping/review.css" type="text/css"/>
<script src="/js/camping/review.js"></script>
<div id="wrap">
	<div id="campingTitle">
		<h2>
			<span>
				${vo.facltNm}
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
		<input type="hidden" id="contentId" value="${vo.contentId}"/>
		<ul class="contents_Select">
			<li class="contents_Select"><a href="/camping/campingViewIntro" class="campIntro">캠핑장 소개</a></li>
			<li class="contents_Select"><a href="/camping/campingViewGuide" class="campGuide">이용안내</a></li>
			<li class="contents_Select"><a href="/camping/campingViewMap" class="campMap">위치/주변정보</a></li>
			<li class="contents_Select"><a href="javascript:void(0);" class="campReview">캠핑&amp;여행후기</a></li>					
		</ul>
		<div id="review"><!-- 캠핑후기 --></div>
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
		</div>
	</div>
</div><!-- modal -->