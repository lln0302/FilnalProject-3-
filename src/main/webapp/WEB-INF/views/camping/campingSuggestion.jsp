<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/camping/campingSuggestion.css" type="text/css"/>

<div id="campingSuggetion">
	<h3 class="h3">[추천 캠핑장] 리스트</h3> 
	<div id ="searchBoxunderline"></div>
		<div class = "campingListShow" id="camping">		
			<ul class="campingSearch">				
				<c:forEach var="vo" items="${list }">					
					<div class="container p-3 my-3 border listBox">
						<div class="row">
							<div id="campingSite">						
								<a href='/camping/campingView?contentId=${vo.contentId }'>
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
								<h2>
									<c:if test="${vo.sigunguNm == '' }">
										<a href="/camping/campingView?contentId=${vo.contentId}">[${vo.doNm}]  ${vo.facltNm }</a>
									</c:if>
										<a href="/camping/campingView?contentId=${vo.contentId}">[${vo.doNm }  ${vo.sigunguNm }] ${vo.facltNm }</a>							
								</h2>
								<ul>
									<c:if test="${vo.addr2 =='' }">
										<li>${vo.addr1 }</li>
									</c:if>
										<li>${vo.addr1 } ${vo.addr2 }</li>
									<c:if test="${vo.tel != ''}">
										<li>${vo.tel }</li>
									</c:if>
								</ul>	
							</div>
						</div>
					</div>		
				</c:forEach>							
			</ul>			
		</div>
	</div>