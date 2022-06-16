<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-14
  Time: 오전 10:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>리뷰 작성</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
    <style>
        .container {
            margin-top: 20px;
        }
        .btn{
            margin-top: 20px;
            margin-left: 15px;
            width: 150px;
            height: 40px;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <div class="container">
        <h2>리뷰작성</h2>
        <form action="/review/save" method="post">
            리뷰 도서 번호 <input type="text" class="form-control" name="bookId" value="${book.id}" readonly>
            리뷰 제목 <input type="text" class="form-control" name="reviewTitle" placeholder="리뷰 제목">
            리뷰 작성자 <input type="text" class="form-control" name="reviewWriter" value="${sessionScope.loginMemberId}" readonly>
            리뷰 내용 <textarea class="form-control" cols="20" rows="10" name="reviewContents"></textarea>
            <input type="button" class="btn btn-outline-dark" onclick="location.href='/book/detail?id=${book.id}'" value="취소하기">
            <input type="submit" class="btn btn-primary" value="리뷰작성">
        </form>
    </div>
</body>
</html>
