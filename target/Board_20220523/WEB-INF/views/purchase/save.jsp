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
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <div class="container">
        <h2>도서 구매</h2>
        <form action="/purchase/save" method="post" name="purchase">
            도서 제목 <input type="text" class="form-control" name="purchaseBookTitle" value="${book.bookTitle}" readonly>
            구매 회원 <input type="text" class="form-control" name="purchaseMemberId" value="${sessionScope.loginMemberId}" readonly>
            구매자 전화번호 <input type="text" class="form-control" name="purchaseMobile" value="${sessionScope.loginMobile}" readonly>
            구매자 주소<input type="text" class="form-control" name="purchaseAddress">
            <table style="margin-top: 20px;">
                <tr>
                    <td>도서 가격</td>
                    <td><input type="text" name="purchaseBookPrice" value="${book.bookPrice}"></td>
                    <td>총 합계 가격</td>
                    <td><input type="text" id="totalPrice" name="purchaseTotalPrice" readonly></td>
                </tr>
                <tr>
                    <td>구매할 도서 수</td>
                    <td><select id="purchaseBookCounts" name="purchaseBookCounts" onchange="purchaseBookCountsCheck()">
                        <option value="1" selected>1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                    </select></td>
                    <td>총 결제 금액</td>
                    <td><input type="text" class="form-control" id="purchasePrice" name="purchasePrice"></td>
                </tr>
                <tr><td><input type="button" onclick="priceCheck()" value="결재하기"></td></tr>
            </table>
        </form>
    </div>
</body>
<script>
    const purchaseBookCountsCheck = () => {
        const purchaseBookCounts = document.getElementById("purchaseBookCounts").value;
        let totalPrice = document.getElementById("totalPrice");
        if(purchaseBookCounts > ${book.bookCounts}){
            totalPrice.value = "";
            alert("판매 권수가 적습니다. 더 적은 권수를 입력해주세요.")
        }
        else{
            totalPrice.value = purchaseBookCounts * ${book.bookPrice};
        }
    }
    const priceCheck = () => {
        const totalPrice = document.getElementById("totalPrice").value;
        const purchasePrice = document.getElementById("purchasePrice").value;
        if(totalPrice == purchasePrice){
            purchase.submit();
        }
        else{
            alert("총 결재 금액과 총 구매 가격이 일치하지 않습니다.");
        }
    }
</script>
</html>
