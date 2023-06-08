<%@ page language = "java" contentType="text/html" pageEncoding="utf-8" %>

<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.ArrayList"%>

<%
    String scheduleNumValue = request.getParameter("scheduleNumValue");

    Class.forName("com.mysql.jdbc.Driver");

    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/daily","stageus","0116");

    String sql = "DELETE FROM schedule WHERE schedule_num = ?";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1,scheduleNumValue);
    query.executeUpdate();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <script>
        var scheduleNumValue = <%=scheduleNumValue%>;
        console.log(scheduleNumValue);
        location = "../page/schedulerPage.jsp"
    </script>
</body>
</html>