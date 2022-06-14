<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-09
  Time: 오전 10:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>내 구매 목록</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
</head>
<body>
    <div class="container">
        <h2 style="margin-top: 20px">${sessionScope.loginMemberId} 구매 목록</h2>
        <table class="table">
            <tr>
                <td>도서 첨부 파일</td>
                <td>구매번호</td>
                <td>구매 도서 제목</td>
                <td>구매 회원</td>
                <td>구매일</td>
            </tr>
        <c:forEach items="${purchaseList}" var="purchase">
            <tr>
                <td><img src=${pageContext.request.contextPath}/upload/${purchase.purchaseBookFileName} alt="" height="100" width="100"></td>
                <td>${purchase.id}</td>
                <td><a href="/purchase/detail?id=${purchase.id}">${purchase.purchaseBookTitle}</a></td>
                <td>${purchase.purchaseMemberId}</td>
                <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${purchase.purchaseCreatedDate}"></fmt:formatDate></td>
            </tr>
        </c:forEach>
        </table>
    </div>
</body>
</html>
