<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.ArrayList"%>

<%
    request.setCharacterEncoding("utf-8");
    String idValue = request.getParameter("idValue");
    String pwValue = request.getParameter("pwValue");

    Class.forName("com.mysql.jdbc.Driver");

    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/daily","stageus","0116");

    String sql = "SELECT * FROM account WHERE id = ? AND pw = ?";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1,idValue);
    query.setString(2,pwValue);
    ResultSet result = query.executeQuery();

    int check = 0;

    ArrayList<String> accountNumList = new ArrayList<String>();
    
    int length = 0;

    while(result.next()){
        String accountNum = result.getString(1);
        accountNumList.add("\"" + accountNum + "\"");
        length ++;
    }
    if (length > 0){
        session.setAttribute("accountNum",accountNumList.get(0));
    }
%>



<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <script>
        var length = <%=length%>;
        var idValue = <%= "\"" + idValue + "\"" %>;
        if(length > 0){
            location = "../page/schedulerPage.jsp"
        }
        else{
            location = "../index.jsp"
            alert("비밀번호 또는 아이디가 틀렸습니다")
        }
    </script>
</body>
</html>