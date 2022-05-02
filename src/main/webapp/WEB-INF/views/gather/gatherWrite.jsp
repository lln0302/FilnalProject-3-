<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/css/gather/write.css" type="text/css"/>
<script src="//cdn.ckeditor.com/4.17.2/full/ckeditor.js"></script>
<script>
	$(function(){
		
		$("#datepicker1, #datepicker2").datepicker({
			dateFormat: 'yy-mm-dd'
		});
		
		CKEDITOR.replace("content", {
			height:'500px',
			startupFocus: false,
		});
		
		$("#writeForm").submit(function(){
			if($("#gatherTitle").val()==''){
				alert("제목을 입력해주세요");
				return false;
			}
			if($("#number").val()=='' || $("#number").val()==0){
				alert("모집인원을 입력해주세요");
				return false;
			}
			if($("#datepicker1, #datepicker2").val()==''){
				alert("일정을 입력해주세요");
				return false;
			}
			if(CKEDITOR.instances.content.getData()==''){
				alert("내용을 입력해주세요");
				return false;
			}
		});
		
		$("#resetBtn").on('click', function(){
			CKEDITOR.instances.content.setData("");
		})
		
		$("#showList").click(function(){
			location.href="/gather/gatherList";
		});

	});
</script>


<div class="container">
	<h1>캠퍼모임을 만들어보세요!</h1>
	<div id="gatherWrite">
		<form class="form-group" id="writeForm" method="post" action="/gather/gatherWriteOk" enctype="multipart/form-data">
			<div class="col-12 writeMark">제목</div>
			<hr/>
			<div class="col-10 writeTitle">
				<span>제목을 적어주세요</span>
				<input type="text" name="title" id="gatherTitle" class="col-8"/>
			</div>
			<div class="col-12 writeMark">모집인원 및 날짜</div>
			<hr/>
			<div class="row">
				<div class="col-4 writeCamper">
					<span>모집인원</span>
					<input type="number" class="col-6" id="number" name="gatherno" min="0"/>명
				</div>	
				<div class="col-7 writeDate">
					<span>일정</span>
					<input type="text" id="datepicker1"/> ~
					<input type="text" id="datepicker2"/>
				</div>
			</div>
			<div class="col-12 writeMark">세부 내용</div>
			<hr/>
			<textarea name="content"></textarea>
			<div class="col-12 btns">
				<input type="submit" class="btn" id="writeBtn" value="등록">
				<input type="reset" class="btn" id="resetBtn" value="취소">
				<input type="button" class="btn" id="showList" value="리스트로">		
			</div>
		</form>
	</div>
	
</div>