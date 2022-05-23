<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/css/supply/supplyWrite.css" type="text/css">
<h1>상태는 괜찮은데 쓰지 않게 된 캠핑용품들...</h1>
<h5>이곳에서 다른 사람들과 나눠보세요</h5>
<script>
	$(function() {
		CKEDITOR.replace("swContent", {
			filebrowserUploadMethod :'form',
			filebrowserUploadUrl: "/supply/imgUpload",
			height: 575,
		});
		
	});
	
</script>
<div class="container">
	<div class="row">
		<form method="post" action="/supply/supplyWriteOk" id="swFrm" class="col-12" enctype="multipart/form-data">
			<div id="swLeft" class="col-4">
				<h4>대표 이미지를 선택해주세요!</h4><br/>
				<div id="swImgWrap">
		            <span id="img_upload_phr">클릭해서 썸네일 추가하기</span> <img src=""   id="swImg" />
		         </div>
		         <input type="file" name="thumbnailImg" id="thumbnailImg" style="display: none;" />
		         <div id="pWrap">
			         <p>
			         	<b>게시물의 대표 이미지를 추가하세요!</b><br><br>
			         	다른 사용자분들이 어떤 물품을 나눔하는지 쉽게 알아볼 수 있도록
			         	물품이 잘 나온 사진을 따로 추가해주세요.<br>
			         	대표 이미지가 추가되지 않을 경우<br>
			         	<span style="color:red"><b>글 작성이 완료되지 않습니다.</b></span>
			         </p>
		         </div>
			</div>
			
			<div id="swRight" class="col-8">
			
				<div id="supplyWriteWrap">
					<input type="text" id="swName" name="title" placeholder="제목을 입력하세요"/><hr style="margin:16px 0"/>
					<textarea id="swContent" name="content"></textarea>
				</div>
				
				<div id="swWriteSubmitWrap">
					<input type="button" value="등록" class="btn" id="supplyWriteSubmit" onclick="imgCheck()"/>
				</div>
			</div>
		</form>
	</div>
</div><br/>

<script src="/js/supply/supplyWrite.js"></script>