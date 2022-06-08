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
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <div class="container">
        <c:if test="${sessionScope.loginMemberId eq 'admin'}">
            <button class="btn btn-outline-info" style="float: right" onclick="bookUpdate()">도서 수정</button>
            <button class="btn btn-outline-danger" style="float: right" onclick="bookDelete()">도서 삭제</button>
        </c:if>

        <img src="${pageContext.request.contextPath}/upload/${book.bookFileName}"
             alt="" height="350" width="350">
        <h3 style="margin-top: 20px">${book.bookTitle}</h3>
        저자: ${book.bookWriter} | 출판사 : ${book.bookPublisher} | 출판일 : ${book.bookPublicationDate}<br>
        <h4>판매가 ${book.bookPrice}</h4>
        <h4>도서 소개</h4>
        <textarea rows="10" cols="50" readonly>${book.bookIntroduceContents}</textarea>
    </div>
    <div class="container">
        <button onclick="location.href='/purchase/reviewSave'">리뷰 작성</button>
        <div id="review-list">
            <p style="margin-top: 20px">리뷰 목록</p>
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
                    <c:if test="${sessionScope.loginMemberId eq review.reviewWriter}">
                        <td><input type="button" class="btn btn-outline-success" onclick="reviewUpdate()" value="수정"></td>
                        <td><input type="button" class="btn btn-outline-danger" onclick="reviewDelete()" value="삭제"></td>
                    </c:if>
                </tr>
                </c:forEach>
            </table>
        </div>
        <form action="/shopping/save?shoppingCartBookId=${book.id}&shoppingCartMemberId=${sessionScope.loginMemberId}" method="post">
            <input type="submit" class="btn btn-outline-primary" value="장바구니">
        </form>
        <input type="button" class="btn btn-outline-success" onclick="loginCheck2()" value="구매하기">
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

    const reviewWriterCheck = () => {
        const reviewWriter = document.getElementById("reviewWriter").value;
        const reviewContents = document.getElementById("reviewContents");
        if(reviewWriter == ""){
            reviewContents.readOnly = true;
        }
    }
    const loginCheck1 = () => {
        const memberId = ${sessionScope.loginMemberId}
        if(memberId != null){
            $.ajax({
                type: "post",
                url: "/shoppingCart/save",
                data: {"shoppingCartBookId": ${book.id}, "shoppingCartMemberId": ${sessionScope.loginMemberId}, "shoppingCartBookTitle": ${book.bookTitle}, "shoppingCartBookWriter": ${book.bookWriter}, "shoppingCartBookPublisher": ${book.bookPublisher}, "shoppingCartBookPublicationDate": ${book.bookPublicationDate}, "shoppingCartBookPrice": ${book.bookPrice},"shoppingCartBookFileName": ${book.bookFileName}},
                dataType: "json",
                success:function(result){
                    if(count(result.shoppingCartMemberId) == 0){
                        console.log(result);
                        alert("장바구니 저장완료");
                    }
                    else{
                        alert("장바구니에 저장되어 있습니다.")
                    }
                },
                error: function (){
                    alert("오타 수정");
                }
            });
        }
        else{
            alert("로그인을 해주세요.");
        }
    }
    const loginCheck2 = () => {

    }
</script>
</html>
