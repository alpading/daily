<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.ArrayList"%>

<%
    String accountNum = session.getAttribute("accountNum").toString();
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/daily","stageus","0116");

    String sql = "SELECT * FROM account WHERE account_num = " + accountNum;
    PreparedStatement query = connect.prepareStatement(sql);
    ResultSet result = query.executeQuery();

    ArrayList<ArrayList<String>> accountData = new ArrayList<ArrayList<String>>();
    ArrayList<String> nameList = new ArrayList<String>();
    ArrayList<String> phoneList = new ArrayList<String>();

    while(result.next()){
        String name = result.getString(4);
        String phone = result.getString(5);
        nameList.add("\"" + name + "\"");
        phoneList.add("\"" + phone + "\"");
    }

    accountData.add(nameList);
    accountData.add(phoneList);
%>

<!DOCTYPE html>
<html lang="kr">
<head>
    <link rel = "stylesheet" type = "text/css" href = "../css/common.css">
    <link rel = "stylesheet" type = "text/css" href = "../css/modifyProfilePage.css?s">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1 id = "title">
        프로필 수정
    </h1>
    <form id = "modifyProfileBox" action = "../action/modifyProfileAction.jsp" onsubmit= "return modifyProfileButtonEvent()">
        <div id = "nameBox" class = "modifyProfileBoxItems">
            <div class = "constraintsBox">
                <div>이름</div>
                <div id = "nameConstraints" class = "constraints"></div>
            </div> 
            <input type = "text" placeholder="한글이나 영어 2 ~ 10자" class = inputs id = "name" name = "nameValue" oninput="nameConstraintsEvent()">
        </div>
        <div id = "phoneBox" class = "modifyProfileBoxItems">
            <div class = "constraintsBox">
                <div>전화번호</div>
                <div id = "phoneConstraints" class = "constraints"></div>
            </div>
            <input type = "text" placeholder="숫자 11자" class = inputs id = "phone" name = "phoneValue" oninput="phoneConstraintEvent()">
        </div>
        <div id = "modifyPwButton" class = "modifyProfileBoxItems" onclick = "modifyPwButtonEvent()">
        비밀번호 변경
        </div>
        <div id = "bottomButtons" class = "modifyProfileBoxItems">
            <div id = "cancleButton" onclick="cancleButtonEvent()"> 취소 </div>
            <input type = "submit" id = "modifyProfileButton" value = "프로필 수정">
        </div>
    </form>

    <script>
        var accountData = <%=accountData%>;
    </script>
    <script src = "../js/common.js?"></script>
    <script src = "../js/modifyProfilePage.js?ss"></script>
</body>
</html>