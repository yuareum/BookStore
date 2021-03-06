<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-03
  Time: 오전 10:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>도서 전체 목록</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
    <style>
        body{
            width: 100%;
        }

    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <div class="container">
        <h2 style="margin-top: 20px">도서 전체 목록</h2>
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
            <c:forEach items="${bookList}" var="book">
                <table style="margin-top: 20px" >
                    <tr>
                        <td><img src="${pageContext.request.contextPath}/upload/${book.bookFileName}"
                                  alt="" height="120" width="150" onclick="location.href='/book/detail?page=${paging.page}&id=${book.id}'"></td>
                        <td style="padding-left: 30px">
                            <h4><a href="/book/detail?page=${paging.page}&id=${book.id}">${book.bookTitle}</a></h4>
                            저자: ${book.bookWriter} |
                            출판사: ${book.bookPublisher} |
                            출판일: ${book.bookPublicationDate}<br>
                            판매가: ${book.bookPrice}
                        </td>
                    </tr>
                </table>
            </c:forEach>
        </div>
    </div>
    <div class="container">
        <ul class="pagination justify-content-center">
            <c:choose>
                <%-- 현재 페이지가 1페이지면 이전 글자만 보여줌. --%>
                <c:when test="${paging.page<=1}">
                    <li class="page-item disabled">
                        <a class="page-link">[이전]</a>
                    </li>
                </c:when>
                <%--1페이지가 아닌 경우에는 [이전]을 클릭하면 현재 페이지보다 1 작은 페이지 요청 --%>
                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link" href="/book/findAll?page=${paging.page-1}">[이전]</a>
                    </li>
                </c:otherwise>
            </c:choose>
            <%-- for(int i=startPage; i<=endPage; i++ --%>
            <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
                <c:choose>
                    <%-- 요청한 페이지에 있는 경우 현재 페이지 번호는 텍스트만 보이게 test:조건식,jsp 문법 ${} eq=equals 같은지--%>
                    <c:when test="${i eq paging.page}">
                        <li class="page-item active">
                            <a class="page-link">${i}</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item">
                            <a class="page-link" href="/book/findAll?page=${i}">${i}</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:choose>
                <c:when test="${paging.page>=paging.maxPage}">
                    <li class="page-item disabled">
                        <a class="page-link">[다음]</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link" href="/book/findAll?page=${paging.page+1}">[다음]</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
</body>
</html>
