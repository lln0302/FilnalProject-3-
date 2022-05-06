<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="${url}/js/member/loginForm.js"></script>
<link rel = "stylesheet" href="/css/member/loginForm.css" type="text/css"/>
<main>
    <h2>로그인</h2>
    <section class="loginForm">
        <div id="log">
            <h1>LOGIN</h1>
            <form method="post" action="/member/loginOk" id="logFrm">
                <div>
                    <input class="input-text" type="text" name="userid" id="userid" placeholder="아이디" required/>
                </div>
                <div>
                    <input class="input-text" type="password" name="userpwd" id="userpwd" autocomplete="off" placeholder="비밀번호" required>
                </div>
                <div>
                    <button class="login-btn" type="button" value="로그인" onclick="LogFormCheck()">로그인</button>
                </div>
                <div>
                    <button class="find-btn"><a class="find-a" href ="${url}/member/myPageFind">아이디 / 비밀번호 찾기</a></button>
                    <button class="join-btn"><a class="find-a" href ="${url}/member/memberForm">회원가입</a></button>
                </div>
            </form>
        </div>
    </section>
</main>