<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-02
  Time: 오후 4:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원가입 페이지</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/jquery.js"></script>
    <style>
        body {
            background-color: #f2f3ff;
        }
        .btn {
            width: 150px;
            height: 40px;
        }
        .container{
            max-width: 680px;
            margin-top: 100px;
            padding: 30px;
            background-color: white;
            border: black;
            border-radius: 10px;
        }
        .form-floating{
            max-width: 600px;
            margin-top: 30px;
            padding: 30px;
            border-radius: 10px;
        }

        .form-control{
            width: 600px;
            height: 40px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2 style="text-align: center">회원가입</h2>
    <div class="form-floating">
        <form action="/member/save" method="post" enctype="multipart/form-data">
            아이디<br><input type="text" class="form-control" onblur="duplicateCheck()" id="memberId" name="memberId" placeholder="아이디를 입력해주세요.">
            <span id="dup-check-result"></span><br>
            비밀번호<br><input type="password" class="form-control" onblur="password1Check()" id="memberPassword" name="memberPassword" placeholder="비밀번호를 입력해주세요.">
            <span id="password1-check-result"></span><br>
            비밀번호 재확인<br> <input type="password" class="form-control" onblur="password2Check()" id="memberPassword2" placeholder="비밀번호 다시 입력해주세요.">
            <span id="password2-check-result"></span><br>
            이름<br><input type="text" class="form-control" onblur="nameCheck()" id="memberName" name="memberName" placeholder="이름을 입력해주세요.">
            <span id="name-check-result"></span><br>
            이메일<br><input type="text" class="form-control" name="memberEmail" placeholder="이메일을 입력해주세요."><br>
            전화번호<br>
            <input type="text" class="form-control" id="memberMobile" onblur="mobileCheck()" name="memberMobile" placeholder="전화번호 11자리를 입력해주세요.(-포함) ex)010-1111-1111">
            <span id="mobile-check-result"></span><br>
            프로필 사진 : <input type="file"  style="text-align: center; margin-bottom: 20px" name="memberProfile"><br>
            <input type="button" class="btn btn-outline-primary" onclick="location.href='/'" value="Home">
            <input type="submit" class="btn btn-primary" value="회원가입">
        </form>
    </div>
</div>
</body>
<script>
    const duplicateCheck = () => {
        const memberId = document.getElementById("memberId").value;
        const checkResult = document.getElementById("dup-check-result");
        const exp = /^[a-z\d-_]{5,20}$/;
        if(memberId.match(exp)) {
            $.ajax({
                type: "post",
                url: "/member/duplicate-check",
                data: {"memberId": memberId},
                dataType: "text",
                success: function (result) {
                    if (result == "ok") {
                        checkResult.innerHTML = "사용가능한 아이디입니다.";
                        checkResult.style.color = "green";
                    } else {
                        checkResult.innerHTML = "이미 사용 중인 아이디입니다.";
                        checkResult.style.color = "red";
                    }
                },
                error: function () {
                    alert("오타체크");
                }
            });
        }
        else{
            if(memberId.length == 0){
                checkResult.innerHTML = "필수 입력입니다.";
                checkResult.style.color = "red";
            }
            else{
                checkResult.innerHTML = "5~20자의 영문 소문자, 숫자, 특수문자(-,_)만 사용 가능합니다."
                checkResult.style.color = "red";
            }
        }
    }
    const password1Check = () => {
        const memberPassword = document.getElementById("memberPassword").value;
        const checkResult = document.getElementById("password1-check-result");
        const exp  = /[A-Za-z\d-_!#$.]{8,16}$/;
        if(memberPassword.match(exp)){
            checkResult.innerHTML = "사용가능한 비밀번호입니다.";
            checkResult.style.color = "green";
        }
            else{
                if(memberPassword.length == 0){
                    checkResult.innerHTML = "필수 입력입니다.";
                    checkResult.style.color = "red";
                }
                else{
                    checkResult.innerHTML = " 8~16자의 영문 대 소문자, 숫자, 특수문자(-,_,!,#,$,.)만 사용가능합니다.";
                    checkResult.style.color = "red";
                }
            }
        }
        const password2Check = () => {
            const memberpassword = document.getElementById("memberPassword").value;
            const memberpassword2 = document.getElementById("memberPassword2").value;
            const checkResult = document.getElementById("password2-check-result");
            if(memberpassword == memberpassword2){
                checkResult.innerHTML = "비밀번호가 일치합니다.";
                checkResult.style.color = "green";
            }
            else{
                if(memberpassword2.length == 0){
                    checkResult.innerHTML = "필수입력입니다.";
                    checkResult.style.color = "red";
                }
                else{
                    checkResult.innerHTML = "비밀번호가 일치하지 않습니다.";
                    checkResult.style.color = "red";
                }
            }
        }
        const nameCheck =() => {
            const memberName = document.getElementById("memberName").value;
            const checkResult = document.getElementById("name-check-result");
            const exp = /^[a-z|A-Z|ㄱ-ㅎ|가-힣]{1,20}$/
            if(memberName.match(exp)){
                checkResult.innerHTML = "";
            }
            else{
                if(memberName.length == 0){
                    checkResult.innerHTML = "필수 입력입니다.";
                    checkResult.style.color = "red";
                }
                else{
                    checkResult.innerHTML = "20자 이내 한글과 영문 대 소문자만 사용하세요."
                    checkResult.style.color = "red";
                }
            }
        }
        const mobileCheck = () => {
            const memberMobile = document.getElementById("memberMobile").value;
            const checkResult = document.getElementById("mobile-check-result");
            const exp = /^\d{3}-\d{4}-\d{4}$/;
            if(memberMobile.match(exp)){
                checkResult.innerHTML = "사용가능한 전화번호입니다.";
                checkResult.style.color = "green";
            }
            else{
                if(memberMobile.length == 0){
                    checkResult.innerHTML = "필수 입력입니다.";
                    checkResult.style.color = "red";
                }
                else{
                    checkResult.innerHTML = "숫자로 된 11자리(- 포함)가 아닙니다."
                    checkResult.style.color = "red";
                }
            }

        }
</script>
</html>
