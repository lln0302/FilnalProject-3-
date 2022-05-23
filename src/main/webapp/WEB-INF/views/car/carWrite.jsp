<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1ba94570565044323eac417fcde53827&libraries=services"></script>
<link rel="stylesheet" href="/css/car/carWrite.css" type="text/css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<script>
	
	$(function() {
		CKEDITOR.replace("content", {
			filebrowserUploadMethod :'form',
			filebrowserUploadUrl: "/car/imgUpload",
			height: 694
		});
		
	});
	function cwSearch() {
		mapSearchClick();
	}
</script>


<h1>오늘 당신의 차박 장소는 어디였나요?</h1>

<div class="container">

<div class="row">

	<form method="post" action="/car/carWriteOk" id="cwFrm">
		<div id="carMapWrap" class="col-5">
			<table id="cwTable">
				<tr>
					<td>
						<select id="keyword" name="region">
							<option value="">-지역선택-</option>
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
					</td>
					<td><input type="text" id="locX" name="locX" value=0 placeholder="위도 값을 입력"/></td>
					<td><input type="text" id="locY" name="locY" value=0 placeholder="경도 값을 입력"/></td>
					<td><button onclick="cwSearch(); return false;">검색</button></td>
				</tr>
			
			</table>
			
			<hr><!-- 여기까진 지도검색탭--------여기부턴 지도-------------------- -->
			
			
			<div class="map_wrap">
			    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
			    
			    <label id="cwLabel">현재 지도의 중앙 좌표 >> </label>
			</div>	
			
			
		</div>
		
		
		<!-- -----------여기까지 지도끝///여기부턴 오른쪽 글작성--------------------------------- -->
		
		
		<div id="carWriteWrap" class="col-7">
			<input type="text" id="carName" name="title" placeholder="제목을 입력하세요"/><hr style="margin:16px 0"/>
			<textarea id="content" name="content"></textarea>
		</div>
		
		<div id="cwWriteSubmitWrap">
			<button type="button" id="carWriteSubmit" onclick="cwCheck()">등록</button>
		</div>
		
	</form>

</div><br/>		<!-- div.row -->

</div><!-- container -->


<script src="/js/car/carWrite.js"></script>