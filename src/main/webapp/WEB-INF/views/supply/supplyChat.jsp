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
		<div class="chatSeller">
			<div id="sellerId">[글작성자]</div>
			<div class="sellerText" id="sellerText1">안녕하세요ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ</div>
		</div>
		<div class="chatBuyer">
			<div id="buyerId">[방생성자]</div>
			<div class="buyerText" id="buyerText1">얼마정도 하나요??</div>
		</div>
		
		<div class="chatSeller">
			<div class="sellerId">[글작성자]</div>
			<div class="sellerText" id="sellerText2">gㅎㅎㅎ</div>
		</div>
		<div class="chatBuyer">
			<div class="buyerId">[방생성자]</div>
			<div class="buyerText" id="buyerText2">얼마정도 하나요 아니 대답을 하시라니깐여</div>
		</div>
		
		<div class="chatSeller">
			<div class="sellerId">[글작성자]</div>
			<div class="sellerText" id="sellerText3">안녕하세요ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ</div>
		</div>
		<div class="chatBuyer">
			<div class="buyerId">[방생성자]</div>
			<div class="buyerText" id="buyerText3">얼마정도 하나요??</div>
		</div>
		
		<div class="chatSeller">
			<div class="sellerId">[글작성자]</div>
			<div class="sellerText" id="sellerText4">gㅎㅎㅎ</div>
		</div>
		<div class="chatBuyer">
			<div class="buyerId">[방생성자]</div>
			<div class="buyerText" id="buyerText4">얼마정도 하나요 아니 대답을 하시라니깐여</div>
		</div>
		
		
	</div> <!-- 채팅창 부분 div -->
	
	<div id="chatDiv">
		<textarea id="chat" name="chat" placeholder="대화 입력..."></textarea>
		<input type="submit" id="send" name="send" value="전송">
	</div>
	
</div>
<script src="/js/supply/supplyChat.js"></script>