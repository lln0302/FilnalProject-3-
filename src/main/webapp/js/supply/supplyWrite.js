/**
 * 
 */

// 이미지 미리보기
$(document).on("change", '#thumbnailImg', function() {
	setImageFromFile(this, "#swImg");
});

function setImageFromFile(input, expression) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			$(expression).attr('src', e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
}

// 

$("#swImgWrap").click(function() {
	$("#thumbnailImg").trigger("click");
	$("#img_upload_phr").css("display", "none");
})


function imgCheck() {
	if($("#swName").val()=="") {
		alert("제목을 입력해주세요!");
		return false;
	}
	if($("#swImg").attr("src")=="") {
		alert("대표 이미지를 추가해주세요!!");
		return false;
	}
	
	document.getElementById("swFrm").submit();
}