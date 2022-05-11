$(function(){
	
	// 참여하기 버튼을 클릭하면 버튼이 참여취소 버튼이 생기고 gathermember DB insert, gather DB gnewno +1
	$("#gnewnoBtn1").click(function(){
		$("#gnewnoBtn1").removeClass();
		$("#gnewnoBtn1").addClass("btn gnewnoBtn2");
		$("#gnewnoBtn1").val("참여 취소");
		//$("#gnewnoBtn1").append("<input type='button' class='btn gnewnoBtn1' id='gnewnoBtn1' name='gnewno' value='캠핑 참여'>");
		
		$.ajax({
			url:'/gather/joinCamper',
			data:'gatherno='+$('#gatherno').val(),
			type:'GET',
			success:function(){
				alert("캠핑에 참여신청하였습니다.");
			},error:function(){
				console.log("캠핑 참여 에러");
			}
		});
	});
	
})