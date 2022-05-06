<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="${url}/js/member/memberForm.js"></script>
<link rel="stylesheet"  href="/css/member/memberForm.css" type="text/css"/>

<main>
    <section class="memberForm">
        <h3>회원가입</h3>
        <form method="post" action="/member/memberOk" id="mFrm" onsubmit="return MemberCheck()">
            <div>
                <input type="text" name="userid" id="userid" onkeyup="CheckId()" placeholder="아이디" required/>
                <span id="stateIdChk" class="state">아이디를 입력하세요</span>
            </div>
            <div>
                <input type="password" name="userpwd" id="userpwd" placeholder="비밀번호" required/>
            </div>
            <div>
                <input type="password" name="userpwd2" id="userpwd2" required/>
            </div>
            <div>
                <input type="text" name="nickname" id="nickname" onkeyup="CheckNick()" placeholder="닉네임" required/>
                <span id="stateNickChk" class="state">닉네임을 입력하세요</span>
            </div>
            <div>
                <input type="text" name="username" id="username" placeholder="이름" required/>
            </div>
            <div class="radio">
                <label>성별:&nbsp;&nbsp;&nbsp;</label>
                <label><input type="radio" name="gender" value="남" required>남</label>
                &nbsp;&nbsp;&nbsp;
                <label><input type="radio" name="gender" value="여" required>여</label>
            </div>
            <div class="userTel1">
                <select class="selectpicker" id="usertel1" name="usertel1" style="font-size: 0.72em;">
                    <option value="010">010</option>
                    <option value="02">02</option>
                    <option value="031">031</option>
                    <option value="041">041</option>
                </select>
            </div>
            <div class="tel">
                <input type="text" name="usertel2" id="usertel2" maxlength="9" placeholder="연락처" required/>
            </div>
            <div>
                <button class="btn"style="opacity: 70%; color: ivory; background-color: rgba(58, 71, 80, 1); width: 200px; height: 40px; font-size: 0.8em;" id="phoneChk" class="phoneChk" type="button" onclick="CheckTel()">인증번호 보내기</button>
            </div>
            <div>
                <input id="certNo" type="text" name="certNo" title="인증번호 입력" placeholder="인증번호 입력" required/>
                <span id="statePhoneChk" class="state" >번호 입력 후 인증번호 보내기를 해주십시오.</span>
            </div>
            <div>
                <button class="btn"style="opacity: 70%; color: ivory; background-color: rgba(58, 71, 80, 1); width: 5vm; height: 30px; font-size: 0.4em;"  id="certChk" class="certChk" type="button" onclick="CheckCode()">본인인증</button>
            </div>
            <div>
                <label>생년월일: </label>
                <input type='date' name='birth' value='birth' required/>
            </div>
            <div>
                <input type="text" name="email" id="email" placeholder="이메일" required/>
            </div>
            <div>
                <button type="submit" onclick="MemberCheck()">가입하기</button>
            </div>

        </form>
    </section>
</main>