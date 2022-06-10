<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-03
  Time: 오전 8:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <style>
        body{
            width: 100%;
        }
        .container {
            max-width: 400px;
            margin-top: 200px;
            width: 450px;
            height: 450px;
            padding: 30px;
            border-style: solid;
            border-width: 1px;
            background-color: white;
            border-radius: 10px;
        }
        .form-control {
            width: 340px;
            height: 50px;
        }
        .login {
            font-size: 30px;
            text-align: center;
            font-weight: bold;
            margin-top: 20px;
        }
        input{
            margin-top: 15px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="login">Login</h2>
        <form action="/member/login" method="post">
            <div style="font-size: 15px; margin-top: 15px">로그인 정보를 입력해주세요</div>
            <input type="text" id="memberId" class="form-control" name="memberId" placeholder="아이디">
            <input type="password" id="memberPassword"class="form-control" name="memberPassword" placeholder="비밀번호"><br>
            <input type="submit" class="w-100 btn btn-lg btn-outline-primary" value="로그인">
        </form>
        <input type="button" class="w-100 btn btn-lg btn-outline-dark" onclick="location.href='/'" value="Home">
    </div>
</body>
</html>
