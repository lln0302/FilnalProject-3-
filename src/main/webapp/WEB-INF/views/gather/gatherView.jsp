<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/gather/view.css" type="text/css"/>
<script src="/js/gather/reply.js"></script>
<script src="/js/gather/view.js"></script>
<script>
	// 세션에 있는 닉네임 사용
	let nickname = "${nickname}"; 
	
	$(function(){
		// 삭제 버튼 클릭 시 뷰 페이지 삭제
		$("#gatherDel").on('click', function(){ 
			if(confirm("삭제하시겠어요?")){
				location.href="/gather/gatherDel?gatherno=${view.gatherno}";
			}
		});
		
		// 이미 캠핑 참여한 캠퍼 구해서 캠핑 참여한 유저면 버튼 변경
		if("${alreadyJoin}"!=''){
			$("#gnewnoBtn1").addClass("separate");
			$("#gnewnoBtn1").val("캠핑 취소");
		}else{
			$("#gnewnoBtn1").removeClass("separate");
			$("#gnewnoBtn1").val("캠핑 참여");
		}
		
	});
</script>
<div class="container gatherView">
	<h1>${view.title}</h1>
	<div class="col-12 camperTitle"></div>
	<hr/>
	<ul id="iconsAndName">
		<li><i class="fa fa-eye fa-lg"></i> ${view.views}</li>
		<li><i class="fa fa-clock fa-lg"></i> ${view.createdate}</li>
		<li>${view.nickname} 님</li>
		<c:if test="${nickname==view.nickname}"><!-- 작성자가 로그인한 유저일때만 -->
			<li>
				<a href="/gather/gatherEdit?gatherno=${view.gatherno}" class="btn" id="gatherEdit">수정</a>
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
				<div id="contentDiv">${view.content}</div>
			</div>
		</div>
		<div class="col-6">
			<div id="joinCamper">
				<form method="get" id="joinCamperForm">
					<input type="hidden" id="gatherno" name="gatherno" value="${view.gatherno}"/>
					<span id="gnewno">현재 참여 신청 인원: <span>${view.gnewno}</span></span> / 
					<span id="gmemberno">
						<input type="hidden" name="gmemberno" value="${view.gmemberno}"/>${view.gmemberno}
					</span>
					<c:if test="${nickname!=view.nickname}"><!-- 작성자가 로그인한 유저가 아닐 때만 -->
						<c:if test="${view.gmemberno>view.gnewno}"><!-- 캠퍼모집 인원이 참여인원이 더 클 때만 -->
							<span id="btnDiv">
								<input type="submit" class="btn" id="gnewnoBtn1" value="캠핑 참여">
							</span>
						</c:if>
					</c:if>
				</form>
			</div>
			<!-- <p id="joinWarn">🛑 캠핑 일주일 전 캠핑 취소를 하시면 매너온도가 내려가게 됩니다.</p> -->
			<p id='intro'>🏕️ 캠핑에 참여하는 유저 리스트 </p>
			<table class="table table-striped text-center">
				<thead>
					<tr>
						<th>Name</th>
						<th>gender</th>
					</tr>
				</thead>
				<tbody id="tbody">
				</tbody>
			</table>
		</div>	
		
		<div class="col-12">
			<hr/>
			<i class="fa fa-comment replyMark">&nbsp;<span id="replyCount"></span></i>
		</div>
		<div class="col-12">
			<form method="post" id="replyLine" class="form-group">
				<input type="hidden" name="gatherno" id="gatherno" value="${view.gatherno}">
				<textarea name="content" id="content" class="form-control" placeholder="댓글을 입력해주세요" ></textarea>
				<input type="submit" class="btn replyBtn" value="작성" >
			</form>
		</div>
		<!-- 댓글 목록 표시 -->
		<div id="replyList" class="col-12 form-group">
		</div>
	</div>
</div>
<br/>