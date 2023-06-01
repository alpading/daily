<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="kr">
<head>
    <link rel = "stylesheet" type = "text/css" href = "../css/common.css">
    <link rel = "stylesheet" type = "text/css" href = "../css/signupPage.css?sd">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1 id = "title">
        회원가입
    </h1>
    <form id = "signupBox">
        <div id = "nameBox" class = "signupBoxItems">
            <div class = "constraintsBox">
                <div>이름</div>
                <div id = "nameConstraints" class = "constraints"></div>
            </div> 
            <input type = "text" placeholder="한글이나 영어 2 ~ 10자" class = inputs id = "name" oninput="nameConstraintsEvent()">
        </div>
        <div id = "idBox" class = "signupBoxItems">
            <div class = "constraintsBox">
                <div>아이디</div>
                <div id = "idConstraints" class = "constraints"></div>
            </div> 
            <div id = "idBottomItem"> 
                <input type = "text" placeholder="영어 소문자, 숫자 포함 6 ~ 10자" class = inputs id = "id" oninput="idConstraintsEvent()">
                <div id = "idCheckButton" onclick="idCheckEvent()">중복체크</div>
            </div>
        </div>
        <div id = "pwBox" class = "signupBoxItems">
            <div class = "constraintsBox">
                <div>비밀번호</div>
                <div id = "pwConstraints" class = "constraints"></div>
            </div>
            <input type = "password" placeholder="영어 소문자, 숫자, 특수문자 포함 10 ~ 14자" class = inputs id = "pw" oninput="pwConstraintsEvent()">
        </div>
        <div id = "pwCheckBox" class = "signupBoxItems">
            <div class = "constraintsBox">
                <div>비밀번호 확인</div>
                <div id = "pwCheckConstraints" class = "constraints"></div>
            </div>
            <input type = "password" class = inputs class = inputs id = "pwCheck" oninput="pwCheckEvent()">
        </div>
        <div id = "phoneBox" class = "signupBoxItems">
            <div class = "constraintsBox">
                <div>전화번호</div>
                <div id = "phoneConstraints" class = "constraints"></div>
            </div>
            <input type = "text" placeholder="숫자 11자" class = inputs id = "phone" oninput="phoneConstraintEvent()">
        </div>
        <div id = "selectPositionBox" class = "signupBoxItems">
            <div id = "position">직급</div>
            <div id = "managerButton" class = "positionButtons"  onclick = "positionCheckEvent(this.id)">관리자</div>
            <div id = "leaderButton" class = "positionButtons" onclick = "positionCheckEvent(this.id)">팀장</div> 
            <div id = "staffButton" class = "positionButtons" onclick = "positionCheckEvent(this.id)">사원</div> 
        </div>
        <div id = "bottomButtons" class = "signupBoxItems">
            <div id = "backButton" onclick = "backButtonEvent()">
                <img src = "../img/back.png" id = "backImg">
                이전으로 
            </div>
            <div id = "signupButton" onclick="signupButtonEvent()"> 회원가입 </div>
        </div>
    </form>

    <script src = "../js/common.js?s"></script>
    <script src = "../js/signupPage.js?s"></script>
</body>
</html>