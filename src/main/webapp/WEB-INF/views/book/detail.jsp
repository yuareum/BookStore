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
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <div class="container">
        <img src="${pageContext.request.contextPath}/upload/${book.bookFileName}"
             alt="" height="350" width="350">
        <h3>${book.bookTitle}</h3><br>
        저자: ${book.bookWriter} | 출판사 : ${book.bookPublisher} | 출판일 : ${book.bookPublicationDate}<br>
        <h4>판매가 ${book.bookPrice}</h4>
        <h4>도서 소개</h4>
        <textarea rows="10" cols="50">${book.bookIntroduceContents}</textarea>
    </div>
    <div class="container">
        리뷰 입력
        <div id="review-write" class="input-group mb-3">
            <div class="form-floating">
                <input type="text"  id="reviewWriter" class="form-control"  value="${sessionScope.loginMemberId}" placeholder="작성자" readonly>
                <label for="reviewWriter">작성자</label>
            </div>
        <div class="form-floating mb-3">
            <input type="text" onclick="reviewWriterCheck()" id="reviewContents" class="form-control" placeholder="내용">
            <label for="reviewContents">내용</label>
        </div>
        <button id="review-write-btn" style="width: 100px; height: 60px" class="btn btn-primary">리뷰작성</button>
    </div>
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
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
</body>
<script>
    $("#review-write-btn").click(function (){
    const reviewWriter = document.getElementById("reviewWriter").value;
    const reviewContents = $("#reviewContents").val();
    const bookId = '${book.id}';
        if(reviewContents != "") {
            $.ajax({
            type: "post",
            url: "/review/save",
            data: {"reviewWriter": reviewWriter, "reviewContents": reviewContents, "bookId": bookId},
            dataType: "json",
            success: function (result) {
            console.log(result);
            let output = "<table class='table'>";
                output += "<tr><th>리뷰번호</th>";
                    output += "<th>작성자</th>";
                    output += "<th>내용</th>";
                    output += "<th>작성시간</th></tr>";
                for(let i in result){
                output += "<tr>";
                    output += "<td>"+result[i].id+"</td>";
                    output += "<td>"+result[i].reviewWriter+"</td>";
                    output += "<td>"+result[i].reviewContents+"</td>";
                    output += "<td>"+moment(result[i].reviewCreatedDate).format("YYYY-MM-DD HH:mm:ss")+"</td>";
                    output += "</tr>";
                }
                output += "</table>";
                document.getElementById('review-list').innerHTML = output;
                document.getElementById('reviewWriter').value='${sessionScope.loginMemberId}';
                document.getElementById('reviewContents').value='';
            },
            error: function () {
                alert("오류");
            }
            });
        }
        else{
            alert("댓글을 작성해주세요.");
        }
    });
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
</script>
</html>
