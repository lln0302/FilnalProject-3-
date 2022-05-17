axios.interceptors.request.use((request) => { //ajax interceptor
    document.getElementById("showStateFindPwd").innerText = "요청을 서버에 전송중입니다...";
    document.getElementById("findPwdButton").disabled = true; //요청을 가로채서 요청 버튼을 disabled하고 메세지 출력
    return request;
}, function (error) {
    return Promise.reject(error);
});

function findUserid() {
    const username = document.getElementById("username");
    const usertel = document.getElementById("usertel")
    if(!username.value) {
        alert("이름을 입력해주세요");
        return false;
    }
    if(!usertel.value) {
        alert("전화번호를 입력해주세요");
        return false;
    }
    const body = {
        username : username.value,
        usertelP : usertel.value
    }
    axios.post("/member/findUserid", body)
        .then((res) =>{
            if(res.data ==='') {
                document.getElementById("showStateFindId").innerText = "일치하는 회원정보가 없습니다";
                document.getElementById("showStateFindId").className ="state";
            } else {
                const encryptionUserId = res.data.userid.replace(/(?<=.{3})./gi, "*");
                document.getElementById("showStateFindId").innerText = `찾으시는 아이디는 ${encryptionUserId} 입니다`;
                document.getElementById("showStateFindId").className ="stateOk";
            }
            document.getElementById("showStateFindPwd").innerText = "가입시 입력한 아이디와 이메일을 입력해주세요";
            document.getElementById("showStateFindPwd").className ="state";
            document.getElementById("findPwdButton").disabled = false;
        })
        .catch((res) => {
            console.log("error");
            console.log(res);
        })
}

function IsValidEmail() {
    const userid = document.getElementById("userid");
    const email = document.getElementById("email");
    if(!userid.value) {
        alert("아이디를 입력해주세요");
        return false;
    }
    if(!email.value) {
        alert("이메일을 입력해주세요");
        return false;
    }
    const body = {
        userid : userid.value,
        email : email.value
    }
    axios.post("/member/isValidEmail", body)
        .then((res) =>{
            if(res.data ==='') {
                document.getElementById("showStateFindPwd").innerText = "유효하지 않은 회원정보입니다";
                document.getElementById("showStateFindPwd").className ="state";
                document.getElementById("findPwdButton").disabled = false;
            } else {
                FindUserPwd();
            }
        })
        .catch((res) => {
            console.log("error");
            console.log(res);
        })
}
function FindUserPwd() {
    const userid = document.getElementById("userid");
    const email = document.getElementById("email")
    const body = {
        userid : userid.value,
        email : email.value
    }
    axios.post("/member/findUserPwd", body)
        .then((res) => {
            console.log(res);
            document.getElementById("showStateFindPwd").innerText = "이메일로 임시 비밀번호가 전송되었습니다";
            document.getElementById("showStateFindPwd").className ="stateOk";
        })
        .catch((res) => {
            console.log("error");
            console.log(res)
        })
}
