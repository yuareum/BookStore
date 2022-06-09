<%--
  Created by IntelliJ IDEA.
  User: oh023
  Date: 2022-06-04
  Time: 오후 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원탈퇴</title>
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
    <h2>회원탈퇴</h2>
    <button class="btn btn-outline-primary" onclick="location.href='/shoppingCart/list?shoppingCartMemberId=${sessionScope.loginMemberId}'">장바구니</button>
    <button class="btn btn-info" onclick="location.href='/purchase/list?purchaseMemberId=${sessionScope.loginMemberId}'">구매 도서 목록</button>
    <ul style="margin-top: 20px" class="nav nav-tabs">
        <li class="nav-item">
            <a class="nav-link" href="/member/myPage?id=${sessionScope.loginId}">Profile</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/member/update?id=${sessionScope.loginId}">회원 정보 수정</a>
        </li>
        <li class="nav-item">
            <a class="nav-link active" aria-current="page"  href="/member/withdrawal?id=${sessionScope.loginId}">회원탈퇴</a>
        </li>
    </ul>
    <h3>회원 탈퇴</h3>
    <form action="/member/withdrawal?id=${member.id}" method="post" name="withdrawal">
    비밀번호 입력  <input type="password" id="memberPassword" class="form-control" placeholder="비밀번호">
    <input type="button" class="btn btn-outline-danger" onclick="memberPasswordCheck()" value="회원탈퇴">
    </form>
</div>
</body>
<script>
    const memberPasswordCheck = () => {
        const memberPassword = document.getElementById("memberPassword").value;
        if(memberPassword == "${member.memberPassword}"){
            withdrawal.submit();
        }
        else {
            alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
        }
    }
</script>
</html>
