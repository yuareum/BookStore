<%--
  Created by IntelliJ IDEA.
  User: oh023
  Date: 2022-06-06
  Time: 오후 10:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>도서 조회</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <div class="container">
        <h2>도서 조회 결과</h2>
        <div class="form-floating">
            <table>
                <form action="/book/search" method="get">
                    <div class="input-group mb-3">
                        <select class="form-select" style="max-width: 120px;" name="searchType">
                            <option selected value="bookTitle">도서 제목</option>
                            <option value="bookWriter">저자</option>
                            <option value="bookPublisher">출판사</option>
                        </select>
                        <input type="text" class="form-control" name="q" placeholder="도서검색" style="max-width: 450px" aria-label="Book search" aria-describedby="basic-addon2">
                        <div class="input-group-append">
                            <button class="btn btn-outline-secondary" type="submit">검색</button>
                        </div>
                        <i class="bi bi-cart3" onclick="location.href='/book/shoppingCart?id=${sessionScope.loginId}'"></i>
                    </div>
                </form>
            </table>
            <div class="form-floating">
                <c:forEach items="${searchList}" var="search">
                    <table style="margin-top: 20px">
                        <tr>
                            <td><img src="${pageContext.request.contextPath}/upload/${search.bookFileName}"
                                     alt="" height="120" width="100" onclick="location.href='/book/detail?page=${paging.page}&id=${search.id}'"></td>
                            <td>
                                <h4><a href="/book/detail?page=${paging.page}&id=${search.id}">${search.bookTitle}</a></h4>
                                저자: ${search.bookWriter} |
                                출판사: ${search.bookPublisher} |
                                출판일: ${search.bookPublicationDate}<br>
                                판매가: ${search.bookPrice}
                            </td>
                        </tr>
                    </table>
                </c:forEach>
            </div>
        </div>
    </div>
</body>
</html>
