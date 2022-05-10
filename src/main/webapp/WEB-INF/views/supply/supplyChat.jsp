<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" href="/css/supply/supplyChat.css" type="text/css">


<div class="container" id="scBody">
	<h4>[글 작성자]님의 [글 제목] 게시물에서 생성된 채팅방입니다</h4>
	
	<div style="text-align: right">
		방 생성 : [댓글 작성자]님
	</div>
	<div id="chatting">
		<fieldset class="chatSeller" id="chatSeller1">
			<legend id="sellerId">[글작성자]</legend>
			<span id="sellerText1">안녕하세요ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ</span>
		</fieldset>
		<fieldset class="chatBuyer" id="chatBuyer1">
			<legend id="buyerId">[방생성자]</legend>
			<span id="buyerText1">얼마정도 하나요??</span>
		</fieldset>
		
		<fieldset class="chatSeller" id="chatSeller2">
			<legend class="sellerId">[글작성자]</legend>
			<span id="sellerText2">안팔아요</span>
		</fieldset>
		<fieldset class="chatBuyer" id="chatBuyer2">
			<legend class="buyerId">[방생성자]</legend>
			<span id="buyerText2">뭐예요</span>
		</fieldset>
		
		<fieldset class="chatSeller" id="chatSeller1">
			<legend id="sellerId">[글작성자]</legend>
			<span id="sellerText3">안녕하세요ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ</span>
		</fieldset>
		<fieldset class="chatBuyer" id="chatBuyer1">
			<legend id="buyerId">[방생성자]</legend>
			<span id="buyerText3">얼마정도 하나요??</span>
		</fieldset>
		
		<fieldset class="chatSeller" id="chatSeller2">
			<legend class="sellerId">[글작성자]</legend>
			<span id="sellerText4">안팔아요</span>
		</fieldset>
		<fieldset class="chatBuyer" id="chatBuyer2">
			<legend class="buyerId">[방생성자]</legend>
			<span id="buyerText4">뭐예요</span>
		</fieldset>
		
		<!-- 
		<p class="chatBuyer">얼마정도 하나요??</p>
		<p class="chatSeller">안녕하세요ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ</p>
		 -->
	</div>
</div>
<script src="/js/supply/supplyChat.js"></script>