<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/css/supply/supplyWrite.css" type="text/css">
<h1>상태는 괜찮은데 쓰지 않게 된 캠핑용품들...</h1>
<h5>이곳에서 다른 사람들과 나눠보세요</h5>
<script>
	$(function() {
		CKEDITOR.replace("swContent", {
			height: 575,
		});
		
	});
	function swSearch() {
		alert("swSearch 눌림");
	}
</script>
<div class="container">

<form action="/supply/supplyInfo" id="swFrm">
	
	
	
	<div id="supplyWriteWrap">
		<input type="text" id="swName" placeholder="제목을 입력하세요" value=""/><hr style="margin:16px 0"/>
		<textarea id="swContent" name="swContent"></textarea>
	</div>
	
	<div id="swWriteSubmitWrap">
		<input type="submit" value="등록" class="btn" id="supplyWriteSubmit"/>
	</div>
	
</form>

</div><br/>