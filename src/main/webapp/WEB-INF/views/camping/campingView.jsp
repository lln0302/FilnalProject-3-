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
					<button type="button" class="btn_zzim" onclick="">찜하기</button>										
				</div>
			</div>
		</div>
	</div>
	<div id="contents">
		<ul class="contents_Select">
			<li class="contents_Select"><a href="/camping/campingViewIntro" class="camp_intro">캠핑장 소개</a></li>
			<li class="contents_Select"><a href="/camping/campingViewGuide" class="camp_guide">이용안내</a></li>
			<li class="contents_Select"><a href="/camping/campingViewMap" class="camp_map">위치/주변정보</a></li>
			<li class="contents_Select"><a href="/camping/campingViewReview" class="camp_review">캠핑&amp;여행후기</a></li>					
		</ul>
		<div class="camp_intro">
			<ul>
				<li class="col_03 img_box">
					
				</li>
				<li class="col_03 img_box"></li>
				<li class="col_03 img_box"></li>				
			</ul>
		</div>
	</div>
</div>