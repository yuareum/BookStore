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
            도서 제목<input type="text" class="form-control" name="purchaseBookTitle" value="${book.bookTitle}" readonly>
            구매자<input type="text" class="form-control" name="purchaseMemberId" value="${sessionScope.loginMemberId}" readonly>
            <table>
                <tr>
                    <td>구매할 도서 가격</td>
                    <td>${book.bookPrice}</td>
                </tr>
                <tr>
                    <td>구매할 도서 수</td>
                    <td><select id="purchaseBookCounts" name="purchaseBookCounts" onchange="purchaseBookCounts()">
                        <option value="1" selected>1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                    </select></td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
