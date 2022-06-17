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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <div class="container">
        <h2 style="margin-top: 20px;">도서 조회 결과</h2>
        <div class="form-floating" style="padding-left: 250px;">
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
                            <button class="btn btn-outline-secondary" style="height: 40px; width: 50px;" type="submit"><i class="bi bi-search"></i></button>
                        </div>
                    </div>
                </form>
            </table>
        </div>

        <div class="form-floating">
            <c:forEach items="${searchList}" var="search">
                <table style="margin-top: 20px">
                    <tr>
                        <td><img src="${pageContext.request.contextPath}/upload/${search.bookFileName}"
                                 alt="" height="120" width="150" onclick="location.href='/book/detail?id=${search.id}'"></td>
                        <td style="padding-left: 30px;">
                            <h4><a href="/book/detail?&id=${search.id}">${search.bookTitle}</a></h4>
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
</body>
</html>
