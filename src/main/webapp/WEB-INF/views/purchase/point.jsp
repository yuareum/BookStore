<%--
  Created by IntelliJ IDEA.
  User: oh023
  Date: 2022-06-16
  Time: 오전 12:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>포인트 충전 페이지</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">

</head>
<body>
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
</body>
<script>
    $('#charge_kakao').click(function () {
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
            buyer_email: 'iamport@siot.do',
            buyer_name: '구매자이름',
            buyer_tel: '010-1234-5678',
            buyer_addr: '인천광역시 부평구',
            buyer_postcode: '123-456'
        }, function (rsp) {
            console.log(rsp);
            if (rsp.success) {
                var msg = '결제가 완료되었습니다.';
                msg += '고유ID : ' + rsp.imp_uid;
                msg += '상점 거래ID : ' + rsp.merchant_uid;
                msg += '결제 금액 : ' + rsp.paid_amount;
                msg += '카드 승인번호 : ' + rsp.apply_num;
                $.ajax({
                    type: "GET",
                    url: "/member/pointUpdate", //충전 금액값을 보낼 url 설정
                    data: {
                        "amount" : money
                    },
                });
            } else {
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
            }
            alert(msg);
            document.location.href="/member/myPage?id=${sessionScope.loginId}"; //alert창 확인 후 이동할 url 설정
        });
    });
</script>
</html>
