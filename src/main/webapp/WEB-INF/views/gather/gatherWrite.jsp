<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/css/gather/write.css" type="text/css"/>
<script>
	$(function(){
		
		$("#startdate, #enddate").datepicker({
			dateFormat: 'yy-mm-dd',  // Input Display Format 변경
			changeMonth: true,       // select 문으로 월 선택 가능  
			changeYear: true, 		 // select 문으로 년 선택 가능
			prevText: '이전 달',       // datepicker 한글로
		    nextText: '다음 달',
		    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    dayNames: ['일','월','화','수','목','금','토'],
		    dayNamesShort: ['일','월','화','수','목','금','토'],
		    dayNamesMin: ['일','월','화','수','목','금','토'],
		    yearSuffix: '년',

		});
		
		
		CKEDITOR.replace("content", {
			height:'500px',
			filebrowserUploadUrl:'/gather/imageUpload',
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
		<form class="form-group" id="writeForm" method="post" action="/gather/gatherWriteOK" enctype="multipart/form-data">
			<div class="row">
				<div class="col-12">
					<div class="writeMark">제목 및 장소<hr/></div>
				</div>
				<div class="col-6 writeTitle">
					<span>제목을 적어주세요</span>
					<input type="text" name="title" id="gatherTitle" class="col-12"/>
				</div>
				<div class="col-5 writePlace">
					<span>장소를 적어주세요</span>
					<input type="text" name="place" id="gatherPlace" class="col-12"/>
				</div>
				<div class="col-12">
					<div class="writeMark">모집인원 및 날짜<hr/></div>
				</div>
				<div class="col-4 writeCamper">
					<span>모집인원</span>
					<input type="number" class="col-6" id="number" name="gmemberno" min="0"/>명
				</div>	
				<div class="col-7 writeDate">
					<span>일정</span>
					<input type="text" id="startdate" name="startdate" autocomplete="off" readonly="readonly"/> -
					<input type="text" id="enddate" name="enddate" autocomplete="off" readonly="readonly"/>
				</div>
				<div class="col-12">
					<div class="writeMark">세부 내용<hr/></div>
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