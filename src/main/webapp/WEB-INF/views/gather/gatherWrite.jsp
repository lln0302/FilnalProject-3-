<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="url" value="<%=request.getContextPath()%>"/>
<link rel="stylesheet" href="/css/gather/writedit.css" type="text/css"/>
<script src="/js/gather/writedit.js"></script>
<script>
	$(function(){
		
	});
</script>
<div class="container">
	<h1>캠퍼모임을 만들어보세요!</h1>
	<div id="gatherWrite">
		<form class="form-group" id="writeForm" method="post" 
		action="/gather/gatherWriteOK" enctype="multipart/form-data">
			<div class="row">
				<div class="col-12">
					<div class="writeMark">제목 및 장소<hr/></div>
				</div>
				<div class="col-6 writeTitle">
					<input type="text" class="form-control col-12" name="title" id="gatherTitle" placeholder="제목을 적어주세요"/>
				</div> 
				<div class="col-5 writeTitle" >
					<input type="text" class="form-control col-12" name="place" id="gatherPlace" placeholder="장소를 적어주세요"/>
				</div>
				
				<div class="col-12">
					<div class="writeMark">모집인원 및 날짜<hr/></div>
				</div>
				<div class="form-inline">
					<div class="col-4 writeTitle">
						<span>모집인원</span>
						<input type="number" class="col-4 form-control for" id="number" name="gmemberno" min="1" max="30"/>
					</div>	
					<div class="col-7 writeTitle">
						<span>일정</span>
						<input type="text" id="startdate" class="form-control col-4" name="startdate" 
						autocomplete="off" readonly="readonly"/> -
						<input type="text" id="enddate" class="form-control col-4"name="enddate" 
						autocomplete="off" readonly="readonly"/>
					</div>
				</div>
				<div class="col-12">
					<div class="writeMark">세부 내용</div>
					<textarea name="content"></textarea>
				</div>
				<div class="col-12 btns">
					<input type="submit" class="btn" id="writeBtn" value="등록">
					<input type="reset" class="btn" id="resetBtn" value="취소">
					<input type="button" class="btn" id="showList" value="리스트로">		
				</div>
			</div>
		</form>
	</div>
</div>
<br/>