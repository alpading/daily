<%@ page language = "java" contentType="text/html" pageEncoding="utf-8" %>

<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>

<%
    request.setCharacterEncoding("utf-8");
    String date = request.getParameter("dateValue");
    String time = request.getParameter("timeValue");
    String name = request.getParameter("nameValue");
    String datetime = date + " " + time;


    String accountNum = session.getAttribute("accountNum").toString();
    // int accountNum = Integer.parseInt(session.getAttribute("accountNum").toString());

    Class.forName("com.mysql.jdbc.Driver");

    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/daily","stageus","0116");

    String sql = "INSERT INTO schedule(account_account_num, datetime, name) VALUES(" + accountNum + ", ?, ?)";
    PreparedStatement query = connect.prepareStatement(sql);
    
    query.setString(1,datetime);
    query.setString(2,name);
    query.executeUpdate();
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
        location = "../page/schedulerPage.jsp";
    </script>
    
</body>
</html>