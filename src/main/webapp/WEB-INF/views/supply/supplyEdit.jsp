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
		<form method="post" action="/supply/supplyEditOk" id="swFrm" class="col-12">
			<input type="hidden" value="${vo.supplyno }" name="supplyno">
			<div id="swLeft" class="col-4">
				<h4>대표 이미지</h4><hr/>
				<div id="swImgWrap">
		            <img src="/img/supply/thumbnailImg/${vo.photo }"   id="swImg" />
		         </div>
		         <div id="pWrap">
			         <p>
			         	<b>기존에 업로드하신<br>게시물의 대표 이미지입니다!</b><br><br>
			         	대표 이미지는
			         	<span style="color:red"><b>수정이 불가능합니다.</b></span>
			         </p>
		         </div>
			</div>
			
			<div id="swRight" class="col-8">
			
				<div id="supplyWriteWrap">
					<input type="text" id="swName" name="title" placeholder="제목을 입력하세요" value="${vo.title }"/><hr style="margin:16px 0"/>
					<textarea id="swContent" name="content">${vo.content }</textarea>
				</div>
				
				<div id="swWriteSubmitWrap">
					<input type="submit" value="수정" class="btn" id="supplyWriteSubmit"/>
				</div>
			</div>
		</form>
	</div>
</div><br/>

<script src="/js/supply/supplyWrite.js"></script>