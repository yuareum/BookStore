<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-03
  Time: 오전 10:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원 정보 수정</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
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
    <h2 style="margin-top: 20px;">회원 정보 수정</h2>
    <button class="btn btn-dark" onclick="location.href='/purchase/findByMemberId?purchaseMemberId=${sessionScope.loginMemberId}'">구매 도서 목록</button>
    <ul style="margin-top: 20px" class="nav nav-tabs">
        <li class="nav-item">
            <a class="nav-link" href="/member/myPage?id=${sessionScope.loginId}">Profile</a>
        </li>
        <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="/member/update?id=${sessionScope.loginId}">회원 정보 수정</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/member/withdrawal?id=${sessionScope.loginId}">회원탈퇴</a>
        </li>
    </ul>
    <form action="/member/update" method="post" name="updateForm">
        <img src="${pageContext.request.contextPath}/upload/${updateMember.memberProfileName}"
             alt="" height="200" width="200" style="margin-bottom: 10px; margin-top: 20px;"><br>
        Profile 사진: <input type="text" name="memberProfileName" class="form-control" value="${updateMember.memberProfileName}" readonly><br>
        회원번호: <input type="text" class="form-control" name="id" value="${updateMember.id}" readonly><br>
        아이디: <input type="text" class="form-control" id="updateMemberId" name="memberId" value="${updateMember.memberId}" readonly><br>
        비밀번호: <input type="password" id="password"class="form-control" name="memberPassword"><br>
        이름: <input type="text" class="form-control" name="memberName" value="${updateMember.memberName}" readonly><br>
        이메일: <input type="text" class="form-control" name="memberEmail" value="${updateMember.memberEmail}"><br>
        전화번호:<input type="text" class="form-control" name="memberMobile" value="${updateMember.memberMobile}"><br>
        <input class="btn btn-primary" type="button" style="width: 180px; height: 50px" onclick="memberUpdate()" value="정보수정">
    </form>
</div>
</body>
<script>
    const memberUpdate = () => {
        const password = document.getElementById("password").value;
        if(password =="${updateMember.memberPassword}"){
            updateForm.submit();
        }
        else{
            alert("비밀번호가 일치하지 않으므로 변경할 수 없습니다.");
        }
    }
</script>
</html>
