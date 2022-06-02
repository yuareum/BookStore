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
    <style>
        .d-flex {
            margin: 0px;
            width: 100%;
        }
    </style>
</head>
<body>
    <div class="container" style="width: 100%">
        <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
            <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
                <li><a href="/" class="nav-link px-2 link-secondary">Home</a></li>
                <c:if test="${empty sessionScope.loginMemberId}">
                    <li><a href="/member/login"  class="nav-link px-2 link-dark">로그인</a></li>
                </c:if>
                <c:if test="${!empty sessionScope.loginMemberId}">
                    <li><a href="/member/logout" class="nav-link px-2 link-dark">로그아웃</a></li>
                </c:if>
                <c:if test="${empty sessionScope.loginMemberId}">
                    <li><a href="/member/save" class="nav-link px-2 link-dark">회원가입</a></li>
                </c:if>
                <c:if test="${sessionScope.loginMemberId eq 'admin'}">
                    <li><a href="/member/admin?memberId=${sessionScope.loginMemberId}" class="nav-link px-2 link-dark">관리자 페이지</a></li>
                </c:if>
                <c:if test="${!empty sessionScope.loginMemberId}">
                    <li><a href="/member/myPage?id=${sessionScope.loginId}" class="nav-link px-2 link-dark">My Page</a></li>
                </c:if>
            </ul>
            <div class="col-md-3 text-end">
                <button type="button" onclick="location.href='/board/findAll'" class="btn btn-outline-dark me-2">글 목록</button>
            </div>
        </header>
    </div>
</body>
</html>
