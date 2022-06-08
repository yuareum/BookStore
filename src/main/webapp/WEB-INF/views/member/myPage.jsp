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
    <style>
        .container {
            margin-left: 400px;
            max-width: 1000px;
        }
        .form-control{
            width: 680px;
            height: 50px;
        }

    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container">
    <h2>My Page</h2>
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
            <a class="nav-link" href="/shoppingCart/shoppingCartList?shoppingCartMemberId=${sessionScope.loginMemberId}">장바구니</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/book/purchaseList?id=${sessionScope.loginId}">구매 도서 목록</a>
        </li>
    </ul>
        <h3 style="margin-top: 20px">Profile</h3><br>
        <img src="${pageContext.request.contextPath}/upload/${member.memberProfileName}"
             alt="" height="200" width="200"><br>
        아이디 <input type="text" class="form-control"  value="${member.memberId}" readonly><br>
        비밀번호 <input type="password" class="form-control" value="${member.memberPassword}" readonly><br>
        이름 <input type="text" class="form-control" value="${member.memberName}" readonly><br>
        이메일 <input type="text" class="form-control" value="${member.memberEmail}" readonly><br>
        전화번호 <input type="text" class="form-control" value="${member.memberMobile}" readonly><br>
</div>
</body>
</html>
