<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="kr">
<head>
    <link rel = "stylesheet" type = "text/css" href = "../css/common.css">
    <link rel = "stylesheet" type = "text/css" href = "../css/resetPwPage.css?ss">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1 id = "title">
        비밀번호 재설정
    </h1>
    <form id = "resetPwBox">
        <div id = "newPwBox" class = "resetPwBoxItems">
            <div class = "constraintsBox">
                <div>새 비밀번호</div>
                <div id = "newPwConstraints" class = "constraints"></div>
            </div> 
            <div id = "newPwBottomItem"> 
                <input type = "password" placeholder= "영어 소문자, 숫자, 특수문자 포함 10 ~ 14자" class = inputs id = "newPw" oninput="newPwConstraintsEvent()">
            </div>
        </div>
        <div id = "newPwCheckBox" class = "resetPwBoxItems">
            <div class = "constraintsBox">
                <div>비밀번호 확인</div>
                <div id = "newPwCheckConstraints" class = "constraints"></div>
            </div>
            <input type = "password" class = inputs class = inputs id = "newPwCheck" oninput="newPwCheckEvent()">
        </div>
        <div id = "bottomButtons" class = "resetPwBoxItems">
            <div id = "backButton" onclick = "backButtonEvent()">
                <img src = "../img/back.png" id = "backImg">
                이전으로
            </div>
            <div id = "resetPwButton" onclick="resetPwButtonEvent()"> 비밀번호 재설정 </div>
        </div>
    </form>

    <script src = "../js/common.js"></script>
    <script src = "../js/resetPwPage.js?1"></script>
</body>
</html>