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
    <header>
        <nav class="navbar navbar-expand-sm navbar-dark bg-dark" aria-label="Third navbar example">
            <div class="container-fluid">
                <a class="navbar-brand" href="#" style="font-style: oblique">BookStore</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample03" aria-controls="navbarsExample03" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarsExample03">
                    <ul class="navbar-nav me-auto mb-2 mb-sm-0">
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
                            <c:if test="${!empty sessionScope.loginMemberId}">
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
</body>
</html>
