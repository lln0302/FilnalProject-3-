$(function(){
	
	// 댓글 리스트
	function replyList(){
		let url = "/gather/replyList"
		let data = "gatherno="+$('#gatherno').val();
		$.ajax({
			url:url,
			data:data,
			success:function(success){
				let sucResult = $(success);
				
				let body = "<div>";
				$.each(sucResult, function(idx, item){
					
				});
				
			},error:function(){
				alert('show list error');
			}
		});
	}
	
});