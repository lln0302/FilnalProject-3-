	//지역 검색
	$('document').ready(function(){
		var area0 = ["서울시", "부산시", "대구시", "인천시", "광주시", "대전시", "울산시", "세종시", "경기도", "강원도", "충청북도", "충청남도", "전라북도", "전라남도", "경상북도", "경상남도", "제주도"];
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
			$selsido.append("<option value=''>시/도 선택</option>");
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
	
	// 상세검색 on, off
	function detailSearch(){
		if($('#searchbox').css('display') != 'none'){
			$('#searchbox').hide();
			$('#tagSearch').show();			
		}
		else{
			$('#tagSearch').hide();
			$('#searchbox').show();			
		}
	}

	//태그 검색 on, off
	function tagSearch(){
		if($('#tagSearch').css('display') == 'none'){
			$('#searchbox').hide();
			$('#tagSearch').show();			
		}else{			
			$('#tagSearch').hide();
			$('#searchbox').show();
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
	
	//태그버튼 누름 효과	
	
	//페이징
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
