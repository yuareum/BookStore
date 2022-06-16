<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-16
  Time: 오후 3:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>review 수정</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/jquery.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
    <style>
        .container {
            margin-top: 20px;
        }
        .btn{
            margin-top: 20px;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <div class="container">
        <h2>review 수정</h2>
        <div class="container">
            <form action="/review/update" method="post" name="updateForm">
                review 번호 <input type="text" class="form-control" name="id" value="${reviewUpdate.id}" readonly>
                review 도서 번호 <input type="text" class="form-control" name="bookId" value="${reviewUpdate.bookId}" readonly>
                review 제목 <input type="text" class="form-control" name="reviewTitle" id="reviewTitle" placeholder="review 제목" value="${reviewUpdate.reviewTitle}">
                review 작성자 <input type="text" class="form-control" id="reviewWriter" name="reviewWriter" value="${reviewUpdate.reviewWriter}" readonly>
                review 내용 <textarea class="form-control" cols="20" rows="10" id="reviewContents" name="reviewContents">${reviewUpdate.reviewContents}</textarea>
                <input type="button" class="btn btn-outline-dark" onclick="location.href='/book/detail?id=${reviewUpdate.bookId}'" value="취소">
                <input type="button" class="btn btn-primary" onclick="reviewUpdate()" value="review 수정">
            </form>
        </div>
    </div>
</body>
<script>
    const reviewUpdate = () => {
        const reviewWriter = document.getElementById("reviewWriter").value;
        if(reviewWriter == '${sessionScope.loginMemberId}'){
            updateForm.submit();
        }
        else{
            alert("작성자가 틀립니다.");
        }
    }
</script>
</html>
