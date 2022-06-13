<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-03
  Time: 오전 9:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
    <style>
        .bi {
            font-size: 20px;
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
    <nav class="navbar navbar-expand-lg bg-info">
        <div class="container-fluid">
            <a class="navbar-brand" href="#" style="font-style: oblique;"><i class="bi bi-book"></i>BookStore</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/">Home</a>
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
                        <c:if test="${!empty sessionScope.loginMemberId and sessionScope.loginMemberId != 'admin'}">
                            <a class="nav-link" href="/member/myPage?id=${sessionScope.loginId}">My Page</a>
                        </c:if>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    </header>
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
