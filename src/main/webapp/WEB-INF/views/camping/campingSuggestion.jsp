<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
@import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=IBM+Plex+Sans+KR:wght@200;400;500;600&family=IBM+Plex+Sans:wght@100;200;300;400;500&display=swap');
</style>

<style>

	.container{
		border-left: 2px solid #dddddd;
 		border-right: 2px solid #dddddd;
 	 	font-family: 'Gowun Dodum', sans-serif;  /*메인페이지 타이틀 폰트*/
		font-family: 'IBM Plex Sans', sans-serif; /* 본문 영문 폰트*/
		font-family: 'IBM Plex Sans KR', sans-serif; /* 본문 한글폰트 */
	}
		
	.searchbox {
		padding:10px;
		margin: 33px auto;
		text-align: center;
		position: relative;		
		height:auto;
/* 		background-color: rgb(245, 130, 67); */
		background-color:#ffbf70;
		color: white;
		box-shadow: 0px 3px 6px 0px #c1c0c0;
		border-radius: 5px;
	}
	
	#searchBoxunderline{
		background-color: #eeeeee;
		width:100%;
		height:auto;
		padding:9px 0;
		position:relative;
		border-bottom:2px solid black;
	}
	
	.campingListShow{
		overflow:auto;
	}
	
	#capmingSite{
		border-bottom:1px solid gray;
		padding:25px 20px;
		width: 100%;
		height:230px;
	}
	
	.C_SearchBtnWrap{
		padding: 20px 0px;
 	    border-bottom: 1.5px solid #ffffff;
 	 	width: 90%;
 	 	margin: 10px auto;
	}
	
	.detail, .tag_search{
		width: 45%;
	    height: 52px;
	    border: none;
	    background-color: white;
	    margin: 5px 12px;
	    border-radius: 5px;
	    font-size: 17px;
	    font-weight: 500;
	    color: #4a4a4a;
	}
	
	.detail:hover, .tag_search:hover{
	    background-color: #67493B;
	    color: white;
		
	}
	
	.C_select{
		position: relative;
		text-align: center;
		border: 1px solid black;
		width: 90%;
		padding: 10px;
		margin: 20px auto;
		background-color: #67493B;
		border-radius: 5px;
	}
	
	.C_detail{
		border: none;
	    background-color: #ff823f;
	    color: white;
	    padding: 6px;
	    margin-left: 5px;
	    margin-top: 10px;
	    border-radius: 8px;
	}
	
	.C_search{
		border: none;
	    background-color: #ff823f;
	    color: white;
	    padding: 12px;
	    width: 90%;
	    border-radius: 5px;
	    margin-bottom: 20px;
	    font-size: 18px;
	}
	
	.C_search:hover{
		background-color: #67493B;
	}
	
	#imageBox{
		float:left; width:30%;
	}
	
	#campingInfo{
		float:left; width:70%; 
	}
	
</style>
<div id="campingSuggetion"> 
	<div id ="searchBoxunderline"></div>
		<div class = "campingListShow" id="camping">		
			<ul class="campingSearch">
				<script>
					ListUpcampinginfo();
				</script>
				<c:forEach var="vo" items="${list }">
					<div class="container p-3 my-3 border listBox">
						<div class="row">
							<div id="campingSite">						
								<a href='/camping/campingView?contentId=${vo.contentId }'>
									<div id="imageBox" class="col-4">			
										<c:if test="${vo.firstImageUrl == null }">
											<img src="/img/camping/autumn-season-5580627__340.webp" style="width:250px; height:183.33px;">
										</c:if>
										<c:if test="${vo.firstImageUrl != null}">
											<img src="${vo.firstImageUrl}" style="width:275px; height:195px;">
										</c:if>
									</div>
								</a>
							</div>
							<div class="col-8">
								<h2>
									<c:if test="${vo.sigunguNm == '' }">
										<a href="/camping/campingView?contentId=${vo.contentId}">[${vo.doNm}]  ${vo.facltNm }</a>
									</c:if>
										<a href="/camping/campingView?contentId=${vo.contentId}">[${vo.doNm }  ${vo.sigunguNm }] ${vo.facltNm }</a>							
								</h2>
								<ul>
									<c:if test="${vo.addr2 =='' }">
										<li>${vo.addr1 }</li>
									</c:if>
										<li>${vo.addr1 } ${vo.addr2 }</li>
									<c:if test="${vo.tel != ''}">
										<li>${vo.tel }</li>
									</c:if>
								</ul>	
							</div>
						</div>
					</div>		
				</c:forEach>
				<c:if test="${vo.totalRecord }">
					검색결과가 없습니다
				</c:if>				
			</ul>			
		</div>
	</div>