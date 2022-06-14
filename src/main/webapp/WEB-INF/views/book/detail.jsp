<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-03
  Time: 오후 1:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>도서 상세 조회</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/jquery.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
    <style>
        .btn {
            margin-top: 20px;
            margin-left: 10px;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <div class="container">
        <button class="btn btn-outline-success" style="float: right" onclick="location.href='/book/findAll'">도서 전체 목록</button>
        <c:if test="${!empty sessionScope.loginMemberId and sessionScope.loginMemberId != 'admin'}">
            <button class="btn btn-outline-primary" style="float: right;" onclick="location.href='/shoppingCart/findByMemberId?shoppingCartMemberId=${sessionScope.loginMemberId}'">장바구니</button>
        </c:if>
        <c:if test="${sessionScope.loginMemberId eq 'admin'}">
            <button class="btn btn-outline-info" style="float: right" onclick="bookUpdate()">도서 수정</button>
            <button class="btn btn-outline-danger" style="float: right" onclick="bookDelete()">도서 삭제</button>
        </c:if>
        <img src="${pageContext.request.contextPath}/upload/${book.bookFileName}"
             alt="" height="300" width="400" style="margin-top: 20px;">
        <h2 style="margin-top: 20px">${book.bookTitle}</h2>
        저자: ${book.bookWriter} | 출판사 : ${book.bookPublisher} | 출판일 : ${book.bookPublicationDate}<br>
        <h4 style="margin-top: 20px">판매가 ${book.bookPrice}</h4>
        <p>도서 소개</p>
        <textarea rows="10" cols="50" readonly>${book.bookIntroduceContents}</textarea>
    </div>
    <button onclick="location.href='/review/reviewList?reviewBookId=${book.id}">리뷰목록</button>
        <c:if test="${book.bookCounts != 0}">
            <input type="button" class="btn btn-outline-primary" onclick="loginCheck1()" value="장바구니 담기">
            <input type="button" class="btn btn-outline-success" onclick="loginCheck2()" value="구매하기">
        </c:if>
    </div>
</body>
<script>
    const bookUpdate = () => {
        const bookAdmin = "${book.bookAdmin}"
        if(bookAdmin == "admin"){
            location.href = "/book/update?id=${book.id}";
        }
        else{
            alert("관리자가 아니므로 도서를 수정할 수 없습니다.");
        }
    }

    const bookDelete = () => {
        const bookAdmin = "${book.bookAdmin}";
        if(bookAdmin == "admin"){
            location.href = "/book/delete?id=${book.id}";
        }
        else{
            alert("관리자가 아니므로 도서를 삭제할 수 없습니다.");
        }
    }
    const loginCheck1 = () => {
        const memberId = "${sessionScope.loginMemberId}";
        if(memberId != "" && memberId != "admin"){
            $.ajax({
                type: "post",
                url: "/shoppingCart/save",
                data: {"shoppingCartBookId": '${book.id}', "shoppingCartMemberId": '${sessionScope.loginMemberId}', "shoppingCartBookTitle": '${book.bookTitle}', "shoppingCartBookWriter": '${book.bookWriter}', "shoppingCartBookPublisher": '${book.bookPublisher}', "shoppingCartBookPublicationDate": '${book.bookPublicationDate}',
                    "shoppingCartBookPrice": '${book.bookPrice}',"shoppingCartBookFileName": '${book.bookFileName}'},
                dataType: "json",
                success: function (result) {
                    if(result == 1){
                        console.log("result" + result);
                        alert("장바구니에 담겼습니다.");
                    }
                    else {
                        alert("이미 장바구니에 담겨져 있습니다.");
                    }
                },
                error: function (){
                    alert("오타 체크");
                }
            });
        }
        else{
            alert("비회원 또는 관리자는 장바구니에 저장할 수 없습니다.");
        }
    }

    const loginCheck2 = () => {
        const memberId = '${sessionScope.loginMemberId}'
        if(memberId != "" && memberId != "admin"){
            location.href = "/purchase/save?purchaseBookId=${book.id}"
        }
        else{
            alert("비회원 또는 관리자는 구매할 수 없습니다.");
        }
    }


</script>
</html>
