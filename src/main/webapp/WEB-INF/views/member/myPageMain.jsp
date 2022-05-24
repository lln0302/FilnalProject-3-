<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="/js/member/myPageMain.js"></script>
<link rel="stylesheet"  href="/css/member/myPageMain.css" type="text/css"/>
<!--풀캘린더-->
<!-- 화면 해상도에 따라 글자 크기 대응(모바일 대응) -->
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<!-- jquery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- fullcalendar CDN -->
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<!-- fullcalendar 언어 CDN -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>




<main>
    <section class="myPageMain">
        <div id='calendar' class="calendar" style="padding: 25px;"></div>
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