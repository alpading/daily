<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="kr">
<head>
    <link rel = "stylesheet" type = "text/css" href = "../css/common.css">
    <link rel = "stylesheet" type = "text/css" href = "../css/modifyProfilePage.css">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1 id = "title">
        프로필 수정
    </h1>
    <form id = "modifyProfileBox">
        <div id = "nameBox" class = "modifyProfileBoxItems">
            <div class = "constraintsBox">
                <div>이름</div>
                <div id = "nameConstraints" class = "constraints"></div>
            </div> 
            <input type = "text" placeholder="10자 이내" class = inputs id = "name" onchange="nameConstraintsEvent()">
        </div>
        <div id = "phoneBox" class = "modifyProfileBoxItems">
            <div class = "constraintsBox">
                <div>전화번호</div>
                <div id = "phoneConstraints" class = "constraints"></div>
            </div>
            <input type = "text" placeholder="숫자 11자" class = inputs id = "phone" onchange="phoneConstraintEvent()">
        </div>
        <div id = "modifyPwButton" class = "modifyProfileBoxItems" onclick = "modifyPwButtonEvent()">
        비밀번호 변경
        </div>
        <div id = "bottomButtons" class = "modifyProfileBoxItems">
            <div id = "cancleButton" onclick="cancleButtonEvent()"> 취소 </div>
            <div id = "modifyProfileButton" onclick="modifyProfileButtonEvent()" > 프로필 수정 </div>
        </div>
    </form>
    <script src = "../js/common.js?"></script>
    <script src = "../js/modifyProfilePage.js?ss"></script>
</body>
</html>