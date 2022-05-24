<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="${url}/js/member/myPageMain.js"></script>
<link rel="stylesheet"  href="/css/member/myPageMain.css" type="text/css"/>

<main>
    <section class="myPageMain">
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