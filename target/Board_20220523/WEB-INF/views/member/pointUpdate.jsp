<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-14
  Time: 오후 1:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>구매 포인트 충전</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <div class="container">
        <h2 style="margin-top: 20px;">구매 포인트 충전</h2>
        <form action="/member/pointUpdate" method="post" name="pointUpdateForm">
            <table>
                <tr>
                    <td>회원 아이디</td>
                    <td><input type="text" class="form-control" name="memberId" value="${member.memberId}" readonly></td>
                </tr>
                <tr>
                    <td>회원 비밀번호</td>
                    <td><input type="password" class="form-control" id="password" name="memberPassword" placeholder="비밀번호 입력"></td>
                </tr>
                <tr>
                    <td>현재 포인트</td>
                    <td><input type="text" class="form-control" id="point" value="${member.memberPoint}" readonly></td>
                </tr>
                <tr>
                    <td>충전할 포인트</td>
                    <td><input type="text" class="form-control" id="addPoint" onblur="pointCheck()"></td>
                </tr>
                <tr>
                    <td>충전 후 포인트</td>
                    <td><input type="text" class="form-control" id="memberPoint" name="memberPoint" readonly></td>
                </tr>
            </table>
            <input type="button" class="btn btn-outline-secondary" onclick="pointUpdate()" value="충전하기">
            <input type="text" name="memberProfileName" class="form-control" style="visibility: hidden" value="${member.memberProfileName}" readonly><br>
            <input type="text" class="form-control" name="id" style="visibility: hidden" value="${member.id}" readonly><br>
            <input type="text" class="form-control" style="visibility: hidden" name="memberName" value="${member.memberName}" readonly><br>
            <input type="text" class="form-control" style="visibility: hidden" name="memberEmail" value="${member.memberEmail}"><br>
            <input type="text" class="form-control" style="visibility: hidden" name="memberMobile" value="${member.memberMobile}"><br>
        </form>
    </div>
</body>
<script>
    const pointCheck = () => {
        const point = document.getElementById("point").value;
        const addPoint = document.getElementById("addPoint").value;
        let memberPoint = document.getElementById("memberPoint");
        if(addPoint != 0){
            memberPoint.value = Number(point) + Number(addPoint);
        }
    }
    const pointUpdate = () => {
        const password = document.getElementById("password").value;
        if(password == "${sessionScope.loginPassword}"){
            pointUpdateForm.submit();
        }
        else {
            alert("비밀번호가 일치하지 않습니다.")
        }
    }
</script>
</html>
