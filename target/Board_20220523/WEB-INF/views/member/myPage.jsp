<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-03
  Time: 오전 9:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>My Page</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
    <style>
        .container {
            margin-left: 400px;
            max-width: 1000px;
        }
        .form-control{
            width: 680px;
            height: 50px;
        }
        .btn{
            float: right;
            margin-left: 10px;
        }

    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container">
    <h2 style="margin-top: 20px;">My Page</h2>
    <button class="btn btn-outline-success" onclick="location.href='/book/findAll'">도서 전체 목록</button>
    <button class="btn btn-outline-primary"  onclick="location.href='/shoppingCart/findByMemberId?shoppingCartMemberId=${sessionScope.loginMemberId}'">장바구니</button>
    <button class="btn btn-dark" onclick="location.href='/purchase/findByMemberId?purchaseMemberId=${sessionScope.loginMemberId}'">구매 도서 목록</button>
    <ul style="margin-top: 20px" class="nav nav-tabs">
        <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="/member/myPage?id=${sessionScope.loginId}">Profile</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/member/update?id=${sessionScope.loginId}">회원 정보 수정</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/member/withdrawal?id=${sessionScope.loginId}">회원탈퇴</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/member/pointUpdate?id=${sessionScope.loginId}">포인트 충전</a>
        </li>
    </ul>
        <h3 style="margin-top: 20px">Profile</h3><br>
        <img src="${pageContext.request.contextPath}/upload/${member.memberProfileName}"
             alt="" height="200" width="200" style="margin-bottom: 10px;"><br>
        아이디 <input type="text" class="form-control"  value="${member.memberId}" readonly><br>
        비밀번호 <input type="password" class="form-control" value="${member.memberPassword}" readonly><br>
        이름 <input type="text" class="form-control" value="${member.memberName}" readonly><br>
        이메일 <input type="text" class="form-control" value="${member.memberEmail}" readonly><br>
        전화번호 <input type="text" class="form-control" value="${member.memberMobile}" readonly><br>
        포인트 <input type="text" class="form-control" value="${member.memberPoint}" readonly>
</div>
</body>
</html>
