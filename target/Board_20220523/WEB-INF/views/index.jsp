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
        }
        .bi {
            font-size: 20px;
        }
        .form-floating{
            margin-left: 300px;
        }
        section {

        }
    </style>
    <header>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
        <nav class="navbar navbar-expand-lg bg-info">
            <div class="container-fluid">
                <a class="navbar-brand" href="#" style="font-style: oblique; margin-left: 50px;"><i class="bi bi-book"></i>BookStore</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent" style="margin-left: 50px;">
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
                            <c:if test="${sessionScope.loginMemberId eq 'admin'}">
                                <a class="nav-link" href="/member/admin?memberId=${sessionScope.loginMemberId}">관리자 페이지</a>
                            </c:if>
                        </li>
                        <li class="nav-item">
                            <c:if test="${!empty sessionScope.loginMemberId and sessionScope.loginMemberId != 'admin'}">
                                <a class="nav-link" href="/member/myPage?id=${sessionScope.loginId}">My Page</a>
                            </c:if>
                        </li>
                        <li class="nav-item">
                            <c:if test="${!empty sessionScope.loginMemberId and sessionScope.loginMemberId != 'admin'}">
                                <a class="nav-link" href="/shoppingCart/findByMemberId?shoppingCartMemberId=${sessionScope.loginMemberId}">장바구니</a>
                            </c:if>
                        </li>
                        <li class="nav-item">
                            <c:if test="${!empty sessionScope.loginMemberId}">
                                <a class="nav-link" href="/member/logout">로그아웃</a>
                            </c:if>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>
</head>
<body>
<section class="py-5 text-center container">
    <div class="row py-lg-5">
        <div class="col-lg-6 col-md-8 mx-auto">
            <h1 class="fw-light">BookStore</h1>
            <p class="lead text-muted">회원제로 운영하는 온라인 서점</p>
            <p>
                <button onclick="location.href ='/book/findAll'" class="btn btn-primary my-2">도서 전체 목록</button>
            </p>
        </div>
    </div>
</section>

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
    <div  style="margin-top: 20px;" class="row row-cols-1 row-cols-md-3 g-4">
        <div class="col">
            <div class="card h-100">
                <img src="/resources/img/img1.jpg" class="card-img-top" alt=" ">
                <div class="card-body">
                    <h5 class="card-title">세계 책의 날 - 매년 4월 23일</h5>
                    <p class="card-text">
                        세계 책의 날을 기념하여 다양한 독서 문화 행사가 진행
                    </p>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card h-100">
                <img src="/resources/img/img.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title">관리자 추천 도서</h5>
                    <p class="card-text">
                        도서 제목 - 머신러닝, 딥러닝<br>
                        4차 산업 혁명 시대 인공지능, 빅데이터 핵심기술 및 미래 전망 등을 토대로 4차 산업 혁명과 관련된 도서 추천
                    </p>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card h-100">
                <img src="/resources/img/img2.jpg" class="card-img-top" alt=" ">
                <div class="card-body">
                    <h5 class="card-title">독서 명언</h5>
                    <p class="card-text">. 훌륭한 독서 즉, 마음을 바로하고
                        참된 책들을 읽는 것은 고상한 행동이다.<br>
                        -헨리 데이비드 소로-
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
