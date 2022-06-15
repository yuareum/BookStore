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
            <input type="button" class="btn btn-outline-primary" id="button" onclick="payment()" value="결제하기">
            <input type="button" class="btn btn-outline-danger" onclick="purchaseComplete()" value="구매완료">
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
    const payment = () => {
        const purchaseAddress = document.getElementById("purchaseAddress").value;
        const purchaseBookCounts = document.getElementById("purchaseBookCounts").value;
        const purchaseTotalPrice = document.getElementById("purchaseTotalPrice").value;
        if(purchaseAddress != ""){
            if(purchaseBookCounts != 0){
                if(purchaseTotalPrice > ${sessionScope.loginPoint}){
                    alert("포인트가 부족합니다.");
                }
                else{
                    const purchaseResult = confirm("${book.bookTitle}을" + purchaseBookCounts + "권 구매하시겠습니까?");
                    if(purchaseResult) {
                        $.ajax({
                            type: "post",
                            url: "/member/purchaseUpdate",
                            data: {"id": '${sessionScope.loginId}', "memberPoint": ${sessionScope.loginPoint}-purchaseTotalPrice},
                            dataType: "json",
                            success:function (result){
                                if(result == 1){
                                    document.getElementById("button").disabled = true;
                                }
                                else{
                                    alert("결제가 되지 않았습니다.");
                                }
                            },
                            error: function (){
                                alert("오타체크");
                            }
                        });
                    }else{
                        alert("구매를 취소합니다.");
                    }
                }
            }
            else{
                alert("구매 권 수를 1권 이상 선택해주세요.");
            }
        }
        else {
            alert("배송지를 입력해주세요.");
        }
    }
    const purchaseComplete = () => {
        const purchaseBookCounts = document.getElementById("purchaseBookCounts").value;
        if(document.getElementById("button").clicked == true){
            $.ajax({
                type: "post",
                url: "/book/bookCountsUpdate",
                data: {"id": '${book.id}', "bookCounts": '${book.bookCounts}'-purchaseBookCounts},
                dataType: "json",
                success: function (result){
                    if(result == 1){
                        purchase.submit();
                        alert("구매완료");
                    }else{
                        alert("구매 실패");
                    }
                },
                error: function (){
                    alert("오타체크");
                }
            });
        }
        else {
            alert("결제를 완료해주세요.");
        }
    }
</script>
</html>
