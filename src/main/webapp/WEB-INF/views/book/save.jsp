<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-03
  Time: 오전 10:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>도서등록 페이지</title>
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
        <h2>도서 등록</h2>
        <form action="/book/save" method="post" enctype="multipart/form-data">
            도서 판매 권수: <input type="text" class="form-control" name="bookCounts" placeholder="도서 판매 권수"><br>
            도서 제목:  <input type="text" class="form-control" name="bookTitle" placeholder="도서 제목"><br>
            도서 관리자: <input type="text" class="form-control" name="bookAdmin" value="${sessionScope.loginMemberId}"><br>
            도서 저자 : <input type="text" class="form-control" name="bookWriter" placeholder="도서 저자"><br>
            도서 출판사: <input type="text" class="form-control" name="bookPublisher" placeholder="도서 출판사"><br>
            도서 출판일: <input type="text" class="  form-control" name="bookPublicationDate" placeholder="도서 출판일"><br>
            도서 소개:  <textarea class="form-control" name="bookIntroduceContents" rows="5" cols="100"></textarea><br>
            도서 가격: <input type="text" class="form-control" name="bookPrice" placeholder="도서 가격"><br>
            도서 첨부파일: <input type="file" name="bookFile"><br>
            <input type="button" class="btn btn-outline-primary" onclick="location.href='/member/admin?memberId=${sessionScope.loginMemberId}'" value="취소">
            <input type="submit" class="btn btn-primary" value="도서 등록">
        </form>
    </div>
</body>
</html>
