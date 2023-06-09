<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="kr">
<head>
    <link rel = "stylesheet" type = "text/css" href = "../css/common.css">
    <link rel = "stylesheet" type = "text/css" href = "../css/findPwPage.css?ss">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1 id = "title">
        비밀번호 찾기
    </h1>
    <form id = "findPwBox" action = "../action/findPwAction.jsp" onsubmit = "return findPwButtonEvent()">
        <div id = "idBox" class = "findPwBoxItems">
            <div class = "constraintsBox">
                <div>아이디</div>
                <div id = "idConstraints" class = "constraints"></div>
            </div> 
            <div id = "idBottomItem"> 
                <input type = "text" placeholder="영어 소문자, 숫자 포함 6 ~ 10자" class = inputs id = "id" oninput="idConstraintsEvent()" name = "idValue">
            </div>
        </div>
        <div id = "nameBox" class = "findPwBoxItems">
            <div class = "constraintsBox">
                <div>이름</div>
                <div id = "nameConstraints" class = "constraints"></div>
            </div> 
            <input type = "text" placeholder="한글이나 영어 2 ~ 10자" class = inputs id = "name" oninput="nameConstraintsEvent()" name = "nameValue">
        </div>
        <div id = "phoneBox" class = "findPwBoxItems">
            <div class = "constraintsBox">
                <div>전화번호</div>
                <div id = "phoneConstraints" class = "constraints"></div>
            </div>
            <input type = "text" placeholder="숫자 11자" class = inputs id = "phone" oninput="phoneConstraintEvent()" name = "phoneValue">
        </div>
        <div id = "bottomButtons" class = "findPwBoxItems">
            <div id = "backButton" onclick = "backButtonEvent()">
                <img src = "../img/back.png" id = "backImg">
                이전으로 
            </div>
            <input type = "submit" id = "findPwButton" value = "비밀번호 재설정">
        </div>
    </form>

    <script src = "../js/common.js"></script>
    <script src = "../js/findPwPage.js?ss"></script>
</body>
</html>