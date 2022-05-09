<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="${url}/js/member/memberForm.js"></script>
<link rel="stylesheet"  href="/css/member/memberForm.css" type="text/css"/>

<main>
    <section class="memberForm">
        <h1>SIGN-UP</h1>
        <hr style="width: 20vw; margin-top: 2vh; margin-bottom: 3vh; border: 1px solid rgba(20, 20, 20, 65%)"/>
        <form method="post" action="/member/memberOk" id="mFrm" onsubmit="return MemberCheck()">
            <div>
                <input class="input-text" type="text" name="userid" id="userid" onkeyup="CheckId()" placeholder="아이디" required/>
                <br/>
                <span id="stateIdChk" class="state">아이디를 입력하세요</span>
            </div>
            <div>
                <input class="input-text" type="password" name="userpwd" id="userpwd" placeholder="비밀번호" required/>
            </div>
            <div>
                <input class="input-text" type="password" name="userpwd2" id="userpwd2" placeholder="비밀번호 확인" required/>
            </div>
            <div>
                <input class="input-text" type="text" name="nickname" id="nickname" onkeyup="CheckNick()" placeholder="닉네임" required/>
                <br/>
                <span id="stateNickChk" class="state">닉네임을 입력하세요</span>
            </div>
            <div>
                <input class="input-text" type="text" name="username" id="username" placeholder="이름" required/>
            </div>
            <div class="gender">
                <label style="position: relative; left: 0.7vw;">성별:</label>
                <input type="radio" name="gender" value="남" id="gender" required/><label for="gender"> 남</label>
                <input type="radio" name="gender" value="여" id="gender2" required/><label for="gender2"> 여</label>
            </div>

            <div class="tel">
                <select class="selectpicker" id="usertel1" name="usertel1" style="height: 5vh; background-color: rgba(50, 50, 50, 40%); color: dimgray; border: 0; width: 3vw;">
                    <option value="010">010</option>
                    <option value="02">02</option>
                    <option value="031">031</option>
                    <option value="041">041</option>
                </select>
                <input class="input-text3" type="text" name="usertel2" id="usertel2" maxlength="9" placeholder="연락처" required/>
            </div>
            <div>
                <button class="send" id="phoneChk" class="phoneChk" type="button" onclick="CheckTel()">인증번호 보내기</button>
            </div>
            <div style="position: relative; bottom: 5vh;">
                <input class="input-text2" id="certNo" type="text" name="certNo" title="인증번호 입력" placeholder="인증번호 입력" required/>
                <br/>
                <span id="statePhoneChk" class="state" >번호 입력 후 인증번호 보내기를 해주십시오.</span>
            </div>
            <div>
                <button class="certification" id="certChk" class="certChk" type="button" onclick="CheckCode()">본인인증</button>
            </div>
            <div style="position: relative; bottom: 11vh;">
                <label style="color: dimgray">생년월일: </label>
                <input class="input-text4" type='date' name='birth' value='birth' required/>
            </div>
            <div style="position: relative; bottom: 11vh;">
                <input class="input-text" type="text" name="email" id="email" placeholder="이메일" required/>
            </div>
            <div>
                <button class="join-btn" type="submit" onclick="MemberCheck()">가입하기</button>
            </div>

        </form>
    </section>
</main>