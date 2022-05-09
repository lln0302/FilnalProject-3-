<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="${url}/js/member/myPageMain.js"></script>
<script src='fullcalendar-scheduler/main.js'></script>
<link rel="stylesheet"  href="/css/member/myPageMain.css" type="text/css"/>
<link href='fullcalendar-scheduler/main.css' rel='stylesheet' />

<main>
    <section class="myPageMain">
        <div id="calender"></div>
        <nav class="main-menu">
            <ul>
                <li>
                    <a href="#">
                        <i class="fa fa-home fa-2x"><img class="icon" src="/img/member/iconMenu.png"/></i>
                        <span class="nav-text">
                        </span>
                    </a>

                </li>
                <li>
                    <a href="${url}/member/myPageMain">
                        <i class="fa fa-home fa-2x"></i>
                        <span class="nav-text">
                            마이페이지
                        </span>
                    </a>

                </li>
                <li class="has-subnav">
                    <a href="${url}/member/myPageCamping">
                        <i class="fa fa-laptop fa-2x"></i>
                        <span class="nav-text">
                            참여한 캠핑
                        </span>
                    </a>

                </li>
                <li class="has-subnav">
                    <a href="${url}/member/myPageOpenedCamping">
                        <i class="fa fa-list fa-2x"></i>
                        <span class="nav-text">
                            개설한 캠핑
                        </span>
                    </a>

                </li>
                <li class="has-subnav">
                    <a href="${url}/member/myPageLikeList">
                        <i class="fa fa-folder-open fa-2x"></i>
                        <span class="nav-text">
                            좋아요 목록
                        </span>
                    </a>

                </li>

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