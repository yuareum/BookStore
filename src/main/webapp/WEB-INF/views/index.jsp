<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-02
  Time: 오후 1:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>온라인 회원제 서점</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
    <style>
        body{
         width: 100%;
        }
    </style>
    <header>
        <nav>
            <ul class="nav justify-content-end">
                <li class="nav-item">
                    <a class="nav-link" href="/">Home</a>
                </li>
                <li class="nav-item">
                    <c:if test="${empty sessionScope.loginMemberId}">
                        <a class="nav-link" href="/member/save">회원가입</a>
                    </c:if>
                </li>
                <li class="nav-item">
                    <c:if test="${empty sessionScope.loginMemberId}">
                        <a class="nav-link" href="/member/login">로그인</a>
                    </c:if>
                </li>
                <li class="nav-item">
                    <c:if test="${!empty sessionScope.loginMemberId}">
                        <a class="nav-link" href="/member/logout">로그아웃</a>
                    </c:if>
                </li>
                <li class="nav-item">
                    <c:if test="${sessionScope.loginMemberId eq 'admin'}">
                        <a class="nav-link" href="/member/admin?memberId=${sessionScope.loginMemberId}">관리자 페이지</a>
                    </c:if>
                </li>
                <li class="nav-item">
                    <c:if test="${!empty sessionScope.loginMemberId}">
                        <a class="nav-link" href="/member/myPage?id=${sessionScope.loginId}">My Page</a>
                    </c:if>
                </li>
            </ul>
            <button class="btn btn-outline-info" style="float: right" onclick="location.href='/book/findAll'">도서 전체 목록</button>
        </nav>
    </header>
</head>
<body>
<div class="container" style="width: 100%">
    <div class="form-floating">
        <table>
            <form action="/book/search" method="get">
                <div class="input-group mb-3">
                    <select class="form-select" style="max-width: 120px;" name="searchType">
                        <option selected value="bookTitle">도서 제목</option>
                        <option value="bookWriter">저자</option>
                        <option value="bookPublisher">출판사</option>
                    </select>
                    <input type="text" class="form-control" name="q" placeholder="도서검색" style="max-width: 450px" aria-label="Book search" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                        <button class="btn btn-outline-secondary" type="submit">검색</button>
                    </div>
                </div>
            </form>
        </table>
    </div>
</div>
</body>
</html>
