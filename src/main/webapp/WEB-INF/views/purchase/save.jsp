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
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
                    <td><input type="text" class="form-control" name="purchaseBookPrice" value="${book.bookPrice}" readonly></td>
                </tr>
                <tr>
                    <td>판매 도서 권수</td>
                    <td><input type="text" class="form-control" id=bookCounts value="${book.bookCounts}" readonly></td>
                </tr>
                <tr>
                    <td>구매할 도서 권수</td>
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
                    <td>총 결제 금액</td>
                    <td><input type="text" class="form-control" id="purchaseTotalPrice" name="purchaseTotalPrice" readonly></td>
                </tr>
            </table>
            <input type="button" class="btn btn-secondary" onclick="location.href='/book/detail?id=${book.id}'" value="취소하기">

            <div class="card-body bg-white mt-0 shadow">
                <p style="font-weight: bold">카카오페이 현재 사용가능</p>
                <label class="box-radio-input"><input type="radio" name="cp_item" value="5000"><span>5,000원</span></label>
                <label class="box-radio-input"><input type="radio" name="cp_item" value="10000"><span>10,000원</span></label>
                <label class="box-radio-input"><input type="radio" name="cp_item" value="15000"><span>15,000원</span></label>
                <label class="box-radio-input"><input type="radio" name="cp_item" value="20000"><span>20,000원</span></label>
                <label class="box-radio-input"><input type="radio" name="cp_item" value="25000"><span>25,000원</span></label>
                <label class="box-radio-input"><input type="radio" name="cp_item" value="30000"><span>30,000원</span></label>
                <label class="box-radio-input"><input type="radio" name="cp_item" value="35000"><span>35,000원</span></label>
                <label class="box-radio-input"><input type="radio" name="cp_item" value="40000"><span>40,000원</span></label>
                <label class="box-radio-input"><input type="radio" name="cp_item" value="50000"><span>50,000원</span></label>
                <p  style="color: #ac2925; margin-top: 30px">카카오페이의 최소 충전금액은 5,000원이며 <br/>최대 충전금액은 50,000원 입니다.</p>
                <button type="button" class="btn btn-lg btn-block  btn-custom" id="charge_kakao">충 전 하 기</button>
            </div>
        </form>
    </div>
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

    $('#charge_kakao').click(function () {
        const purchaseTotalPrice = document.getElementById("purchaseTotalPrice").value;
        // getter
        var IMP = window.IMP;
        IMP.init('imp43569804');
        var money = $('input[name="cp_item"]:checked').val();
        console.log(money);

        IMP.request_pay({
            pg: 'kakao',
            merchant_uid: 'merchant_' + new Date().getTime(),

            name: '포인트 충전',
            amount: money,
            buyer_memberId: '${sessionScope.loginMemberId}',
            buyer_mobile: '${sessionScope.loginMobile}',
            buyer_address: document.getElementById("purchaseAddress").value,
        }, function (rsp) {
            console.log(rsp);
            if (rsp.success) {
                var msg = '결제가 완료되었습니다.';
                msg += '고유ID : ' + rsp.imp_uid;
                msg += '상점 거래ID : ' + rsp.merchant_uid;
                msg += '결제 금액 : ' + rsp.paid_amount;
                console.log("결제성공" + msg);
                $.ajax({
                    type: "post",
                    url: "/user/mypage/charge/point",
                    data: {
                        "amount": money
                    },
                });
            } else {
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
            }
            alert(msg);
            document.location.href = "/member/myPage"; //alert창 확인 후 이동할 url 설정
        });
    });
    const paymentCheck = () => {
        const button = document.getElementById("button");
        if(button.disabled){
            $.ajax({

            })
        }
        else {
            alert("결제를 완료해주세요.");
        }
    }
</script>
</html>
