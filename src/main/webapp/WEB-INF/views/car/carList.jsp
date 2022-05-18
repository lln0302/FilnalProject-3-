<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1ba94570565044323eac417fcde53827&libraries=services"></script>
<link rel="stylesheet" href="/css/car/carList.css" type="text/css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

<h1>우리의 차박 장소를 공유합니다</h1>


<div class="container">
	<!-- 
	<div style="text-align: right">
	<button id="carWriteButton" onclick="location.href='/car/carWrite'">글 등록</button>
	</div> 
	-->
	<div class="col-12" style="text-align: right">
      <a href="/car/carWrite"><i class="fa fa-pen writeBtn fa-lg"></i></a>
    </div>
	<div class="map_wrap">
	    <div id="map"></div>
		
		
		
		
		
		
		<div id="menu_wrap" class="bg_white">
		        <div class="option">
		            <div>
		            	<input type="hidden" id="clListLen" value= ${ fn:length(list)}>
		                <form onsubmit="displayPlaces(); return false;" style="text-align: justify;">
		                    <!--<input type="text" value="이태원 맛집" id="keyword" size="15"> -->
		                    <select id="keyword" style="width:100px;">
		                    	<option value="서울">서울</option>
		                    	<option value="경기">경기</option>
		                    	<option value="강원">강원</option>
		                    	<option value="충북">충북</option>
		                    	<option value="충남">충남</option>
		                    	<option value="전북">전북</option>
		                    	<option value="전남">전남</option>
		                    	<option value="경북">경북</option>
		                    	<option value="경남">경남</option>
		                    	<option value="제주">제주</option>
		                    </select>
		                    <button type="submit">검색</button> 
		                </form>
		            </div>
		            
		        </div>
		        <hr>
		        
		        <c:forEach var="vo" items="${list}" varStatus="status">
		        	<input type="hidden" id="plCarno${status.index}" value="${vo.carno}">
		        	<input type="hidden" id="plTitle${status.index}" value="${vo.title}">
		        	<input type="hidden" id="plRegion${status.index}" value="${vo.region }">
		        	<input type="hidden" id="plNickname${status.index}" value="${vo.nickname }">
		        	<input type="hidden" id="plViews${status.index}" value="${vo.views }">
		        	<input type="hidden" id="plCount${status.index}" value="${vo.count }">
		        	<input type="hidden" id="plWritedate${status.index}" value="${vo.writedate }">
		        	<input type="hidden" id="locx${status.index}" value="${vo.locX}">
		        	<input type="hidden" id="locy${status.index}" value="${vo.locY}">
		        </c:forEach>
		        
		        <ul id="placesList">
			        
		        </ul>
		        <!-- 
		        <ul class="pagination justify-content-center">
				    <li class="page-item"><a class="page-link" href="javascript:void(0);">Previous</a></li>
				    <li class="page-item"><a class="page-link" href="javascript:void(0);">1</a></li>
				    <li class="page-item"><a class="page-link" href="javascript:void(0);">2</a></li>
				    <li class="page-item"><a class="page-link" href="javascript:void(0);">Next</a></li>
				</ul>
				 -->
		</div>
		    
	</div>
</div>

<script src="/js/car/carList.js"></script>
