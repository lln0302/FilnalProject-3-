$(function(){
		
	
	// datepicker 설정
	$("#startdate, #enddate").datepicker({
		dateFormat: 'yy-mm-dd',  // Input Display Format 변경
		changeMonth: true,       // select 문으로 월 선택 가능  
		changeYear: true, 		 // select 문으로 년 선택 가능
		minDate: new Date(),     // 오늘 날짜부터 설정가능
		prevText: '이전 달',       // datepicker 한글로
	    nextText: '다음 달',
	    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    dayNames: ['일','월','화','수','목','금','토'],
	    dayNamesShort: ['일','월','화','수','목','금','토'],
	    dayNamesMin: ['일','월','화','수','목','금','토'],
	    yearSuffix: '년',
	});
	
	
	// 글 등록폼에 빈칸으로 두면 alert 설정
	$("#writeForm").submit(function(){
		if($("#gatherTitle").val()==''){
			alert("제목을 입력해주세요");
			return false;
		}
		if($("#number").val()=='' || $("#number").val()==0){
			alert("모집인원을 입력해주세요");
			return false;
		}
		if($("#datepicker1, #datepicker2").val()==''){
			alert("일정을 입력해주세요");
			return false;
		}
		if(CKEDITOR.instances.content.getData()==''){
			alert("내용을 입력해주세요");
			return false;
		}
	});
	
	// 글 등록폼에 적은 내용 다 취소하기
	$("#resetBtn").on('click', function(){
		CKEDITOR.instances.content.setData("");
	})

	// 리스트로 되돌아가기 버튼
	$("#showList").click(function(){
		location.href="/gather/gatherList";
	});
	
	// CKEditor 이미지
	CKEDITOR.replace("content", {
		height:'500px',
		filebrowserUploadUrl:'/gather/imageUpload', // 이미지 업로드
		//filebrowserUploadMethod:'form',
		extraPlugin:'autograw',
		extraPlugin:'confighelper',
	});
	
	// CKEditor 이미지 탭 설정(이미지 모달창에서 불필요한 부분 제거)
	CKEDITOR.on('dialogDefinition', function(ev){
		let dialogName = ev.data.name;
		let dialog = ev.data.definition.dialog;
		let dialogDefinition = ev.data.definition;
		
		if(dialogName=='image'){
			dialog.on('show', function(){
				this.selectPage('Upload'); // 이미지 클릭시 업로드탭으로 시작
			});
			dialogDefinition.removeContents('advanced'); // 자세히 탭 제거
			dialogDefinition.removeContents('Link'); // 링크탭 제거 
		}
	});
	
	//window.parent.CKEDITOR.tools.callFunction(1, "${url}", "전송완료");

});