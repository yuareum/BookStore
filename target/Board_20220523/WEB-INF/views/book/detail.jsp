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
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <div class="container">
        <c:if test="${sessionScope.loginMemberId eq 'admin'}">
            <button class="btn btn-outline-info" style="float: right" onclick="bookUpdate()">도서 수정</button>
            <button class="btn btn-outline-danger" style="float: right" onclick="bookDelete()">도서 삭제</button>
        </c:if>
    </div>
    <div class="container" style="margin-top: 20px;">
        <table>
            <tr>
                <td>
                    <img src="${pageContext.request.contextPath}/upload/${book.bookFileName}"
                         alt="" height="300" width="400" style="margin-top: 20px;">
                </td>
                <td>
                    <p style="margin-top: 20px; margin-left: 100px;">도서 소개</p>
                    <textarea rows="10" cols="50" style="margin-left: 100px;" class="form-control" readonly>${book.bookIntroduceContents}</textarea>
                </td>
            </tr>
            <tr>
                <td> <h2 style="margin-top: 20px">${book.bookTitle}</h2></td>
                <td><input type="button" class="btn btn-outline-primary" style="margin-left: 100px;" onclick="loginCheck1()" value="장바구니 담기">
                    <c:if test="${book.bookCounts != 0}">
                        <input type="button" class="btn btn-outline-success" onclick="loginCheck2()" value="구매하기">
                    </c:if></td>
            </tr>
            <tr>
                <td>저자: ${book.bookWriter} | 출판사 : ${book.bookPublisher} | 출판일 : ${book.bookPublicationDate}<br></td>
            </tr>
            <tr>
                <td><h4 style="margin-top: 20px">판매가 ${book.bookPrice}</h4></td>
            </tr>
        </table>

        <div id="review-write" class="container">
            <p style="margin-top: 30px;">리뷰작성</p>
            작성자<input type="text" class="form-control" id="reviewWriter" name="reviewWriter" value="${sessionScope.loginMemberId}" readonly>
            내용<textarea class="form-control" rows="10" cols="20" id="reviewContents" name="reviewContents" onclick="purchaseCheck()"></textarea>
            <button class="btn btn-outline-info" style="float: right" onclick="reviewSave()">리뷰작성</button>
        </div>

        <div id="review-list"  class="container" style="margin-top: 80px;">
            <p>작성된 리뷰</p>
            <table class="table">
                <tr>
                    <td>리뷰번호</td>
                    <td>작성자</td>
                    <td>내용</td>
                    <td>작성시간</td>
                </tr>
                <c:forEach items="${reviewList}" var="review">
                    <tr>
                        <td>${review.id}</td>
                        <td>${review.reviewWriter}</td>
                        <td>${review.reviewContents}</td>
                        <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${review.reviewCreatedDate}"></fmt:formatDate></td>
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
        const memberId = '${sessionScope.loginMemberId}'
        if(memberId != "" && memberId != "admin"){
            location.href = "/purchase/save?purchaseBookId=${book.id}"
        }
        else{
            alert("비회원 또는 관리자는 구매할 수 없습니다.");
        }
    }

    const purchaseCheck = () => {
        const reviewContents = document.getElementById("reviewContents");
        $.ajax({
            type: "post",
            url: "/purchase/purchaseCheck",
            data:{"purchaseMemberId": '${sessionScope.loginMemberId}', "purchaseBookId": '${book.id}'},
            dataType: "json",
            success: function (result){
                if(result == 1){
                    console.log(result);
                }
                else{
                    reviewContents.readOnly = true;
                }
            },
            error: function (){
                alert("오타체크");
            }
        });
    }

    const reviewSave = () => {
        const reviewWriter = document.getElementById("reviewWriter").value;
        const reviewContents = document.getElementById("reviewContents").value;
        if(reviewContents == ""){
            alert("리뷰를 작성해주세요.")
        }
        else{
            $.ajax({
                type: "post",
                url: "review/save",
                data: {"bookId": '${book.id}', "reviewBookTitle": '${book.bookTitle}', "reviewWriter": reviewWriter, "reviewContents": reviewContents},
                dataType: "json",
                success: function (result){
                    console.log(result);
                },
                error: function () {
                    alert("오류");
                }
            });
        }
    }
</script>
</html>
