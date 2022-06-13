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
        .container{
            max-width: 650px;
            margin-top: 20px;
            padding: 50px;
        }
        .mb-3{
            max-width: 90%;
            padding: 10px;
        }
        .bi {
            font-size: 20px;
        }
    </style>
    <header>
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
<div class="container mb-3">
    <button class="btn btn-outline-success" style="float: right" onclick="location.href='/book/findAll'">도서 전체 목록</button>
    <c:if test="${!empty sessionScope.loginMemberId and sessionScope.loginMemberId != 'admin'}">
        <button type="button" class="btn btn-outline-primary" style="float: right; margin-right: 10px;" onclick="location.href='/shoppingCart/findByMemberId?shoppingCartMemberId=${sessionScope.loginMemberId}'">장바구니</button>
    </c:if>
</div>
<div class="container">
    <div class="form-floating">
        <table>
            <form action="/book/search" method="get">
                <div class="input-group mt-5">
                    <select class="form-select" style="max-width: 120px;" name="searchType">
                        <option selected value="bookTitle">도서 제목</option>
                        <option value="bookWriter">저자</option>
                        <option value="bookPublisher">출판사</option>
                    </select>
                    <input type="text" class="form-control" name="q" placeholder="도서검색" style="max-width: 450px" aria-label="Book search" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                        <button class="btn btn-outline-secondary" style="height: 40px; width: 50px;" type="submit"><i class="bi bi-search"></i></button>
                    </div>
                </div>
            </form>
        </table>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
