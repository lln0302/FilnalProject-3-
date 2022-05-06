<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/css/gather/view.css" type="text/css"/>
<script src="https://kit.fontawesome.com/76aefe2b67.js"></script>
<div class="container gatherView">
	<h1>캠퍼 모집</h1>
	<div class="col-12 camperTitle">제목</div>
	<hr/>
	<ul id="iconsAndName">
		<li><i class="fa fa-eye fa-lg"></i> 1</li>
		<li><i class="fa fa-clock fa-lg"></i> 2022-05-02</li>
		<li>작성자</li>
		<c:if test="${logId==viewvo.userid}">
			<li>
				<a href="/gather/gatherEdit?no=${viewVo.no}" class="btn" id="gatherEdit">수정</a>
				<input type="button" class="btn" id="gatherDel" value="삭제"/>
			</li>
		</c:if>
	</ul>
	<div class="row">
		<div class="col-6">
			<div id="placeAndDate">
				<div><i class="fa fa-location-arrow"></i> 전라북도 순천시 00 캠핑장</div>
				<div><i class="fa fa-calendar"></i> 2022/04/26 ~ 2022/04/30</div>
			</div>
			<hr/>
			<div id="gatherContent">
				<div>sodfsdofsdofjsodfjasofjoad</div>
			</div>
		</div>
		<div class="col-6">
			<div id="joinCamper">
				<span><span id="gnewno">1</span> / <span id="gmemberno">5</span></span>
				<input type="button" class="btn gnewnoBtn1" id="gnewnoBtn1" value="캠핑 참여">
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
			<form id="replyLine" method="post">
				<input type="hidden" name="gatherno">
				<textarea name="content" id="content" class="replyContent" 
				placeholder="댓글을 입력해주세요"></textarea>
				<input type="submit" class="btn replyBtn" value="작성" >
			</form>
		</div>
		<!-- 댓글 목록 표시 -->
		<div id="replyList">
		</div>
	</div>
</div>
<br/>