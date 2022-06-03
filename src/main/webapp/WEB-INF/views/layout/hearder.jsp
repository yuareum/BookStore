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
        </nav>
    </header>
</head>
<body>
</body>
</html>
