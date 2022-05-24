<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="/js/member/myPageEdit.js"></script>
<link rel="stylesheet"  href="/css/member/myPageMain.css" type="text/css"/>

<!-- 화면 해상도에 따라 글자 크기 대응(모바일 대응) -->
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">





<main>
    <section class="myPageMain">
        <h1>회원정보 수정</h1>
        <hr style="width: 20vw; margin-top: 2vh; margin-bottom: 3vh; border: 1px solid rgba(250, 250, 250, 65%)"/>
        <form method="post" action="/member/memberEditOk" id="mFrm" onsubmit="return MemberEditCheck()">
            <div>
                <input class="input-text" type="text" name="userid" id="userid" value="${vo.userid}"  readonly/>
            </div>
            <div>
                <input class="input-text" type="text" name="nickname" id="nickname" value="${vo.nickname}" required/>
            </div>
            <div>
                <input class="input-text" type="password" name="userpwd" id="userpwd" placeholder="비밀번호" required/>
            </div>
            <div>
                <input class="input-text" type="password" name="userpwd2" id="userpwd2" placeholder="비밀번호 확인" required/>
            </div>
            <div>
                <input class="input-text" type="text" name="username" id="username" value="${vo.username}" placeholder="이름" required />
            </div>
            <div>
                <input class="input-text" type="text" name="usertel" id="usertel" value="${vo.usertel}"  readonly/>
            </div>
            <div>
                <input class="input-text" type='date' name='birth' value="${vo.birth}" placeholder="생년월일" required/>
            </div>
            <div>
                <input class="input-text" type="text" name="gender" value="${vo.gender}" readonly>
            </div>
            <div>
                <input class="input-text" type="text" name="email" id="email" value="${vo.email}" required/>
            </div>
            <div>
                <button class="btn" type="submit">수정하기</button>
            </div>
            <div>
                <button class="btn" type="button" onclick="MemberDelete()">탈퇴하기</button>
            </div>
        </form>

        <nav class="main-menu">
            <ul>
                <li>
                    <a href="${url}/member/myPageMain">
                        <i class="fa fa-home fa-2x"></i>
                        <span class="nav-text">
                            마이페이지
                        </span>
                    </a>

                </li>
                <li>
                    <a href="${url}/member/myPageEdit">
                        <i class="fa fa-cog fa-2x"></i>
                        <span class="nav-text">
                            회원정보수정
                        </span>
                    </a>

                </li>
                <li class="has-subnav">
                    <a href="${url}/member/myPageCamping">
                        <i class="fa fa-campground fa-2x"></i>
                        <span class="nav-text">
                            참여한 캠핑
                        </span>
                    </a>

                </li>
                <li class="has-subnav">
                    <a href="${url}/member/myPageOpenedCamping">
                        <i class="fa fa-map fa-2x"></i>
                        <span class="nav-text">
                            개설한 캠핑
                        </span>
                    </a>

                </li>
<%--                <li class="has-subnav">--%>
<%--                    <a href="${url}/member/myPageLikeList">--%>
<%--                        <i class="fa fa-thumbs-up fa-2x"></i>--%>
<%--                        <span class="nav-text">--%>
<%--                            좋아요 목록--%>
<%--                        </span>--%>
<%--                    </a>--%>

<%--                </li>--%>

            </ul>

            <ul class="logout">
                <li>
                    <a href="#">
                        <i class="fa fa-power-off fa-2x"></i>
                        <span class="nav-text">
                            Logout
                        </span>
                    </a>
                </li>
            </ul>
        </nav>
    </section>
</main>