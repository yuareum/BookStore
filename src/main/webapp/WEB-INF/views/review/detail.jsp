<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-16
  Time: 오후 2:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>리뷰 상세 조회</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <div class="container">
        <button style="margin-top: 20px; float: right;" class="btn btn-outline-secondary" onclick="location.href='/book/detail?id=${review.bookId}'">도서 상세 조회</button>
        <h2 style="margin-top: 20px">review 상세 조회</h2>
        <table class="table">
            <tr>
            <td> review 번호 &nbsp;
                ${review.id}
            </td>
            </tr>
            <tr>
                <td> 작성자 &nbsp;
                    ${review.reviewWriter} &nbsp;
                    작성일 &nbsp;
                    <fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${review.reviewCreatedDate}"></fmt:formatDate>
                </td>
            </tr>
            <tr>
                <td> 제목 &nbsp;
                    ${review.reviewTitle}
                </td>
            </tr>

            <tr>
                <td><textarea class="form-control" rows="10" cols="20">${review.reviewContents}</textarea></td>
            </tr>
        </table>
    </div>
</body>
</html>
