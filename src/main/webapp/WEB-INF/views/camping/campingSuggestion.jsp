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
								<a id="campingSuggestion" href='/camping/campingView?contentId=${vo.contentId }'>
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
									<p>
									<c:if test="${vo.sigunguNm == '' }">
										<a id="campingSuggestion" href="/camping/campingView?contentId=${vo.contentId}">[${vo.doNm}]  ${vo.facltNm }</a>
									</c:if>
										<a id="campingSuggestion" href="/camping/campingView?contentId=${vo.contentId}">[${vo.doNm }  ${vo.sigunguNm }] ${vo.facltNm }</a>
									</p>							
								</h2>
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
										<li><img src="/img/camping/주소아이콘.png" style="height:28px"> ${vo.addr1 }</li>
									</c:if>
										<li><img src="/img/camping/주소아이콘.png" style="height:28px"> ${vo.addr1 } ${vo.addr2 }</li>									
								</p>
									<c:if test="${vo.tel != ''}">
										<li><img src="/img/camping/전화.png" style="height:20px">  ${vo.tel }</li>
									</c:if>	
							</div>
						</div>
					</div>		
				</c:forEach>							
			</ul>			
		</div>
	</div>