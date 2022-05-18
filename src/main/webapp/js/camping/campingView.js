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
	}
	

	
	
		