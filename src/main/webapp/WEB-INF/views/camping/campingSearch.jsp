<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://kit.fontawesome.com/76aefe2b67.js"></script>
<script src="/js/camping/campingSearch.js"></script>
<link rel="stylesheet" href="/css/camping/campingSearch.css" type="text/css"/>

<div class="container">
	<div class="campingSearch" style="overflow:auto;">	
		<div id ="searchbox" class="searchbox" style="display:block;">	
			<form id="serachForm" action="/camping/campingSearch" method="get">
			<div>
				<div class="C_SearchBtnWrap">
					<button class=" detail" type="button">상세검색</button>			
					<button class=" tag_search" type="button" onclick="tagSearch()">
						<span>태그로 검색</span>
					</button>					
				</div>
				<div class="C_select">
					<div>				
						<ul>
							<li >	
								<strong style="margin-right:5px; font-size:18px; ">지역</strong>							
								<select id="sido" name="doNm" onchange="changeSido()"></select>							
								<select id="gungu" name="sigunguNm" onchange="changeGungu()"></select>								
								<button id="C_detail" class="C_detail" type="button" onclick="Displaydetail()">상세 조건 +</button>
							</li>
						</ul>
					</div>
					<div class="btn-group-toggle" data-toggle="buttons" id="search_detail" style="display:none; margin-top: 10px;">
						<ul>					
							<li>
								<strong>주요 시설</strong>
								<label class="btn btn-warning"><input type="checkbox" name="induty" value="일반야영장">일반야영장</label>
								<label class="btn btn-warning"><input type="checkbox" name="induty" value="자동차야영장">자동차야영장</label>
								<label class="btn btn-warning"><input type="checkbox" name="induty" value="카라반">카라반</label>
								<label class="btn btn-warning"><input type="checkbox" name="induty" value="글램핑">글램핑</label>
							</li>						
							<li>
								<strong>부대시설</strong>
								<label class="btn btn-warning"><input type="checkbox" name="sbrsCl" value="전기">전기</label>
								<label class="btn btn-warning"><input type="checkbox" name="sbrsCl" value="무선인터넷">무선인터넷</label>
								<label class="btn btn-warning"><input type="checkbox" name="sbrsCl" value="장작판매">장작판매</label>
								<label class="btn btn-warning"><input type="checkbox" name="sbrsCl" value="온수">온수</label>
								<label class="btn btn-warning"><input type="checkbox" name="sbrsCl" value="마트.편의점">마트.편의점</label>						
							</li>												
						</ul>
					</div>
				</div>				
				<div>
					<button id="searchCampinginfo" class="C_search" type="submit">캠핑장 검색</button>
				</div>				
			</div>	
			</form>
		</div>
		
		<div id="tagSearch" class="tagSearch" style="display:none;">
			<form id="serachForm" action="/camping/campingTag" method="get">
				<div>
					<div class="C_SearchBtnWrap">
					<button class=" detail" type="button" onclick="detailSearch()">상세검색</button>			
					<button class=" tag_search" type="button">
						<span>태그로 검색</span>
					</button>					
				</div>
				<div class="btn-group-toggle" data-toggle="buttons" style="margin-top: 10px;">
					<ul>				
						<li>
							<label class="btn btn-dark"><input class="tagBtn" type="checkbox" name="animalCmgCl" value="반려견동반">#반려견동반</label>							
							<label class="btn btn-dark"><input class="tagBtn" type="checkbox" name="sbrsCl" value="온수">#온수</label>
							<label class="btn btn-dark"><input class="tagBtn" type="checkbox" name="sbrsCl" value="전기">#전기</label>
							<label class="btn btn-dark"><input class="tagBtn" type="checkbox" name="sbrsCl" value="물놀이장">#물놀이장</label>
							<label class="btn btn-dark"><input class="tagBtn" type="checkbox" name="sbrsCl" value="무선인터넷">#무선인터넷</label>
							<label class="btn btn-dark"><input class="tagBtn" type="checkbox" name="sbrsCl" value="마트.편의점">#마트.편의점</label>							
						</li>
						<li>
							<label class="btn btn-dark"><input class="tagBtn" type="checkbox" name="sbrsCl" value="놀이터">#놀이터</label>
							<label class="btn btn-dark"><input class="tagBtn" type="checkbox" name="sbrsCl" value="운동장">#운동장</label>
							<label class="btn btn-dark"><input class="tagBtn" type="checkbox" name="posblFcltyCl" value="낚시">#낚시</label>
							<label class="btn btn-dark"><input class="tagBtn" type="checkbox" name="posblFcltyCl" value="해수욕">#해수욕</label>
							<label class="btn btn-dark"><input class="tagBtn" type="checkbox" name="operPdCl" value="봄">#봄</label>
							<label class="btn btn-dark"><input class="tagBtn" type="checkbox" name="operPdCl" value="여름">#여름</label>
							<label class="btn btn-dark"><input class="tagBtn" type="checkbox" name="operPdCl" value="가을">#가을</label>
							<label class="btn btn-dark"><input class="tagBtn" type="checkbox" name="operPdCl" value="겨울">#겨울</label>																				
						</li>																		
					</ul>
				</div>				
				<div>
					<button id="searchCampinginfo" class="C_search" type="submit">캠핑장 검색</button>
				</div>	
				</div>
			</form>
		</div>
		<div id ="searchBoxunderline"></div>
		<div class = "campingListShow" id="camping">		
			<ul class="campingSearch">
				<c:forEach var="vo" items="${list }">										
					<div class="container p-3 my-3 border listBox">
						<div class="row">
							<div id="campingSite">						
								<a href='/camping/campingView?contentId=${vo.contentId}'>
									<div id="imageBox" class="col-4">
										<c:if test="${vo.firstImageUrl == null }">
											<img src="/img/camping/autumn-season-5580627__340.webp" style="width:250px; height:183.33px;">
										</c:if>
										<c:if test="${vo.firstImageUrl != null}">
											<img src="${vo.firstImageUrl}" style="width:250px; height:183.33px;">
										</c:if>
									</div>
								</a>
							</div>
							<div class="col-8">
								<a id="campinglink" href="/camping/campingView?contentId=${vo.contentId }">
									<h2>
										<p>
											<c:if test="${vo.sigunguNm == '' }">
												<a id="campinglink" href="/camping/campingView?contentId=${vo.contentId}">[${vo.doNm}]  ${vo.facltNm }</a>
											</c:if>
												<a id="campinglink" href="/camping/campingView?contentId=${vo.contentId}">[${vo.doNm }  ${vo.sigunguNm }] ${vo.facltNm }</a>
										</p>							
									</h2>
								</a>
								<span>
									<c:if test="${vo.lineIntro != null}">
										<strong>${vo.lineIntro }</strong>
									</c:if>		
									</br>															
								</span>								
								<span style="width:700px; height:50px;">
									<a id ="campinglink" href="/camping/campingView?contentId=${vo.contentId }">									
										<c:if test="${vo.intro != null }">
											${vo.intro }
										</c:if>
									</a>	
								</span>
								<p>									
									<c:if test="${vo.addr2 =='' }">
										<li><img src="/img/camping/location.png" style="height:23px; margin-right: 2px;"> ${vo.addr1 }</li>
									</c:if>
										<li><img src="/img/camping/location.png" style="height:23px; margin-right: 2px;"> ${vo.addr1 } ${vo.addr2 }</li>									
								</p>
									<c:if test="${vo.tel != ''}">
										<li><img src="/img/camping/smartphone-call.png" style="height:24px; margin-right: 3px;">  ${vo.tel }</li>
									</c:if>
								</ul>	
							</div>
						</div>
					</div>				
				</c:forEach>								
			</ul>			
		</div>
		<ul class="pagination justify-content-center">
			<c:if test="${pVO.totalRecord > 0 }">
				<li class="page-item prevBtn">
					<a class="page-link" href="javascript:void(0);" onclick="prevBtn(${pVO.pageNum})">
						<i class="fa fa-angle-left"></i>
					</a>
				</li>
				
				<c:forEach var="p" begin="${pVO.startPage}" end="${pVO.startPage+pVO.onePageCount-1}">
				<c:if test="${p<=pVO.totalPage }">
						<c:choose>
							<c:when test="${p!=pVO.pageNum}">
								<li class="page-item">
									<a class="page-link"href="javascript:void(0);" onclick="pageNum(${p})">${p}</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item disabled"><a class="page-link">${p}</a></li>
							</c:otherwise>
						</c:choose>
				</c:if>				
				</c:forEach>
				
				<li class="page-item nextBtn">
					<a class="page-link" href="javascript:void(0);" onclick="nextBtn(${pVO.pageNum})">
						<i class="fa fa-angle-right"></i>
					</a>
				</li>
			</c:if>
		</ul>
	</div>
</div>