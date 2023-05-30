<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="kr">
<head>
    <link rel = "stylesheet" type = "text/css" href = "../css/findIdPage.css?s">
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
            <input type = "text" placeholder="10자 이내" class = inputs id = "name" onchange="nameConstraintsEvent()">
        </div>
        <div id = "phoneBox" class = "findIdBoxItems">
            <div class = "constraintsBox">
                <div>전화번호</div>
                <div id = "phoneConstraints" class = "constraints"></div>
            </div>
            <input type = "text" placeholder="숫자 11자" class = inputs id = "phone" onchange="phoneConstraintEvent()">
        </div>
        <div id = "resultBox" class = "findIdBoxItems"></div>   
        <div id = "bottomButtons" class = "findIdBoxItems">
            <div id = "loginButton" onclick="loginButtonEvent()"> 로그인 </div>
            <div id = "findIdButton" onclick="signupButtonEvent()"> 아이디 찾기 </div>
        </div>
    </form>

    <script src = "../js/findIdPage.js"></script>
</body>
</html>