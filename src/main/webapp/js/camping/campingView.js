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
				addimages(result.response.body.items.item);
			}
		})
	}
	
	function clickIntro(){
		$("#campIntro").show();
		$("#campGuide").hide();
		$("#campMap").hide();		
	}
	
	function clickGuide(){
		$("#campIntro").hide();
		$("#campGuide").show();
		$("#campMap").hide();		
	}
	
	function clickMap(){
		$("#campIntro").hide();
		$("#campGuide").hide();
		$("#campMap").show();				
	}
	
	//지도 api
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});
			
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };  
			
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
		