<script src="${url}/js/member/loginForm.js"></script>
<link rel = "stylesheet" href="/css/member/loginForm.css" type="text/css"/>
<main>
    <section class="loginForm">
        <div id="log">
            <h1>Login</h1>
            <form method="post" action="/member/loginOk" id="logFrm">
                <div>
                    <input type="text" name="userid" id="userid" required/>
                    <label for="userid">ID</label>
                </div>
                <div>
                    <input type="password" name="userpwd" id="userpwd" autocomplete="off" required>
                    <label for="userpwd">Password</label>
                </div>
                <div>
                    <button type="button" value="로그인" onclick="LogFormCheck()">Login</button>
                </div>
                <div>
                    <a href ="${url}/member/memberFind">아이디/비밀번호 찾기</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                    <a href ="${url}/member/memberForm">회원가입 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </div>
            </form>
        </div>
    </section>
</main>