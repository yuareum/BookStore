<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-14
  Time: 오후 1:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>구매 포인트 충전</title>
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

    .btn{
    float: right;
    margin-left: 10px;
    }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <div class="container">
        <h2 style="margin-top: 20px;">구매 포인트 충전</h2>
        <button class="btn btn-outline-success" onclick="location.href='/book/findAll'">도서 전체 목록</button>
        <button class="btn btn-outline-primary"  onclick="location.href='/shoppingCart/findByMemberId?shoppingCartMemberId=${sessionScope.loginMemberId}'">장바구니</button>
        <button class="btn btn-dark" onclick="location.href='/purchase/findByMemberId?purchaseMemberId=${sessionScope.loginMemberId}'">구매 도서 목록</button>
        <ul style="margin-top: 20px" class="nav nav-tabs">
            <li class="nav-item">
                <a class="nav-link" href="/member/myPage?id=${sessionScope.loginId}">Profile</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/member/update?id=${sessionScope.loginId}">회원 정보 수정</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/member/withdrawal?id=${sessionScope.loginId}">회원탈퇴</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="/member/pointUpdate?id=${sessionScope.loginId}">포인트 충전</a>
            </li>
        </ul>
        <form action="/member/pointUpdate" method="post" name="pointUpdateForm">
            <table class="table">
                <tr>
                    <td>회원 아이디</td>
                    <td><input type="text" class="form-control" name="memberId" value="${member.memberId}" readonly></td>
                </tr>
                <tr>
                    <td>회원 전화번호</td>
                    <td><input type="text" class="form-control" id="memberMobile" name="memberMobile"></td>
                </tr>
                <tr>
                    <td>현재 포인트</td>
                    <td><input type="text" class="form-control" id="point" value="${member.memberPoint}" readonly></td>
                </tr>
                <tr>
                    <td>충전할 포인트</td>
                    <td><input type="text" class="form-control" id="addPoint" onblur="pointCheck()"></td>
                </tr>
                <tr>
                    <td>충전 후 포인트</td>
                    <td><input type="text" class="form-control" id="memberPoint" name="memberPoint" readonly></td>
                </tr>
            </table>
            <input type="button" class="btn btn-outline-secondary" onclick="pointUpdate()" value="충전하기">
            <input type="text" name="memberProfileName" class="form-control" style="visibility: hidden" value="${member.memberProfileName}" readonly><br>
            <input type="text" class="form-control" name="id" style="visibility: hidden" value="${member.id}" readonly><br>
            <input type="text" class="form-control" style="visibility: hidden" name="memberName" value="${member.memberName}" readonly>
            <input type="text" class="form-control" style="visibility: hidden" name="memberEmail" value="${member.memberEmail}">
            <input type="password" class="form-control" style="visibility: hidden" name="memberPassword" value="${member.memberPassword}">
        </form>
    </div>
</body>
<script>
    const pointCheck = () => {
        const point = document.getElementById("point").value;
        const addPoint = document.getElementById("addPoint").value;
        let memberPoint = document.getElementById("memberPoint");
        if(addPoint != 0){
            memberPoint.value = Number(point) + Number(addPoint);
        }
    }
    const pointUpdate = () => {
        const memberMobile = document.getElementById("memberMobile").value;
        if(memberMobile == "${sessionScope.loginMobile}"){
            pointUpdateForm.submit();
        }
        else {
            alert("전화번호가 일치하지 않습니다.")
        }
    }
</script>
</html>
