<%--
  Created by IntelliJ IDEA.
  User: oh023
  Date: 2022-06-06
  Time: 오후 11:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>도서 정보 수정</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <style>
        .container {
            margin-top: 50px;
        }
        .btn {
            width: 230px;
            height: 45px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container mb-3">
        <h2>도서 정보 수정</h2>
        <form action="/book/update" method="post" name="updateForm">
            도서 번호 <input type="text" class="form-control" name="id" value="${updateBook.id}" readonly>
            도서 판매 권수 <input type="text" class="form-control" name="bookCounts" value="${updateBook.bookCounts}"><br>
            도서 제목  <input type="text" class="form-control" name="bookTitle" value="${updateBook.bookTitle}" readonly><br>
            도서 관리자 <input type="text" class="form-control" id="bookAdmin" name="bookAdmin" value="${updateBook.bookAdmin}" readonly><br>
            도서 저자 <input type="text" class="form-control" name="bookWriter" value="${updateBook.bookWriter}" readonly><br>
            도서 출판사 <input type="text" class="form-control" name="bookPublisher" value="${updateBook.bookPublisher}" readonly><br>
            도서 출판일 <input type="text" class="form-control" name="bookPublicationDate" value="${updateBook.bookPublicationDate}" readonly><br>
            도서 소개  <input class="form-control" name="bookIntroduceContents" rows="5" cols="100" value="${updateBook.bookIntroduceContents}" readonly><br>
            도서 가격 <input type="text" class="form-control" name="bookPrice" value="${updateBook.bookPrice}"><br>
            도서 첨부파일 <input type="file" name="bookFileName" value="${updateBook.bookFileName}"><br>
            <input type="button" class="btn btn-outline-primary" onclick="location.href='/book/findAll'" value="취소">
            <input type="button" class="btn btn-primary" onclick="bookUpdate()" value="도서 수정">
        </form>
    </div>
</body>
<script>
    const bookUpdate = () => {
        const bookAdmin = document.getElementById("bookAdmin").value;
        if(bookAdmin == "admin"){
            updateForm.submit();
        }
        else{
            alert("작성자가 틀립니다.");
        }
    }

</script>

</html>
