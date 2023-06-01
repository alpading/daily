<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="kr">
<head>
    <link rel = "stylesheet" type = "text/css" href = "../css/common.css">
    <link rel = "stylesheet" type = "text/css" href = "../css/findIdPage.css?">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1 id = "title">
        아이디 찾기
    </h1>
    <form id = "findIdBox">
        <div id = "nameBox" class = "findIdBoxItems">
            <div class = "constraintsBox">
                <div>이름</div>
                <div id = "nameConstraints" class = "constraints"></div>
            </div> 
            <input type = "text" placeholder="한글이나 영어 2 ~ 10자" class = inputs id = "name" oninput="nameConstraintsEvent()">
        </div>
        <div id = "phoneBox" class = "findIdBoxItems">
            <div class = "constraintsBox">
                <div>전화번호</div>
                <div id = "phoneConstraints" class = "constraints"></div>
            </div>
            <input type = "text" placeholder="숫자 11자" class = inputs id = "phone" oninput="phoneConstraintEvent()">
        </div>
        <div id = "resultBox" class = "findIdBoxItems"></div>   
        <div id = "bottomButtons" class = "findIdBoxItems">
            <div id = "backButton" onclick = "backButtonEvent()">
                <img src = "../img/back.png" id = "backImg">
                이전으로 
            </div>
            <div id = "findIdButton" onclick="signupButtonEvent()"> 아이디 찾기 </div>
        </div>
    </form>

    <script src = "../js/common.js"></script>
    <script src = "../js/findIdPage.js?s"></script>
</body>
</html>