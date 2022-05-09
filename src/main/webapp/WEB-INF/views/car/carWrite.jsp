<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1ba94570565044323eac417fcde53827&libraries=services"></script>
<link rel="stylesheet" href="/css/car/carWrite.css" type="text/css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<script src="https://cdn.ckeditor.com/4.17.2/full/ckeditor.js"></script>

<script>
	$(function() {
		CKEDITOR.replace("content", {
			height: 575
		});
		
	});
	function cwSearch() {
		alert("cwSearch 눌림");
	}
</script>


<h1>오늘 당신의 차박 장소는 어디였나요?</h1>

<div class="container">

<div class="row">

	<form action="/car/carInfo" id="cwFrm">
		<div id="carMapWrap" class="col-5">
			<table id="cwTable">
				<tr>
					<td>
						<select id="keyword">
							<option value="서울">서울</option>
							<option value="경기">경기</option>
						</select>
					</td>
					<td><input type="text" id="locX" name="locX" value="" placeholder="위도 값을 입력"/></td>
					<td><input type="text" id="locY" name="locY" value="" placeholder="경도 값을 입력"/></td>
					<td><button onclick="cwSearch(); return false;">검색</button></td>
				</tr>
			
			</table>
			
			<hr><!-- ---------------------------- -->
			
			
			<div class="map_wrap">
			    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
			    <div class="hAddr">
			        <span class="title">지도중심기준 행정동 주소정보</span>
			        <span id="centerAddr"></span>
			    </div>
			    <label id="cwLabel">현재 지도의 중앙 좌표 >> <span>X: Y:</span></label>
			</div>	
			
			
		</div>
		
		
		<!-- -------------------------------------------- -->
		
		
		<div id="carWriteWrap" class="col-7">
			<input type="text" id="carName" placeholder="제목을 입력하세요"/><hr style="margin:16px 0"/>
			<textarea id="content" name="content"></textarea>
		</div>
		
		<div id="cwWriteSubmitWrap">
			<input type="submit" value="등록" id="carWriteSubmit"/>
		</div>
		
	</form>

</div><br/>		<!-- div.row -->

</div><!-- container -->


<script src="/js/car/carWrite.js"></script>