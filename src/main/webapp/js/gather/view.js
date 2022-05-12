$(function(){
	
	// 캠퍼 참여 인원 표시 함수
	function gnewnoCount(){
		$.ajax({
			url:'/gather/gnewnoCount',
			data:"gatherno="+$("#gatherno").val(),
			success:function(result){
				$("#gnewno").children().html(result)
			},error:function(){
				alert("참여인원 표시 에러")
			}
		});
	}
	
	
	// 참여하기 버튼을 클릭하면 버튼이 참여취소 버튼이 생기고 gathermember DB insert, gather DB gnewno +1
	$("#gnewnoBtn1").click(function(event){
		event.preventDefault();
		$.ajax({
			url:'/gather/plusGatherCamper',
			data:$("#joinCamperForm").serialize(),
			type:'GET',
			success:function(){
				alert("캠핑에 참여신청하였습니다.");
				$("#gnewnoBtn1").css("display","none");
				let body = "<input type='button' class='btn' id='gnewnoBtn2' value='캠핑 취소'>";
				$("#btnDiv").html(body);
				gnewnoCount();
			},error:function(){
				console.log("캠핑 참여 에러");
			}
		});
	});
	
	// 참여 취소 버튼을 누르면 gathermemeber DB delete, gatherDB gnewno -1
	$("#gnewnoBtn2").click(function(){
		if(confirm('캠핑 참여를 취소하시겠습니까?')){
			$.ajax({
				url:'/gather/minusGatherCamper',
				data:$("#joinCamperForm").serialize(),
				type:'GET',
				success:function(){
					alert("캠핑 참여에 취소되었습니다.");
					$("#gnewnoBtn1").removeClass();
					$("#gnewnoBtn1").addClass("btn gnewnoBtn1");
					$("#gnewnoBtn1").val("참여 신청");
				},error:function(){
					console.log("캠핑 취소 에러")
				}
			});
		}
	});
	
})