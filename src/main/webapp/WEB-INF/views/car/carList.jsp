<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


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
      <a href="/car/carWrite"><i class="fa fa-pen writeBtn"></i></a>
    </div>
	<div class="map_wrap">
	    <div id="map" style="width:50%;height:100%;position:relative;overflow:hidden;"></div>
		
		<div id="menu_wrap" class="bg_white">
		        <div class="option">
		            <div>
		                <form onsubmit="searchPlaces(); return false;" style="text-align: justify;">
		                    <!--<input type="text" value="이태원 맛집" id="keyword" size="15"> -->
		                    <select id="keyword" style="width:100px;">
		                    	<option value="서울">서울</option>
		                    	<option value="경기">경기</option>
		                    </select>
		                    <button type="submit">검색</button> 
		                </form>
		            </div>
		            
		        </div>
		        <hr>
		        <ul id="placesList"></ul>
		        <div id="pagination"></div>
		</div>
		    
	</div>
</div>

<script src="/js/car/carList.js"></script>
	
<!--
<div id="planCreate_map"></div>
-->