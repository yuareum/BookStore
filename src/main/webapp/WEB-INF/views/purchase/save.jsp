<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-08
  Time: 오전 11:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>도서 구매 페이지</title>
</head>
<body>
    <div class="container">
        <h2>도서 구매</h2>
        <form action="/purchase/save" method="post">
            도서 제목<input type="text" name="purchaseBookTitle" value="${book.bookTitle}">
            도서 저자<input type="text" name="">
        </form>
    </div>
</body>
</html>
