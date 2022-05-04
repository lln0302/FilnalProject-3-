<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<link rel="stylesheet" href="/css/car/carInfo.css" type="text/css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1ba94570565044323eac417fcde53827&libraries=services"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">


<div class="container" id="ciBody">
	<h1>[제목이 들어갈 부분입니다]</h1>
	<div id="ciHead">
		<span id="ciNick">[닉네임]</span> | <i class="fa fa-clock clock"></i> <span id="ciDate">[등록일]</span>
	</div>
	<hr>
	<div class="map_wrap">
		<div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
	    <div class="hAddr">
	        <span class="title">지도중심기준 행정동 주소정보</span>
	        <span id="centerAddr"></span>
	    </div>
	</div>
	
	<div id="ciContent">[글 내용이 들어갈 부분입니다]<br>
	[글 내용이 들어갈 부분입니다]<br>
	[글 내용이 들어갈 부분입니다]<br>
	[글 내용이 들어갈 부분입니다]<br>
	[글 내용이 들어갈 부분입니다]<br>
	[글 내용이 들어갈 부분입니다]<br>
	</div>
	
	<div id="ciFoot">
		<i class='fas fa-eye'></i> <span id="ciView">[조회수]</span>
		&nbsp;&nbsp;&nbsp;	
		<i class='fas fa-comment'></i> <span id="ciReplyCount">[댓글수]</span>
	</div>
	
	<div id="ciRep">
		<input type="text" id="ciReply" name="ciReply" placeholder="댓글 입력 ..."/>
		<button onclick="" id="ciReplyButton">댓글 등록</button>
		<ul id="ciReplyList">
			<li>
				[닉네임] | [등록일]<br>
				[댓글 내용이 들어갈 부분입니다]<hr/>
			</li>
			<li>
				[닉네임] | [등록일]<br>
				[댓글 내용이 들어갈 부분입니다]<hr/>
			</li>
		</ul>
	</div>
</div>