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
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <style>
        input {
            margin-top: 10px;
        }
        .btn{
            float: right;
            width: 150px;
            height: 40px;
            margin-left: 10px;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <div class="container">
        <h2 style="margin-top: 20px;">도서 구매</h2>
        <form action="/purchase/save" method="post" name="purchase">
            <table style="margin-top: 20px;" class="table">
                <tr>
                    <td>도서 제목</td>
                    <td><input type="text" class="form-control" name="purchaseBookTitle" value="${book.bookTitle}" readonly></td>
                </tr>
                <tr>
                    <th>구매 회원</th>
                    <td><input type="text" class="form-control" name="purchaseMemberId" value="${sessionScope.loginMemberId}" readonly></td>
                </tr>
                <tr>
                    <th>구매자 전화번호</th>
                    <td><input type="text" class="form-control" name="purchaseMobile" value="${sessionScope.loginMobile}" readonly></td>
                </tr>
                <tr>
                    <th>배송지</th>
                    <td><input type="text" class="form-control" id="purchaseAddress" name="purchaseAddress"></td>
                </tr>
                <tr>
                    <td><input type="text" class="form-control" name="purchaseBookId" style="visibility: hidden;" value="${book.id}"></td>
                    <td><input type="text" name="purchaseBookFileName" value="${book.bookFileName}" style="visibility: hidden"></td>
                </tr>
                <tr>
                    <th>도서 가격</th>
                    <td><input type="text" class="form-control" name="purchaseBookPrice" value="${book.bookPrice}" readonly></td>
                </tr>
                <tr>
                    <th>판매 도서 권수</th>
                    <td><input type="text" class="form-control" id=bookCounts value="${book.bookCounts}" readonly></td>
                </tr>
                <tr>
                    <th>구매할 도서 권수</th>
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
                <tr>
                    <th>총 결제 금액</th>
                    <td><input type="text" class="form-control" id="purchaseTotalPrice" name="purchaseTotalPrice" readonly></td>
                </tr>
            </table>
            <input type="button" class="btn btn-outline-danger" onclick="purchaseComplete()" value="구매완료">
            <input type="button" class="btn btn-outline-primary" id="button" onclick="requestPay()" value="결제하기">
            <input type="button" class="btn btn-secondary" id="btn" onclick="location.href='/book/detail?id=${book.id}'" value="취소하기">
        </form>
    </div>
    <span id="payment" style="visibility: hidden;">

    </span>
</body>
<script>
    const purchaseBookCountsCheck = () => {
        const purchaseBookCounts = document.getElementById("purchaseBookCounts").value;
        let purchaseTotalPrice = document.getElementById("purchaseTotalPrice");
        if(purchaseBookCounts > ${book.bookCounts}){
            purchaseTotalPrice.value = "";
            alert("판매 권수가 적습니다. 더 적은 권수를 선택해주세요.");
        }
        else{
            purchaseTotalPrice.value = purchaseBookCounts * ${book.bookPrice};
        }
    }
    function requestPay() {
        const purchaseAddress = document.getElementById("purchaseAddress").value;
        const purchaseBookCounts = document.getElementById("purchaseBookCounts").value;
        const purchaseTotalPrice = document.getElementById("purchaseTotalPrice").value;
        if(purchaseAddress != ""){
            if(purchaseBookCounts != 0 && '${book.bookCounts}' != 0) {
                var IMP = window.IMP;
                IMP.init('imp43569804');

                IMP.request_pay({
                    pg: 'kakao',
                    pay_method: "card",
                    merchant_uid: 'merchant_' + new Date().getTime(),
                    name: '구매 도서 결제',
                    amount: purchaseTotalPrice,
                    buyer_email: '구매자이메일',
                    buyer_name: '구매자',
                    buyer_tel: '구매자 전화번호',
                    buyer_addr: '구매자 주소',
                    buyer_postcode: '123-456'
                }, function (rsp) {
                    console.log(rsp);
                    if (rsp.success) {
                        var msg = '결제가 완료되었습니다.';
                        msg += '고유ID : ' + rsp.imp_uid;
                        msg += '상점 거래ID : ' + rsp.merchant_uid;
                        msg += '결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;

                        document.getElementById("btn").disabled = true;
                        document.getElementById("button").disabled = true;
                        document.getElementById("payment").innerHTML = "ok";
                    } else {
                        var msg = '결제에 실패하였습니다.';
                        msg += '에러내용 : ' + rsp.error_msg;
                    }
                    alert(msg);
                });
            }
            else{
                alert("구매 권 수를 1권 이상 선택하지 않았거나 재고가 없으므로 결제를 진행할 수 없습니다.");
            }
        }
        else {
            alert("배송지를 입력해주세요.");
        }
    }
    const purchaseComplete = () => {
        const purchaseBookCounts = document.getElementById("purchaseBookCounts").value;
        if(document.getElementById("payment").innerHTML == "ok"){
            $.ajax({
                type: "post",
                url: "/book/bookCountsUpdate",
                data: {"id": '${book.id}', "bookCounts": '${book.bookCounts}'-purchaseBookCounts},
                dataType: "json",
                success: function (result){
                    if(result == 1){
                        purchase.submit();
                        alert("구매완료");
                    }
                    else{
                        alert("구매 실패");
                    }
                },
                error: function (){
                    alert("오타체크");
                }
            });
        }
        else {
            alert("결제를 완료되지 않았습니다.");
        }
    }
</script>
</html>
