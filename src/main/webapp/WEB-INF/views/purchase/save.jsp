<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-08
  Time: 오전 11:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>도서 구매 페이지</title>
    <script src="/resources/js/jquery.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
    <style>
        input {
            margin-top: 10px;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <div class="container">
        <h2 style="margin-top: 20px;">도서 구매</h2>
        <form action="/purchase/save" method="post" name="purchase">
            도서 제목 <input type="text" class="form-control" name="purchaseBookTitle" value="${book.bookTitle}" readonly>
            구매 회원 <input type="text" class="form-control" name="purchaseMemberId" value="${sessionScope.loginMemberId}" readonly>
            구매자 전화번호 <input type="text" class="form-control" name="purchaseMobile" value="${sessionScope.loginMobile}" readonly>
            배송지<input type="text" class="form-control" id="purchaseAddress" name="purchaseAddress">
            <input type="text" class="form-control" name="purchaseBookId" style="visibility: hidden;" value="${book.id}">
            <input type="text" name="purchaseBookFileName" value="${book.bookFileName}" style="visibility: hidden">
            <table style="margin-top: 20px;" class="table">
                <tr>
                    <td>도서 가격</td>
                    <td><input type="text" class="form-control" name="purchaseBookPrice" value="${book.bookPrice}"></td>
                </tr>
                <tr>
                    <td>구매할 도서 수</td>
                    <td><select id="purchaseBookCounts" class="form-select" name="purchaseBookCounts" onchange="purchaseBookCountsCheck()">
                        <option selected value=0>0</option>
                        <option value=1>1</option>
                        <option value=2>2</option>
                        <option value=3>3</option>
                        <option value=4>4</option>
                        <option value=5>5</option>
                        <option value=6>6</option>
                        <option value=7>7</option>
                        <option value=8>8</option>
                        <option value=9>9</option>
                        <option value=10>10</option>
                    </select></td>
                </tr>
            </table>
            <table class="table">
                <tr>
                    <td>결제내역</td>
                </tr>
                <tr>
                    <td>총 결제 금액</td>
                    <td><input type="text" class="form-control" id="purchaseTotalPrice" name="purchaseTotalPrice" value=0 readonly></td>
                </tr>
                <tr>
                    <td>내 포인트</td>
                    <td><input type="text" class="form-control" id="memberPoint" value="${sessionScope.loginPoint}" readonly></td>
                </tr>
            </table>
            <input type="button" class="btn btn-outline-primary" onclick="priceCheck()" value="결재하기">
        </form>
    </div>
</body>
<script>
    const purchaseBookCountsCheck = () => {
        const purchaseBookCounts = document.getElementById("purchaseBookCounts").value;
        let totalPrice = document.getElementById("purchaseTotalPrice");
        if(purchaseBookCounts > ${book.bookCounts}){
            totalPrice.value = "";
            alert("판매 권수가 적습니다. 더 적은 권수를 선택해주세요.")
        }
        else{
            totalPrice.value = purchaseBookCounts * ${book.bookPrice};
        }
    }
    const priceCheck = () => {
        const totalPrice = document.getElementById("purchaseTotalPrice");
        const purchaseAddress = document.getElementById("purchaseAddress").value;
        const memberPoint = document.getElementById("memberPoint").value;
        const purchaseBookCounts = document.getElementById("purchaseBookCounts").value;
        if(purchaseAddress != ""){
            if(totalPrice.value == 0){
                alert("구매할 권 수를 1개 이상 선택해주세요.");
            }
            else {
                if(memberPoint < totalPrice.value){
                    alert("포인트가 부족합니다.");
                }
                else{
                    confirm("${book.bookTitle}을 " + purchaseBookCounts +"권 구매하시겠습니까?");
                    purchase.submit();
                }
            }
        }
        else{
            alert("배송지를 입력해주세요.");
        }
    }
</script>
</html>
