$(()=>{
		//menu 이미지 클릭시 메뉴 보이게 하는 이벤트.
		
		//텍스트 배율에 따라 변경
		let pr = window.devicePixelRatio;
		var menuCheck=true;
		
		if(pr==1.25){
		   menuCheck=false;
		   $('.menuExpansion').css('width','0px');
		}
		$(".menu_img").click(function(){
			//console.log('클릭이벤트 발생');
			if(menuCheck==false){
				$(".menuExpansion").css('width','300px').css('transition-duration','0.3s');	
				menuCheck=true;
			}else{
				$(".menuExpansion").css('width','0px').css('transition-duration','0.3s');	
				menuCheck=false;
			}
		});
	});