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
    <title>관리자 페이지</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
    <jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <div class="container">
        <h2>관리자 페이지</h2>
        <button class="btn btn-outline-dark" onclick="location.href='/book/save'">도서등록</button>
        <button class="btn btn-outline-success" onclick="location.href='/member/findAll'">회원 목록</button>
    </div>
</body>
</html>
