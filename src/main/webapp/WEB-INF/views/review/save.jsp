<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-14
  Time: 오전 10:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>리뷰 작성</title>
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
            margin-left: 15px;
            width: 150px;
            height: 40px;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <div class="container">
        <h2>review 작성</h2>
        <form action="/review/save" method="post" name="reviewForm">
            review 도서 번호 <input type="text" class="form-control" name="bookId" value="${book.id}" readonly>
            review 제목 <input type="text" class="form-control" name="reviewTitle" onclick="purchaseCheck()" id="reviewTitle">
            review 작성자 <input type="text" class="form-control" id="reviewWriter" name="reviewWriter" value="${sessionScope.loginMemberId}" readonly>
            review 내용 <textarea class="form-control" cols="20" rows="10" id="reviewContents" name="reviewContents"></textarea>
            <input type="button" class="btn btn-outline-dark" onclick="location.href='/book/detail?id=${book.id}'" value="취소">
            <input type="button" class="btn btn-primary" onclick="reviewCheck()" value="review 작성">
        </form>
    </div>
</body>
<script>
    const purchaseCheck = () =>{
        $.ajax({
            type: "post",
            url: "/purchase/check",
            data: {"purchaseBookId": '${book.id}', "purchaseMemberId": '${sessionScope.loginMemberId}'},
            dataType: "json",
            success: function (result){
                if(result == 1){
                    console.log("result" + result);
                }
                else{
                    document.getElementById("reviewTitle").readOnly = true;
                    document.getElementById("reviewContents").readOnly = true;
                }
            },
            error: function (){
                alert("오타체크");
            }
        });
    }
    const reviewCheck  = () => {
        if(document.getElementById("reviewWriter").value==""){
            alert("review 제목을 작성해 주세요.");
        }
        else{
            if(document.getElementById("reviewContents").value==""){
                alert("review 내용을 작성해주세요.");
            }
            else{
                reviewForm.submit();
            }
        }
    }
</script>
</html>
