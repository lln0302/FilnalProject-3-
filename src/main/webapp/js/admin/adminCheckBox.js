$(function(){
		
		//리스트 체크하기
		$("#allCheck").click(function(){
			$(".chk").prop("checked", $("#allCheck").prop("checked"));
		});
		
		$("#multiDel").click(function(){
			var cnt = 0;
			$(".chk").each(function(i, obj){
				if(obj.checked){
					cnt++;//checkbox가 체크 상태일 때...
				}
			});
			if(cnt<=0){ // or cnt<1
				alert("목록을 선택 후 삭제하세요..")
				return false;
			}
			$("#listMenuFrm").submit();
		});
	});