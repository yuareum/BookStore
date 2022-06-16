<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-14
  Time: 오전 8:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>구매 내역 상세 조회</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <div class="container">
        <h2 style="margin: 20px;">구매 내역 상세 조회</h2>
        <table class="table">
            <tr>
                <td><p style="visibility: hidden">구매 도서 첨부파일</p></td>
                <td>구매 번호</td>
                <td>구매 도서 제목</td>
                <td>구매 회원</td>
                <td>구매 도서 권수</td>
                <td>도서 가격</td>
                <td>총 결재 가격</td>
                <td>배송지</td>
                <td>구매 회원 전화번호</td>
                <td>구매일</td>
            </tr>
            <tr>
                <td><img src="${pageContext.request.contextPath}/upload/${purchase.purchaseBookFileName}" alt="" height="100" width="100"></td>
                <td>${purchase.id}</td>
                <td>${purchase.purchaseBookTitle}</td>
                <td>${purchase.purchaseMemberId}</td>
                <td>${purchase.purchaseBookCounts}</td>
                <td>${purchase.purchaseBookPrice}</td>
                <td>${purchase.purchaseTotalPrice}</td>
                <td>${purchase.purchaseAddress}</td>
                <td>${purchase.purchaseMobile}</td>
                <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${purchase.purchaseCreatedDate}"></fmt:formatDate></td>
            </tr>
        </table>
    </div>
</body>
</html>
