<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.ArrayList"%>

<%  
    String findId = String.valueOf(session.getAttribute("findId"));
    session.invalidate();
    
%>

<!DOCTYPE html>
<html lang="kr">
<head>
    <link rel = "stylesheet" type = "text/css" href = "../css/common.css">
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
    <form id = "findIdBox" action = "../action/findIdAction.jsp" onsubmit = "return findIdButtonEvent()">
        <div id = "nameBox" class = "findIdBoxItems">
            <div class = "constraintsBox">
                <div>이름</div>
                <div id = "nameConstraints" class = "constraints"></div>
            </div> 
            <input type = "text" placeholder="한글이나 영어 2 ~ 10자" class = inputs id = "name" oninput="nameConstraintsEvent()" name = "nameValue">
        </div>
        <div id = "phoneBox" class = "findIdBoxItems">
            <div class = "constraintsBox">
                <div>전화번호</div>
                <div id = "phoneConstraints" class = "constraints"></div>
            </div>
            <input type = "text" placeholder="숫자 11자" class = inputs id = "phone" oninput="phoneConstraintEvent()" name = "phoneValue">
        </div>
        <div id = "resultBox" class = "findIdBoxItems"></div>   
        <div id = "bottomButtons" class = "findIdBoxItems">
            <div id = "backButton" onclick = "backButtonEvent()">
                <img src = "../img/back.png" id = "backImg">
                이전으로 
            </div>
            <input type = "submit" id = "findIdButton" value = "아이디 찾기">
        </div>
    </form>

    <script>
        var findId = <%=findId%>;
        console.log(findId);
        console.log(typeof(findId));
    </script>

    <script src = "../js/common.js"></script>
    <script src = "../js/findIdPage.js?ss"></script>
</body>
</html>