
 $(function() {
	
	//탑, 푸터 부분 가리기
	$("#header").css('display', 'none');
	$("#footer").css('display', 'none');
	
	//말풍선 작성자 닉네임 길이만큼만 너비값 설정
	var selNickLen = $("#sellerId").text().length;
	var buyNickLen = $("#buyerId").text().length;
	$("#sellerId").css('width', selNickLen +'em');
	$("#buyerId").css('width', buyNickLen +'em');
	
	//이후 생성되는 모든 말풍선의 작성자 닉네임칸 너비 통일
	$(".sellerId").css('width', $("#sellerId").css('width'));
	$(".buyerId").css('width', $("#buyerId").css('width'));
	
	
	//채팅방 영역 너비값 구하기 + 'px'단위제거 정수화
	var winWid = parseInt($("#chatting").css('width'), 10);
	
	var selText = 0;
	var buyText = 0;
	var right = 0;
	for(var i=1; i<=4; i++) {
		//각 말풍선의 글자수 length를 구함
		selText = $("#sellerText"+i).text().length;
		buyText = $("#buyerText"+i).text().length;

		//말풍선의 너비를 글자수 length에 맞게 설정
		$("#chatSeller"+i).css('width', selText+1+ 'em');
		$("#chatBuyer"+i).css('width', buyText+1+ 'em');

		//작성자(오른쪽) 말풍선의 너비값을 변수에 저장
		var selWid = parseInt($("#chatSeller"+i).css('width'), 10);
		alert($("#chatSeller"+i).css('width'));
		//말풍선의 너비에 따라 오른쪽으로 땡김
		right = selWid*1.11 - winWid;
		if(right < -271) right = -271;
		$("#chatSeller"+i).css('right', right);
		
	}
	
	
	
	
/*	
	
	//판매자 문구의 글자 개수를 변수에 저장
	var len = $(".chatSeller").text().length;
	//위에서 구한 글자수에 따라 말풍선 너비값 설정
	//$(".chatSeller").css('width', len+1+ 'em');
	
	//판매자 말풍선의 너비값을 변수에 저장
	var selWid = parseInt($(".chatSeller").css('width'), 10);
	//말풍선의 너비에 따라 오른쪽으로 땡김
	$(".chatSeller").css('right', selWid*1.2 -winWid);
	
	$(window).resize(function() {
		winWid = parseInt($("#chatting").css('width'), 10);
		selWid = parseInt($(".chatSeller").css('width'), 10);
		$(".chatSeller").css('right', selWid*1.2 -winWid);		
	});*/
	
})