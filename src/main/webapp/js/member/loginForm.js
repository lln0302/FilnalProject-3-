function LogFormCheck(){
    //변수 설정
    var id = document.getElementById("userid");
    var pwd= document.getElementById("userpwd");


    //입력 공백시 return false
    if(id.value==""){
        alert("아이디를 입력하세요");
        id.focus();
        return false;
    }
    if(document.querySelector("#userpwd").value==""){
        alert("비밀번호를 입력하세요.");
        document.querySelector("#userpwd").focus();
        return false;
    }
    document.getElementById("logFrm").submit();
}
function enterLogin() {
	if(window.event.keyCode == 13) {
		LogFormCheck();
	}
}