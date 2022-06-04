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
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <div class="container mb-3">
        <h2>회원 상세 정보</h2>
        <button class="btn btn-info" style="float: right;" onclick="location.href='/member/findAll'">회원목록</button>
        <table class="table">
            <tr>
                <td>회원번호</td>
                <td>아이디</td>
                <td>비밀번호</td>
                <td>이름</td>
                <td>이메일</td>
                <td>전화번호</td>
                <td>프로필사진</td>
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
