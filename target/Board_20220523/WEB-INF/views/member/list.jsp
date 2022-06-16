<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-03
  Time: 오전 9:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>회원 목록</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/jquery.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container">
    <h2 style="margin-top: 20px;">회원목록</h2>
    <table class="table">
        <tr>
            <th>회원번호</th>
            <th>아이디</th>
            <th>이름</th>
            <th>이메일</th>
            <th>조회</th>
            <th>삭제</th>
        </tr>
        <c:forEach items="${memberList}" var="member">
            <tr>
                <td>${member.id}</td>
                <td>${member.memberId}</td>
                <td>${member.memberName}</td>
                <td>${member.memberEmail}</td>
                <td><button class="btn btn-outline-info" onclick="location.href='/member/detail?id=${member.id}'">조회</button></td>
                <td><a href="/member/delete?id=${member.id}">삭제</a></td>
            </tr>
        </c:forEach>
    </table>
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
                    <a class="page-link" href="/member/findAll?page=${paging.page-1}">[이전]</a>
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
                        <a class="page-link" href="/member/findAll?page=${i}">${i}</a>
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
                    <a class="page-link" href="/member/findAll?page=${paging.page+1}">[다음]</a>
                </li>
            </c:otherwise>
        </c:choose>
    </ul>
</div>
</body>
</html>
