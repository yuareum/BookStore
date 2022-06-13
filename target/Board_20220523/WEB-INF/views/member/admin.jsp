<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-03
  Time: 오전 9:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>관리자 페이지</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <div class="container">
        <h2 style="margin-top: 20px;">관리자 페이지</h2>

        <table>
            <tr>
                <td colspan="4">페이지 정보</td>
            </tr>
            <tr>
                <td>페이지 명 &nbsp;</td>
                <td>BookStore &nbsp;</td>
                <td>페이지 기능 &nbsp;</td>
                <td>온라인 회원제 서점</td>
            </tr>
            <tr>
                <td colspan=>회원관리 &nbsp;</td>
                <td colspan="3">
                    <button class="btn btn-outline-success" onclick="location.href='/member/findAll'">회원 목록</button>
                </td>
            </tr>
            <tr>
                <td>도서관리 &nbsp;</td>
                <td><button class="btn btn-outline-dark" onclick="location.href='/book/save'">도서등록</button>&nbsp;</td>
                <td colspan="2"><button class="btn btn-outline-success" onclick="location.href='/book/findAll'">도서 전체 목록</button></td>
            </tr>
            <tr>
                <td colspan="2">회원 구매 목록</td>
                <td colspan="2"><button class="btn btn-dark" onclick="location.href='/purchase/findAll'">회원 구매 목록</button> </td>
            </tr>
        </table>
    </div>
</body>
</html>
