$(function(){
	
	// 캠퍼 참여 인원 표시 함수
	function gnewnoCount(){
		$.ajax({
			url:'/gather/gnewnoCount',
			data:"gatherno="+$("#gatherno").val(),
			success:function(result){
				$("#gnewno").children().html(result)
			}
		});
	}
	
	// 캠핑 참여하는 캠퍼 리스트
	function camperList(){
		$.ajax({
			url:'/gather/showCamperList',
			data:$("#joinCamperForm").serialize(),
			success:function(result){
				let body = "";
				$.each(result, function(idx, vo){
					body +="<tr><td>"+vo.nickname+"</td>";
					body += "<td>"+vo.gender+"</td></tr>";
				});
				$("#tbody").html(body);
			}
		})
	}
	
	// 참여하기 버튼을 클릭하면 버튼이 참여취소 버튼이 생기고 gathermember DB insert, gather DB gnewno +1
	$("#gnewnoBtn1").click(function(event){
		event.preventDefault();
		if(!$("#gnewnoBtn1").hasClass("separate")){
			$.ajax({
				url:'/gather/plusGatherCamper',
				data:$("#joinCamperForm").serialize(),
				type:'GET',
				success:function(){
					alert("캠핑에 참여신청하였습니다.");
					gnewnoCount();
					$("#gnewnoBtn1").addClass("separate");
					$("#gnewnoBtn1").val("캠핑 취소");
					camperList();
				}
			});
		}else{// 참여 취소 버튼을 누르면 gathermemeber DB delete, gatherDB gnewno -1
			if(confirm('캠핑 참여를 취소하시겠습니까?')){
				$.ajax({
					url:'/gather/minusGatherCamper',
					data:"gatherno="+$("#gatherno").val(),
					type:'GET',
					success:function(){
						alert("캠핑참여가 취소되었습니다.");
						gnewnoCount();
						$("#gnewnoBtn1").removeClass("separate");
						$("#gnewnoBtn1").val("캠핑 참여");
						camperList();
					}
				});
			}
		}
	});
	
	camperList()
});