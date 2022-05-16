function MemberEditCheck() {
    const userpwd = document.getElementById("userpwd");
    const userpwd2 = document.getElementById("userpwd2")
    var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
    if(!userpwd.value || !userpwd2.value){
        alert("비밀번호를 입력하세요");
        userpwd.focus();
        return false;
    }
    if(userpwd.value!=userpwd2.value){
        alert("비밀번호가 일치하지 않습니다.");
        userpwd.focus();
        return false;
    }
    if(!pwdCheck.test(userpwd.value)) {
        alert("비밀번호는 영문, 숫자, 특수기호를 조합으로 8~25자를 입력해야합니다.");
        userpwd.focus();
        return false;
    }
    const username = document.getElementById("username")
    if(!username.value) {
        alert("이름을 입력하세요");
        username.focus();
        return false;
    }
    const nickname = document.getElementById("nickname")
    if(!nickname.value){
        alert("닉네임을 입력하세요");
        nickname.focus();
        return false;
    }
    const email = document.getElementById("email")
    var emailCheck = /^[a-z0-9\.\-_]+@([a-z0-9\-]+\.)+[a-z]{2,6}$/;
    if(!email.value){
        alert("이메일을 입력해주세요.");
        email.focus();
        return false;
    }
    if(!emailCheck.test(email.value)) {
        alert("이메일 형식으로 입력해주세요.")
        email.focus();
        return false;
    }
}
function MemberDelete(){
    const userid = document.getElementById("userid")
    const userpwd = document.getElementById("userpwd");
    const userpwd2 = document.getElementById("userpwd2")
    const body = {
        userid : userid.value,
        userpwd : userpwd.value
    }
    if(confirm("정말로 탈퇴하시겠습니까?")) {
        axios.post("/member/MemberDelete", body)
            .then((res) => {
                if(res.data===0){
                    alert("비밀번호를 확인해주세요")
                } else {
                    alert("이용해주셔서 감사합니다");
                    window.location="/member/logout";
                }
            })
            .catch((res) => {
                alert(res);
                alert("에러 발생. 운영자에게 문의해주세요")
            })
    }
}