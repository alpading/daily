<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>

<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/daily","stageus","0116");

    String nameValue = request.getParameter("nameValue");
    String idValue = request.getParameter("idValue");
    String pwValue = request.getParameter("pwValue");
    String phoneValue = request.getParameter("phoneValue");
    String positionValue = request.getParameter("positionValue");

    String sql = "INSERT INTO account(id, pw, name, phone, position) VALUES(?, ?, ?, ?, ?)";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1,idValue);
    query.setString(2,pwValue);
    query.setString(3,nameValue);
    query.setString(4,phoneValue);
    query.setString(5,positionValue);
    
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
        var positionValue = <%=positionValue%>
        location = "../page/schedulerPage.jsp"
    </script>
    
</body>
</html>