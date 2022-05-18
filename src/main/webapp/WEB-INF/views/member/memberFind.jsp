<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- css와 js 적용 -->
<script src="${url}/js/member/memberFind.js"></script>
<link rel = "stylesheet" href="/css/member/memberFind.css" type="text/css"/>
<!-- 부트스트랩 사용을 위한 스타일 시트와 스크립트 임포트 -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">



<main>
    <section class="memberFind">
        <div id="log">
            <!-- 메뉴 -->
            <ul class="nav nav-pills" style="background: none; border: none; box-shadow: none;">
                <li class="nav-item"><a href="#t1" class="nav-link active" data-toggle="tab" style="text-align: center; position: relative; margin-right: 10px; top: 6vh; width: 9vw; background: none; border: 1px solid dimgray;">아이디 찾기&nbsp;</a></li>
                <li class="nav-item"><a href="#t2" class="nav-link"  data-toggle="tab" style="text-align: center; position: relative; top: 6vh; width: 9vw; background: none; border: 1px solid dimgray;">비밀번호 찾기</a></li>
            </ul>
            <!-- 콘텐츠 -->
            <div class="tab-content">
                <div id="t1" class="tab-pane active"><!-- 메뉴당 내용 -->
                    <h1>아이디 찾기</h1>
                    <hr style="width: 20vw; margin-top: 2vh; margin-bottom: 3vh; border: 1px solid rgba(20, 20, 20, 65%)"/>
                    <form id="logFrm">
                        <div>
                            <input class="input-text" type="text" name="username" id="username" placeholder="회원이름" autocomplete="off" required/>
                        </div>
                        <div >
                            <input class="input-text" type="text" name="usertel" id="usertel" placeholder="전화번호" autocomplete="off" required>
                            <br/>
                            <span id="showStateFindId" class="state">가입시 입력한 이름과 전화번호를 입력해주세요</span>
                        </div>
                        <div>
                            <button class="find-btn" type="button" value="아이디 찾기" onclick="findUserid()">아이디 찾기</button>
                        </div>
                        <div class="showStateFindId">
                        </div>
                        <div class="bottom-menu">
                            <a class="join-tag" href ="${url}/member/memberForm">회원가입</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </div>
                    </form>
                </div>
                <!-- 비밀번호 찾기 탭 -->
                <div id="t2" class="tab-pane"><!-- 메뉴당 내용 -->
                    <h1>비밀번호 찾기</h1>
                    <hr style="width: 20vw; margin-top: 2vh; margin-bottom: 3vh; border: 1px solid rgba(20, 20, 20, 65%)"/>
                    <form id="logFrm">
                        <div>
                            <input class="input-text" type="text" name="userid" id="userid" placeholder="아이디" autocomplete="off" required/>
                        </div>
                        <div>
                            <input class="input-text" type="text" name="email" id="email" placeholder="이메일" autocomplete="off" required>
                            <br/>
                            <span id="showStateFindPwd" class="state">가입시 입력한 아이디와 이메일을 입력해주세요</span>
                        </div>
                        <div>
                            <button class="find-btn" id="findPwdButton" type="button" value="비밀번호 찾기" onclick="IsValidEmail()">비밀번호 찾기</button>
                        </div>
                        <div class="bottom-menu">
                            <a class="join-tag" href ="${url}/member/memberForm">회원가입</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>



</main>



