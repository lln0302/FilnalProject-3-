<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://kit.fontawesome.com/76aefe2b67.js"></script>

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
<script>

	//지역 검색
	$('document').ready(function(){
		var area0 = ["시/도 선택", "서울시", "부산시", "대구시", "인천시", "광주시", "대전시", "울산시", "세종시", "경기도", "강원도", "충청북도", "충청남도", "전라북도", "전라남도", "경상북도", "경상남도", "제주도"];
		var area1 = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
		var area2 = ["강서구", "금정구", "기장군", "남구", "동구", "동래구", "부산진구", "북구", "사상구", "사하구", "서구", "수영구", "연제구", "영도구", "중구", "해운대구"];
		var area3 = ["남구", "달서구", "달성군", "동구", "북구", "상주", "서구", "수성구", "중구"];
		var area4 = ["강화군", "계양구", "남구", "남동구", "동구", "부평구", "서구", "연수구", "옹진군", "중구"];
		var area5 = ["광산구", "남구", "동구", "북구", "서구"];
		var area6 = ["대덕구", "동구", "서구", "유성구", "중구"];
		var area7 = ["남구", "동구", "북구", "울주군", "중구"];
		var area8 = ["금난면", "세종시", "소정면", "연서면", "전동면"];
		var area9 = ["가평군", "고양시", "과천시", "광명시", "광주시", "구리시", "군포시", "김포시", "남양주시", "동두천시", "부천시", "성남시", "수원시", "시흥시", "안산시", "안성시", "안양시", "양주시", "양평군", "여주시", "연천군", "오산시", "용인시", "의왕시", "의정부시", "이천시", "파주시", "평택시", "포천시", "하남시", "화성시"];
		var area10 = ["강릉시", "고성군", "동해시", "삼척시", "속초시", "양구군", "양양군", "영월군", "원주시", "인제군", "정선군", "철원군", "춘천시", "태백시", "평창군", "홍천군", "화천군", "횡성군"];
		var area11 = ["괴산군", "단양군", "보은군", "영동군", "옥천군", "음성군", "제천시", "증평군", "진천군", "청원군", "청주시", "충주시"];
		var area12 = ["계룡시", "공주시", "금산군", "논산시", "당진시", "보령시", "부여군", "서산시", "서천군", "아산시", "예산군", "천안시", "청양군", "태안군", "홍성군"];
		var area13 = ["고창군", "군산시", "김제시", "남원시", "무주군", "부안군", "순창군", "완주군", "익산시", "임실군", "장수군", "전주시", "정읍시", "진안군"];
		var area14 = ["강진군", "고흥군", "곡성군", "광양시", "구례군", "나주시", "담양군", "목포시", "무안군", "보성군", "순천시", "신안군", "여수시", "영광군", "영암군", "완도군", "장성군", "장흥군", "진도군", "함평군", "해남군", "화순군"];
		var area15 = ["경산시", "경주시", "고령군", "구미시", "군위군", "김천시", "문경시", "봉화군", "상주시", "성주군", "안동시", "영덕군", "영양군", "영주시", "영천시", "예천군", "울릉군", "울진군", "의성군", "청도군", "청송군", "칠곡군", "포항시"];
		var area16 = ["거제시", "거창군", "고성군", "김해시", "남해군", "밀양시", "사천시", "산청군", "양산시", "의령군", "진주시", "창녕군", "창원시", "통영시", "하동군", "함안군", "함양군", "합천군"];
		var area17 = ["서귀포시", "제주시"];	
	
		$("select[name^=doNm]").each(function(){
			$selsido = $(this);
			$.each(eval(area0), function(){
				$selsido.append("<option value='"+this+"'>"+this+"</option>");
			})
			$selsido.next().append("<option value=''>구/군 선택</option>");
		});
		
		$("select[name^=doNm]").change(function(){
			var area = "area"+$("option", $(this)).index($("option:selected", $(this)));
			var $sigugunNm = $(this).next();
			$("option", $sigugunNm).remove();
			
			if(area == "area0")
				$sigugunNm.append("<option value=''>구/군 선택</option>");
			else{
				$.each(eval(area), function(){
					$sigugunNm.append("<option value='"+this+"'>"+this+"</option>");
				});
			}
		});
	});
	
	//상세조건 on, off
	function Displaydetail(){
		if($('#search_detail').css('display') == 'none'){
			$('#search_detail').show();
		}
		else{
			$('#search_detail').hide();
		}
	}

	//시도 군구 옵션값
	var value_sido = "";
	var value_gungu = "";
	function changeSido(){
		value_sido = document.getElementById('doNm');		
		console.log(value_sido.options[value_sido.selectedIndex].value);
	}
	function changeGungu(){
		value_gungu = document.getElementById('sigunguNm');
		console.log(value_gungu.options[value_gungu.selectedIndex].value);
	}
	
	//api 데이터 DB로 저장
	 function addplaces(result) {
         $.ajax({
            type : 'post',
            url : '/camping/addplace',
            contentType : 'application/json; charset=UTF-8',
            data : JSON.stringify(result),
            async : false,
            success : function(res) {
            },
            error : function(e) {
               alert(e.responseText);
            }
         });
      }
	
	//캠핑리스트 api 받아오기
	function ListUpcampinginfo(){
		var pageNum = 1;
		$.ajax({			
			type : 'get',
			url : "http://api.visitkorea.or.kr/openapi/service/rest/GoCamping/basedList?ServiceKey=aP86zX%2BZyECfP94oWJpuGYSq%2FU4SWkv8At%2FwBv6YUfMepr6LdpZutU23EH2VFkgws6DngpHe0crNKiYVnVOmuQ%3D%3D&numOfRows=10&pageNo="+pageNum+"&MobileOS=ETC&MobileApp=TestApp&_type=json",
			success : function(result){
				console.log(result);
				addplaces(result.response.body.items.item);
			}
		});
	}	
		
	function prevBtn(pb){
		var prev = pb-1;
		location.href="/camping/campingSearch?pageNum="+prev+"";
	}
	function pageNum(p){
		location.href="/camping/campingSearch?pageNum="+p+"";
	}
	function nextBtn(nb){
		var next = nb+1;
		location.href="/camping/campingSearch?pageNum="+next+"";
	}
	
	$(function(){
		// 페이징
		if('${pVO.pageNum}'==1){
			$('.prevBtn').addClass('prevBtn disabled');
		}
		
		if('${pVO.pageNum}'=='${pVO.totalPage}'){
			$('.nextBtn').addClass('disabled');
		}		
	});
</script>

<div class="container">
	<div class="campingSearch" style="overflow:auto;">	
		<div class="searchbox">	
			<form id="serachForm" action="/camping/campingSearch" method="get">			
					<button class="btn detail" type="button" onclick="detail_Search()">상세검색</button>			
					<button class="btn tag_search" type="button" onclick="tag_Search()"></button>
			<div>
				<div class="C_SearchBtnWrap">
					<button class=" detail" type="button">상세검색</button>			
					<button class=" tag_search" type="button">

						<span>태그로 검색</span>
					</button>					
				</div>
				<div class="C_select">
				<div>				
					<ul>
						<li >	
							<strong style="margin-right:5px; font-size:18px; ">지역</strong>							
							<select id="sido" name="doNm" onchange="changeSido()"></select>							
							<select id="gungu" name="sigunguNm" onchange="changeGungu()"></select>								
							<button class="C_detail" type="button" onclick="Displaydetail()">상세 조건 +</button>
						</li>
					</ul>
				</div>
				<div id="search_detail" style="display:none; margin-top: 10px;">
					<ul>					
						<li>
							<strong>주요 시설</strong>
							<label><input type="checkbox" name="induty" value="일반야영장">일반야영장</label>
							<label><input type="checkbox" name="induty" value="자동차야영장">자동차야영장</label>
							<label><input type="checkbox" name="induty" value="카라반">카라반</label>
							<label><input type="checkbox" name="induty" value="글램핑">글램핑</label>
						</li>						
						<li>
							<strong>부대시설</strong>
							<label><input type="checkbox" name="sbrsCl" value="전기">전기</label>
							<label><input type="checkbox" name="sbrsCl" value="무선인터넷">무선인터넷</label>
							<label><input type="checkbox" name="sbrsCl" value="장작판매">장작판매</label>
							<label><input type="checkbox" name="sbrsCl" value="온수">온수</label>
							<label><input type="checkbox" name="sbrsCl" value="마트.편의점">마트.편의점</label>						
						</li>												
					</ul>
				</div>
				</div>
				<div>
					<button id="searchCampinginfo" class="C_search" type="submit">캠핑장 검색</button>
				</div>				
			</div>	
			</form>
		</div>
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
		<ul class="pagination justify-content-center">
			<c:if test="${pVO.totalRecord > 0 }">
				<li class="page-item prevBtn">
					<a class="page-link" href="javascript:void(0);" onclick="prevBtn(${pVO.pageNum})">
						<i class="fa fa-angle-left"></i>
					</a>
				</li>
				
				<c:forEach var="p" begin="${pVO.startPage}" end="${pVO.startPage+pVO.onePageCount-1}">
				<c:if test="${p<=pVO.totalPage }">
						<c:choose>
							<c:when test="${p!=pVO.pageNum}">
								<li class="page-item">
									<a class="page-link"href="javascript:void(0);" onclick="pageNum(${p})">${p}</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item disabled"><a class="page-link">${p}</a></li>
							</c:otherwise>
						</c:choose>
				</c:if>				
				</c:forEach>
				
				<li class="page-item nextBtn">
					<a class="page-link" href="javascript:void(0);" onclick="nextBtn(${pVO.pageNum})">
						<i class="fa fa-angle-right"></i>
					</a>
				</li>
			</c:if>
		</ul>
	</div>
</div>