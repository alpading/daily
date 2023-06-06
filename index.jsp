<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="kr">
<head>
    <link rel = "stylesheet" type = "text/css" href = "css/common.css">
    <link rel = "stylesheet" type = "text/css" href = "css/index.css?">

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1 id = "title">
        OOO Scheduler
    </h1>
    <form id = "loginBox" action = "action/loginAction.jsp" onsubmit = "return loginButtonEvent()">
        <div class = "loginBoxItems">
            <div>아이디</div>
            <input type = "text" id = "id" class = "inputs" name = "idValue">
        </div>
        <div class = "loginBoxItems">
            <div>비밀번호</div>
            <input type = "password" id = "pw" class = "inputs" name = "pwValue">
        </div>
        <input type = "submit" id = "loginButton" class = "loginBoxItems" value = "로그인">
        <div id = "signupButton" class = "loginBoxItems" onclick = "signupButtonEvent()">회원가입</div>
        <div id = "findButtons" class = "loginBoxItems" >
            <div id = "findIdButton" onclick = "findIdButtonEvent()"> 아이디 찾기</div>
            <div id = "findPwButton" onclick = "findPwButtonEvent()"> 비밀번호 찾기</div>
        </div>
    </form>

    <script src = "js/index.js?s"></script>
</body>
</html>