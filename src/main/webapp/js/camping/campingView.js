//api 이미지 DB저장
	function addimages(result){
		$.ajax({
			type : 'post',
			url : '/camping/addimages',
			contentType : 'application/json; charset=UTF-8',
			data : JSON.stringify(result),
			async : false,
			success : function(res){				
			},
			error : function(e){
				alert(e.responseText);
			}
		})
	}	
	
	//이미지리스트 api 받아오기
	function Listupcampingimages(contentId){		
		$.ajax({
			type : 'get',
			url : "http://api.visitkorea.or.kr/openapi/service/rest/GoCamping/imageList?ServiceKey=aP86zX%2BZyECfP94oWJpuGYSq%2FU4SWkv8At%2FwBv6YUfMepr6LdpZutU23EH2VFkgws6DngpHe0crNKiYVnVOmuQ%3D%3D&MobileOS=ETC&MobileApp=AppTest&numOfRows=30&contentId="+contentId+"&_type=json",
			success : function(result){				
				console.log(result);
				if(parseInt(result.response.body.totalCount)>0){
				   addimages(result.response.body.items.item);
				   }
			}
		})
	}
	
	function clickIntro(){
		$("#campIntro").show();		
		$("#campGuide").hide();
		$("#campMap").hide();	
		$("#campReview").hide();	
	}
	
	function clickGuide(){
		$("#campIntro").hide();
		$("#campGuide").show();
		$("#campMap").hide();
		$("#campReview").hide();		
	}
	
	function clickMap(){		
		$("#campIntro").hide();
		$("#campGuide").hide();
		$("#campMap").show();	
		$("#campReview").hide();

		var addr = $('#infobox').find("td:eq(0)").text();
		var fcltNm = $('#campingTitle').find("span").text();					
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(addr, function(result, status) {
		
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
		
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+fcltNm+'</div>'
		        });
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		}); 	
		map.relayout();			
	}