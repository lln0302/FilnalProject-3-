<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="${url}/js/member/loginForm.js"></script>
<link rel = "stylesheet" href="/css/member/loginForm.css" type="text/css"/>
<main>
    <section class="loginForm">
        <div id="log">
            <h1>SIGN-IN</h1>
            <hr style="width: 20vw; margin-top: 2vh; margin-bottom: 3vh; border: 1px solid rgba(20, 20, 20, 65%)"/>
            <form method="post" action="/member/loginOk" id="logFrm">
                <div>
                    <i></i><input class="input-text" type="text" name="userid" id="userid" placeholder="아이디" required/>
                </div>
                <div>
                    <input class="input-text" type="password" name="userpwd" id="userpwd" autocomplete="off" placeholder="비밀번호" required>
                </div>
                <div>
                    <button class="login-btn" type="button" value="로그인" onclick="LogFormCheck()">로그인</button>
                </div>
                <div>
                    <a class="join-a" href ="${url}/member/memberForm">회원가입</a>
                    <a class="find-a" href ="${url}/member/memberFind">ID/PW 찾기</a>
                </div>
            </form>
        </div>
    </section>
</main>