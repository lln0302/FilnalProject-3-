<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/css/gather/view.css" type="text/css"/>
<link rel="stylesheet" href="/css/gather/reply.css" type="text/css"/>
<script src="https://kit.fontawesome.com/76aefe2b67.js"></script>
<script src="/js/gather/reply.js"></script>
<script>
	let nickname = "${nickname}";
	$(function(){
		$("#gatherDel").on('click', function(){
			if(confirm("삭제하시겠어요?")){
				location.href="/gather/gatherDel?gatherno=${view.gatherno}";
			}
		});
	})
</script>
<div class="container gatherView">
	<h1>${view.title}</h1>
	<div class="col-12 camperTitle"></div>
	<hr/>
	<ul id="iconsAndName">
		<li><i class="fa fa-eye fa-lg"></i> ${view.views}</li>
		<li><i class="fa fa-clock fa-lg"></i> ${view.createdate}</li>
		<li>${view.nickname} 님</li>
		<c:if test="${nickname==view.nickname}">
			<li>
				<a href="/gather/gatherEdit?no=${view.gatherno}" class="btn" id="gatherEdit">수정</a>
				<input type="button" class="btn" id="gatherDel" value="삭제"/>
			</li>
		</c:if>
	</ul>
	<div class="row">
		<div class="col-6">
			<div id="placeAndDate">
				<div><i class="fa fa-location-arrow"></i> ${view.place}</div>
				<div><i class="fa fa-calendar"></i> ${view.startdate} ~ ${view.enddate}</div>
			</div>
			<hr/>
			<div id="gatherContent">
				<div>${view.content}</div>
			</div>
		</div>
		<div class="col-6">
			<div id="joinCamper">
				<span>
					<span id="gnewno">현재 참여 신청 인원: ${view.gnewno}</span> / 
					<span id="gmemberno">${view.gmemberno}</span>
				</span>
				<c:if test="${nickname!=view.nickname}">
					<input type="button" class="btn gnewnoBtn1" id="gnewnoBtn1" value="캠핑 참여">
				</c:if>
			</div>
			<p id="joinWarn">🛑 캠핑 일주일 전 캠핑 취소를 하시면 매너온도가 내려가게 됩니다.</p>
			<table class="table table-striped">
				<thead>
					<tr>
						<th>No.</th>
						<th>Name</th>
						<th>gender</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>캠퍼</td>
						<td>여</td>
					</tr>
				</tbody>
			</table>
		</div>	
		
		<div class="col-12">
			<hr/>
			<i class="fa fa-comment replyMark"> 3</i>
		</div>
		<div class="col-12">
			<form method="post" id="replyLine">
				<input type="hidden" name="gatherno" id="gatherno" value="${view.gatherno}">
				<textarea name="content" id="content" placeholder="댓글을 입력해주세요"></textarea>
				<input type="submit" class="btn replyBtn" value="작성" >
			</form>
		</div>
		<!-- 댓글 목록 표시 -->
		<div id="replyList" class="col-12">
		</div>
	</div>
</div>
<br/>