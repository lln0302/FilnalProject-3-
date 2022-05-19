$(()=>{
		//menu 이미지 클릭시 메뉴 보이게 하는 이벤트.
		
		//텍스트 배율에 따라 변경
		let pr = window.devicePixelRatio;
		var menuCheck=true;
		
		let localURL = window.location;
		let dashboard = "http://localhost:8090/admin/adminMain";
		let members = "http://localhost:8090/admin/adminMembers";
		let membersInfo = "http://localhost:8090/admin/adminMembersInfo";
		let campList = "http://localhost:8090/admin/adminCampList";
		let addCamperList = "http://localhost:8090/admin/adminAddCamperList";
		let autoCampList = "http://localhost:8090/admin/adminAutoCampList";
		let shareList = "http://localhost:8090/admin/adminShareList";
		let reviewList = "http://localhost:8090/admin/adminReviewList";
		let gatherCommentList = "http://localhost:8090/admin/adminGatherCommentList";
		let carCommentList = "http://localhost:8090/admin/adminCarCommenList";
				
		if(pr==1.25){
		   menuCheck=false;
		   $('.menuExpansion').css('width','0px');
		}else if(	localURL != dashboard
				 && localURL != members
				 && localURL != campList
				 && localURL != addCamperList
				 && localURL != autoCampList
				 && localURL != shareList
				 && localURL != reviewList
				 && localURL != commentList
				 ) {
			menuCheck=true;
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

/*
$(document).ready(function(){
	$("#members_img").hover(
		function(){
			$("#menu_img_members").attr({src:"/img/admin/adminLeftTap1/members_red.PNG"});
		},
		function(){
			$("#menu_img_members").attr({src:"/img/admin/adminLeftTap1/members.PNG"});
		}
	)
})
*/