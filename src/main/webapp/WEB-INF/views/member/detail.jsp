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
    <title>회원 상세 정보</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <div class="container mb-3">
        <h2 style="margin-top: 20px;">회원 상세 정보</h2>
        <button class="btn btn-info" style="float: right;" onclick="location.href='/member/findAll'">회원목록</button>
        <table class="table">
            <tr>
                <th>회원번호</th>
                <th>아이디</th>
                <th>비밀번호</th>
                <th>이름</th>
                <th>이메일</th>
                <th>전화번호</th>
                <th>프로필사진</th>
            </tr>
            <tr>
                <td>${member.id}</td>
                <td>${member.memberId}</td>
                <td>${member.memberPassword}</td>
                <td>${member.memberName}</td>
                <td>${member.memberEmail}</td>
                <td>${member.memberMobile}</td>
                <td><img src="${pageContext.request.contextPath}/upload/${member.memberProfileName}"
                         alt="" height="100" width="100"></td>
            </tr>
        </table>

    </div>
</body>
</html>
