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
    <h2 style="margin-top: 20px">회원탈퇴</h2>
    <button class="btn btn-dark" onclick="location.href='/purchase/findByMemberId?purchaseMemberId=${sessionScope.loginMemberId}'">구매 도서 목록</button>
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
    <form action="/member/withdrawal?id=${member.id}" method="post" name="withdrawal">
        <table style="margin-top: 20px;">
            <tr>
                <td>비밀번호 입력</td>
            </tr>
            <tr>
                <td><input type="password" id="memberPassword" class="form-control" placeholder="비밀번호"></td>
                <td><input type="button" class="btn btn-outline-danger" onclick="memberPasswordCheck()" value="회원탈퇴"></td>
            </tr>
        </table>
    </form>
</div>
</body>
<script>
    const memberPasswordCheck = () => {
        const memberPassword = document.getElementById("memberPassword").value;
        if(memberPassword == "${member.memberPassword}"){
            const withdrawalConfirm = confirm("회원을탈퇴하시겠습니까?");
            if(withdrawalConfirm){
                withdrawal.submit();
            }
        }
        else {
            alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
        }
    }
</script>
</html>
