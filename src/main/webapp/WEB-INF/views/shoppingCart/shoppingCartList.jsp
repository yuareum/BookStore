<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-08
  Time: 오전 8:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>장바구니</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <div class="container">
        <h3 style="margin-top: 20px;">${sessionScope.loginMemberId}회원의 장바구니 목록</h3>
        <c:forEach items="${shoppingCartList}" var="shoppingCart">
            <table style="margin-top: 20px;">
                <tr>
                    <td><img src="${pageContext.request.contextPath}/upload/${shoppingCart.shoppingCartBookFileName}"
                             alt="" height="120" width="100" onclick="location.href='/book/detail?id=${shoppingCart.shoppingCartBookId}'"></td>
                    <td>
                        <h4><a href="/book/detail?id=${shoppingCart.shoppingCartBookId}">${shoppingCart.shoppingCartBookTitle}</a></h4>
                        저자: ${shoppingCart.shoppingCartBookWriter} |
                        출판사: ${shoppingCart.shoppingCartBookPublisher} |
                        출판일: ${shoppingCart.shoppingCartBookPublicationDate}<br>
                        판매가: ${shoppingCart.shoppingCartBookPrice}
                    </td>
                    <td>
                        <input type="button" class="btn btn-outline-success" onclick="location.href='/purchase/save?purchaseBookId=${shoppingCart.shoppingCartBookId}'" value="구매하기">
                        <input type="button" class="btn btn-outline-danger" onclick="shoppingCartDelete()" value="장바구니 삭제">
                    </td>
                </tr>
            </table>
        </c:forEach>
    </div>
</body>
<script>
    const shoppingCartDelete = () => {
        $.ajax({
            type: "post",
            url: "/shoppingCart/delete",
            data: {"id": },
            dataType: "text",

        })
    }
</script>
</html>
