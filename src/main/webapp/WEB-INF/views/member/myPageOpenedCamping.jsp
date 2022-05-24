<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="${url}/js/member/myPageOpenedCamping.js"></script>
<link rel="stylesheet"  href="/css/member/myPageMain.css" type="text/css"/>


<main>
    <section class="myPageMain">
        <div class="container">
           <h2>개설한 캠핑</h2>
        <hr style="position: relative; bottom: 5px;"/>
        </div>
            <div class="table">
                <table class="table table-bordered"  width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>글쓴이</th>
                        <th>장소</th>
                        <th>등록일</th>
                    </tr>
                    </thead>

                    <c:forEach var="op" items="${myPageOpenedCamping }">
                        <c:if test="${nickname == op.nickname}">
                        <tr>
                            <td>${op.gatherno}</td>
                            <td><a href="/gather/gatherView?gatherno=${op.gatherno}">${op.title }</a></td>
                            <td>${op.nickname }</td>
                            <td>${op.place }</td>
                            <td>${op.createdate }</td>
                        </tr>
                        </c:if>
                    </c:forEach>

                </table>
                <nav aria-label="Page navigation example">
                    <ul class="pagination">
                        <li class="page-item">
                            <c:if test="${pVO.pageNum==1}">
                            <a class="page-link" href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                            </c:if>
                            <c:if test="${pVO.pageNum>1}">
                        <li>
                            <a class="page-link" aria-label="Previous" href="${url}/member/myPageOpenedCamping?pageNum=${pVO.pageNum-1}<c:if test='${pVO.searchWord != null}'>&searchKey=${pVO.searchKey }&searchWord=${pVO.searchWord }</c:if>">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        </c:if>
                        </li>
                        <!--  페이지 번호                 1,5      6,10         11,15-->
                        <c:forEach var="p" begin="${pVO.startPage}"
                                   end="${pVO.startPage+pVO.onePageCount-1}">
                            <!--  총 페이지수보다 출력할 페이지번호가 작을때 -->
                            <c:if test="${p <= pVO.totalPage}">
                                <c:if test="${p == pVO.pageNum}">
                                    <li class="page-item">
                                </c:if>
                                <c:if test="${p != pVO.pageNum}">
                                    <li class="page-item">
                                </c:if>
                                <a class="page-link" href="${url}/member/myPageOpenedCamping?pageNum=${p}<c:if test='${pVO.searchWord != null}'>&searchKey=${pVO.searchKey }&searchWord=${pVO.searchWord }</c:if>">
                                        ${p}
                                </a>
                                </li>
                            </c:if>
                        </c:forEach>
                        <c:if test="${pVO.pageNum==pVO.totalPage}">
                            <li class="page-item">
                                <a class="page-link" aria-label="Next" href="#">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${pVO.pageNum<pVO.totalPage}">
                            <li class="page-item">
                                <a class="page-link" aria-label="Next" href="${url}/member/myPageOpenedCamping?pageNum=${pVO.pageNum+1}<c:if test='${pVO.searchWord != null}'>&searchKey=${pVO.searchKey }&searchWord=${pVO.searchWord }</c:if>">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>
                    </ul>
                </nav>
        </div>
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