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
            width: 150px;
            height: 40px;
            float: right;
        }
        .table{
            border-color: white;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <div class="container">
        <c:if test="${sessionScope.loginMemberId eq 'admin'}">
            <button class="btn btn-outline-info" onclick="bookUpdate()">도서 수정</button>
            <button class="btn btn-outline-danger" onclick="bookDelete()">도서 삭제</button>
        </c:if>

    </div>
    <div class="container" style="margin-top: 20px;">
        <table class="table">
            <tr>
                <td> <h2 style="margin-top: 20px;">${book.bookTitle}</h2>
                저자: ${book.bookWriter} &nbsp;| &nbsp; 출판사 : ${book.bookPublisher} &nbsp;  | &nbsp; 출판일 : ${book.bookPublicationDate}<br></td>
            </tr>
            <tr>
                <td>
                    <img src="${pageContext.request.contextPath}/upload/${book.bookFileName}"
                         alt="" height="400" width="400" style="margin-top: 20px;">
                </td>
                <td>
                    <h5 style="margin-top: 20px;">도서 소개</h5>
                    <textarea rows="10" cols="50" class="form-control" readonly>${book.bookIntroduceContents}</textarea>
                    <h4 style="margin-top: 20px">판매가 ${book.bookPrice}</h4>
                    <input type="button" class="btn btn-outline-primary" onclick="loginCheck1()" value="장바구니 담기">
                    <input type="button" class="btn btn-outline-info" onclick="location.href='/review/save?bookId=${book.id}'" value="review 작성">
                    <input type="button" class="btn btn-outline-success" onclick="loginCheck2()" value="구매하기">
                </td>
            </tr>
        </table>
        <div id="review-list">
            <p style="margin-top: 50px">review 목록</p>
            <table class="table">
                <tr>
                    <th>review 번호</th>
                    <th>작성자</th>
                    <th>review 제목</th>
                    <th>작성시간</th>
                    <th><p style="visibility: hidden;">수정</p></th>
                    <th><p style="visibility: hidden;">삭제</p></th>
                </tr>
                <c:forEach items="${reviewList}" var="review">
                    <tr>
                        <td>${review.id}</td>
                        <td>${review.reviewWriter}</td>
                        <td><a href="/review/detail?id=${review.id}">${review.reviewTitle}</a></td>
                        <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${review.reviewCreatedDate}"></fmt:formatDate></td>
                        <c:if test="${sessionScope.loginMemberId eq review.reviewWriter}">
                            <td><button onclick="location.href='/review/update?id=${review.id}'" >수정</button></td>
                        </c:if>
                        <c:if test="${sessionScope.loginMemberId eq review.reviewWriter or sessionScope.loginMemberId eq 'admin'}">
                        <td><button onclick="location.href='/review/delete?id=${review.id}&bookId=${review.bookId}'">삭제</button></td>
                        </c:if>
                    </tr>
                </c:forEach>
            </table>
        </div>
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
        const memberId = '${sessionScope.loginMemberId}';
        if('${book.bookCounts}' == 0){
            alert("재고가 없으므로 구매할 수 없습니다.");
        }
        else{
            if(memberId != "" && memberId != "admin"){
                location.href = "/purchase/save?purchaseBookId=${book.id}"
            }
            else{
                alert("비회원 또는 관리자는 구매할 수 없습니다.");
            }
        }
    }
</script>
</html>
